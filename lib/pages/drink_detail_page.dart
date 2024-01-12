import 'package:bar_store/models/product.dart';
import 'package:bar_store/widgets/button.dart';
import 'package:flutter/material.dart';

class DrinkDetailPage extends StatelessWidget {
  final Product drink;

  const DrinkDetailPage({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drink.title),
      ),
      body: Column(
        children: [
          Image.network(drink.imgUrl),
          // Text(drink.title),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${drink.price} \$.',
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              AddToFavoriteBatton(regionId: drink.id),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(drink.description),
          ),
        ],
      ),
    );
  }
}
