// gradient_background.dart
import 'package:flutter/material.dart';

class GradientBackgroundPage extends StatelessWidget {
  final Widget child;
  const GradientBackgroundPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.3),
            Colors.transparent,
          ],
        ),
      ),
      child: child,
    );
  }
}
