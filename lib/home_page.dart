// pages/home_page.dart
import 'package:flutter/material.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  HomePageContentState createState() => HomePageContentState();
}

class HomePageContentState extends State<HomePageContent> {
  late Future<void> _imagePreload;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _imagePreload = precacheImage(const AssetImage('assets/1.jpg'), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder(
        future: _imagePreload,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return InteractiveViewer(
              panEnabled: true, // Allows dragging
              scaleEnabled: true, // Allows zooming
              minScale: 1.0,
              maxScale: 4.0, // Maximum zoom scale
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 58.0), // Proper top padding
                  child: Image.asset(
                    'assets/1.jpg',
                    width: MediaQuery.of(context)
                        .size
                        .width, // Fit the width of the screen
                    fit: BoxFit
                        .fitWidth, // Maintains aspect ratio and fits to width
                  ),
                ),
              ),
            );
          } else {
            // Display a placeholder or loading spinner
            return const SizedBox.shrink(); // Returns an empty widget
          }
        },
      ),
    );
  }
}
