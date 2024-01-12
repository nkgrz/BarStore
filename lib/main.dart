import 'package:bar_store/pages/drink_page.dart';
import 'package:bar_store/utilities/load_favorite.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Инициализация Flutter-биндинга
  await loadFavorites();
  await loadFavorites();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Освежающие напитки',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DrinksPage(),
    );
  }
}
