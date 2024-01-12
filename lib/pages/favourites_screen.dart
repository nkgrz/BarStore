import 'package:bar_store/widgets/favorite.dart';
import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Избранное',
        ),
      ),
      body: const Favourites(),
    );
  }
}
