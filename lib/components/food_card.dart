import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';

class FoodCard extends StatelessWidget {
  final int id;
  final String foodName;
  final String image;
  final double price;

  const FoodCard({
    super.key,
    required this.id,
    required this.foodName,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: 120,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 7, bottom: 7),
            child: Text(
              foodName,
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontFamily: "Playwrite",
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            "\$$price",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: "Playwrite", fontSize: 12),
          ),
        ],
      ),
    );
  }
}
