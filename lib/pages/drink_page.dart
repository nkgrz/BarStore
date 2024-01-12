
import 'package:bar_store/models/product.dart';
import 'package:bar_store/pages/drink_detail_page.dart';
import 'package:bar_store/utilities/load_products.dart';
import 'package:bar_store/widgets/drink_card.dart';
import 'package:flutter/material.dart';

class DrinksPage extends StatefulWidget {
  const DrinksPage({super.key});

  @override
  DrinksPageState createState() => DrinksPageState();
}

class DrinksPageState extends State<DrinksPage> {
  List<Product> drinks = []; // Топовые напитки
  List<Product> allDrinks = []; // Все напитки

  @override
  void initState() {
    super.initState();
    loadProducts().then((loadedProducts) {
      setState(() {
        drinks = loadedProducts.where((product) => product.isFavorite).toList();
        allDrinks = loadedProducts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.map), // Иконка для карты
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) =>
            //         RestaurantMap(), // Страница с картой ресторанов
            //   ),
            // );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart), // Иконка для корзины
            onPressed: () {
              // Обработка нажатия на корзину
            },
          ),
        ],
        title: const Text('Освежающие напитки'),
      ),
      body: Column(
        children: [
          const Text(
            'Больше чем 100 видов напитков',
            style: TextStyle(color: Colors.black38),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: drinks.length,
              itemBuilder: (context, index) => DrinkCard(drink: drinks[index]),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Каталог коктейлей',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: allDrinks.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(allDrinks[index].title),
                subtitle: Text('${allDrinks[index].price} \$.'),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    allDrinks[index].imgUrl,
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
                          DrinkDetailPage(drink: allDrinks[index]),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
