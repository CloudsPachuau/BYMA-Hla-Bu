import 'package:flutter/material.dart';
import 'reusable_list_page.dart';
import 'list_item.dart';
import 'favorites_manager.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Map the favorites to ListItem with a dynamic number
    final favoriteItems =
        FavoritesManager.instance.favorites.asMap().entries.map((entry) {
      final index = entry.key + 1; // Assign a number starting from 1
      final fav = entry.value;

      return ListItem(
        title: fav['pageTitle'],
        number: index, // Use the index as the dynamic number
        imagePath: fav['filePath'],
        soundPath: fav['soundPath'],
        note: fav['note'],
      );
    }).toList();

    return ReusableListPage(
      title: 'Favorites',
      items: favoriteItems,
      showFavorites: true,
    );
  }
}
