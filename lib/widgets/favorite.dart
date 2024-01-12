import 'package:bar_store/models/product.dart';
import 'package:bar_store/pages/drink_detail_page.dart';
import 'package:bar_store/pages/drink_page.dart';
import 'package:flutter/material.dart';

Set<int> favourites = {};

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  // Функция для получения списка продуктов на основе ID избранных
  List<Product> getFavouriteProducts() {
    List<Product> favouriteProducts = [];
    for (int id in favourites) {
      Product product = allDrinks.firstWhere((product) => product.id == id);
      favouriteProducts.add(product);
    }
    return favouriteProducts;
  }

  @override
  Widget build(BuildContext context) {
    List<Product> favouriteProducts = getFavouriteProducts();
    return Expanded(
      child: ListView.builder(
        itemCount: favouriteProducts.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(favouriteProducts[index].title),
          subtitle: Text('${favouriteProducts[index].price} \$.'),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              favouriteProducts[index].imgUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          onTap: () {
            // Открытие карточки напитка
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DrinkDetailPage(drink: favouriteProducts[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
