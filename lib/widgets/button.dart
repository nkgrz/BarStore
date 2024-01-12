import 'package:flutter/material.dart';

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
          Icons.add_circle,
          size: 25,
          color: Colors.white,
        ));
  }
}