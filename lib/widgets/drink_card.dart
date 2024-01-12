import 'package:bar_store/models/product.dart';
import 'package:bar_store/pages/drink_detail_page.dart';
import 'package:bar_store/widgets/button.dart';
import 'package:flutter/material.dart';

class DrinkCard extends StatelessWidget {
  final Product drink;

  const DrinkCard({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Открытие карточки напитка
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DrinkDetailPage(drink: drink),
            ),
          );
        },
        child: Container(
          width: 200,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color(int.parse(drink.color)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    15), // Закругление границ для картинки
                child: Image.network(
                  drink.imgUrl,
                  width: 170, // Задайте желаемую ширину для картинки
                  height: 190, // Задайте желаемую высоту для картинки
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  drink.title,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('${drink.price} \$',
                      style: const TextStyle(fontSize: 18)),
                  AddToFavoriteBatton(regionId: drink.id),
                ],
              )
            ],
          ),
        ));
  }
}
