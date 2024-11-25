import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesManager {
  static final FavoritesManager _instance = FavoritesManager._internal();
  final List<Map<String, dynamic>> _favorites = [];
  final String _favoritesKey = 'favorites';

  FavoritesManager._internal();

  static FavoritesManager get instance => _instance;

  List<Map<String, dynamic>> get favorites => List.unmodifiable(_favorites);

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getString(_favoritesKey);
    if (savedFavorites != null) {
      final decodedFavorites =
          List<Map<String, dynamic>>.from(jsonDecode(savedFavorites));
      _favorites.addAll(decodedFavorites);
    }
  }

  Future<void> addFavorite(
      String pageTitle, String filePath, String soundPath, String note) async {
    if (_favorites.any((item) => item['pageTitle'] == pageTitle)) return;

    _favorites.add({
      'pageTitle': pageTitle,
      'filePath': filePath,
      'soundPath': soundPath,
      'note': note,
    });

    await _saveFavorites();
  }

  Future<void> removeFavorite(String pageTitle) async {
    _favorites.removeWhere((item) => item['pageTitle'] == pageTitle);
    await _saveFavorites();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_favoritesKey, jsonEncode(_favorites));
  }

  bool isFavorite(String pageTitle) {
    return _favorites.any((item) => item['pageTitle'] == pageTitle);
  }
}
