import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  // int id;
  final String foodName;
  final String image;
  final double price;

  const FoodCard({
    super.key,
    // required this.id,
    required this.foodName,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, width: 100),
        Text(foodName),
        Text("\$$price"),
      ],
    );
  }
}
