// loading_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';

class LoadingScreen extends StatefulWidget {
  final VoidCallback onFinish;
  const LoadingScreen({super.key, required this.onFinish});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Set a delay to navigate to the home screen
    Timer(const Duration(seconds: 3), widget.onFinish);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background color
      body: Center(
        child: Image.asset(
          'assets/Cover.jpg', // Path to your loading screen image
          fit: BoxFit
              .contain, // Ensures the full image is displayed without cropping
        ),
      ),
    );
  }
}
