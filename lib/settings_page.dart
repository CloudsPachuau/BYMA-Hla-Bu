import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final double fontScale;
  final ValueChanged<double> onFontScaleChanged;
  final Color currentAccentColor;
  final ValueChanged<Color> onAccentColorChanged;

  const SettingsPage({
    super.key,
    required this.fontScale,
    required this.onFontScaleChanged,
    required this.currentAccentColor,
    required this.onAccentColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            "Adjust Font Size:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Slider(
            min: 0.8,
            max: 1.5,
            value: fontScale,
            onChanged: onFontScaleChanged,
            label: "${(fontScale * 100).toInt()}%",
          ),
          const SizedBox(height: 20),
          const Text(
            "Choose Dark Mode Accent Color:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [
              Colors.brown,
              Colors.cyan,
              Colors.orange,
              Colors.purple,
              Colors.red,
            ].map((color) {
              return GestureDetector(
                onTap: () => onAccentColorChanged(color),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: currentAccentColor == color
                        ? Border.all(color: Colors.black, width: 2)
                        : null,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
