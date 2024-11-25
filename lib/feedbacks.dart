import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FeedbackListPage extends StatefulWidget {
  const FeedbackListPage({super.key});

  @override
  State<FeedbackListPage> createState() => _FeedbackListPageState();
}

class _FeedbackListPageState extends State<FeedbackListPage> {
  List<dynamic> _feedbackList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchFeedbacks();
  }

  Future<void> _fetchFeedbacks() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://script.google.com/macros/s/AKfycbxlBeu1Tb0SgpgQMNE7y-49aQnN_QL77XEPnQqYp6weohY3CFwQMGni8_4dAwPtfymVnw/exec'),
      );

      if (response.statusCode == 200) {
        setState(() {
          _feedbackList = json.decode(response.body);
        });
      } else {
        throw 'HTTP error: ${response.statusCode}';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching feedbacks: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _feedbackList.isEmpty
          ? const Center(child: Text('No feedback yet.'))
          : ListView.builder(
        itemCount: _feedbackList.length,
        itemBuilder: (context, index) {
          final feedback = _feedbackList[index];
          return Card(
            child: ListTile(
              title: Text(feedback['feedback']),
              subtitle: Text("Name: ${feedback['name']}"),
              trailing: feedback['anonymous'] == 'true'
                  ? const Text("Anonymous")
                  : const SizedBox(),
            ),
          );
        },
      ),
    );
  }
}
