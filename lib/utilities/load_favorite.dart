import 'package:bar_store/widgets/favorite.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Метод для загрузки избранного из SharedPreferences
Future<void> loadFavorites() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<int> favouritesData = prefs.getStringList('favourites')?.map((e) => int.parse(e)).toList() ?? [];
  if (favouritesData.isNotEmpty) {
    favourites = Set<int>.from(favouritesData);
  }
}

// Метод для сохранения Избранного
Future<void> saveFavourites() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<String> favouritesData = favourites.map((e) => e.toString()).toList();
  await prefs.setStringList('favourites', favouritesData);
}

