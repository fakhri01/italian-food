import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';

class FoodCard extends StatelessWidget {
  final int id;
  final String foodName;
  final String image;
  final double price;
  final double rating;

  const FoodCard({
    super.key,
    required this.id,
    required this.foodName,
    required this.image,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(image, width: 130, fit: BoxFit.fitHeight),
          SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 7),
                child: Text(
                  foodName,
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: primaryFontFamily,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "\$$price",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: secondaryFontFAmily, fontSize: 15),
              ),
            ],
          ),
          Spacer(),

          Padding(
            padding: EdgeInsets.only(right: 12, top: 12),
            child: Column(
              children: [
                Icon(Icons.star_border_rounded, color: primaryColor),
                Text(
                  "$rating",
                  style: TextStyle(
                    fontFamily: secondaryFontFAmily,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
