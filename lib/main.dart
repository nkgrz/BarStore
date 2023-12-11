import 'package:bar_store/models/Product.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: DrinksPage(),
    );
  }
}

class DrinksPage extends StatelessWidget {
  final List<Product> drinks = ProductDataProvider().items;

  DrinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              itemCount: drinks.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(drinks[index].title),
                subtitle: Text('${drinks[index].price} \$.'),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    drinks[index].imgUrl,
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
                          DrinkDetailPage(drink: drinks[index]),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DrinkCard extends StatelessWidget {
  final Product drink;

  const DrinkCard({Key? key, required this.drink}) : super(key: key);

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
                child: Text(drink.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('${drink.price} \$',
                      style: const TextStyle(fontSize: 18)),
                  const AddToCardBatton(),
                ],
              )
            ],
          ),
        ));
  }
}

class DrinkDetailPage extends StatelessWidget {
  final Product drink;

  const DrinkDetailPage({Key? key, required this.drink}) : super(key: key);

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
              const AddToCardBatton(),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(drink.description),
          ),
          // Добавьте здесь дополнительные детали и кнопки
        ],
      ),
    );
  }
}

class AddToCardBatton extends StatelessWidget {
  const AddToCardBatton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // Действие при нажатии на кнопку
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[200], // Фоновый цвет кнопки
          shape: const CircleBorder(), // Форма круга для кнопки
        ),
        child: const Icon(
          Icons.add,
          size: 25,
          color: Colors.white,
        ));
  }
}
