import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'feedbacks.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  FeedbackPageState createState() => FeedbackPageState();
}

class FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _feedbackController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isAnonymous = false;
  String? _selectedFile;
  bool _isLoading = false;

  Future<void> _sendFeedback() async {
    final feedback = _feedbackController.text.trim();
    final name = _nameController.text.trim();

    if (feedback.isEmpty || name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(
            'https://script.google.com/macros/s/AKfycbyWbZexaoAwLuJus8ZC_pHcrxIjLjkDaId5OxCwAGPgwi5seQawbLrdnj52Tib2uvi0FQ/exec'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'feedback': feedback,
          'name': name,
          'anonymous': _isAnonymous.toString(),
          'file': _selectedFile ?? 'No file',
        }),
      );

      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['status'] == 'success') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Feedback sent successfully!')),
          );
          _feedbackController.clear();
          _nameController.clear();
          setState(() {
            _isAnonymous = false;
            _selectedFile = null;
          });
        } else {
          throw 'Error: ${result['message']}';
        }
      } else {
        throw 'Failed to send feedback: HTTP ${response.statusCode}';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send feedback: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFile = result.files.single.path;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File selected: ${result.files.single.name}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "I thurawn leh chah duhte kan tan a hlu!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Hming',
                border: OutlineInputBorder(),
                hintText: 'Hming Chhutna...',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _feedbackController,
              decoration: const InputDecoration(
                labelText: 'Feedback',
                border: OutlineInputBorder(),
                hintText: 'I ngaihdan leh thuchah duh te min han hrilh ve ta che...',
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _pickFile,
                  icon: const Icon(Icons.attach_file),
                  label: const Text('Attach File'),
                ),
                const SizedBox(width: 10),
                if (_selectedFile != null)
                  Expanded(
                    child: Text(
                      'Selected: ${_selectedFile!.split('/').last}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.tealAccent),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton.icon(
              onPressed: _sendFeedback,
              icon: const Icon(Icons.send),
              label: const Text("Submit"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FeedbackListPage()),
                );
              },
              child: const Text("View Feedback Messages"),
            ),
          ],
        ),
      ),
    );
  }
}
