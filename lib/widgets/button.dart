import 'package:bar_store/utilities/load_favorite.dart';
import 'package:bar_store/widgets/favorite.dart';
import 'package:flutter/material.dart';

class AddToFavoriteBatton extends StatefulWidget {
  final int regionId;

  const AddToFavoriteBatton({super.key, required this.regionId});

  @override
  AddToFavoriteBattonState createState() => AddToFavoriteBattonState();
}

class AddToFavoriteBattonState extends State<AddToFavoriteBatton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    // Установлено начальное состояние isFavorite на основе favouritesRegionID
    isFavorite = favourites.contains(widget.regionId);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          if (isFavorite) {
            favourites.remove(widget.regionId);
          } else {
            favourites.add(widget.regionId);
          }
          isFavorite = !isFavorite;
          saveFavourites();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[200], // Фоновый цвет кнопки
        shape: const CircleBorder(), // Форма круга для кнопки
      ),
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        size: 25,
        color: Colors.white,
      ),
    );
  }
}
