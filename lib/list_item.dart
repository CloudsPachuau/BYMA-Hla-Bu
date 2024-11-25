// models/list_item.dart
class ListItem {
  final int number;
  final String title;
  final String imagePath;
  final String soundPath;
  final String? note; // Add note field (nullable)

  ListItem({
    required this.number,
    required this.title,
    required this.imagePath,
    required this.soundPath,
    this.note, // Optional parameter
  });
}
