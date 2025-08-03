import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';
import 'package:food_order/components/app_bar.dart';
import 'package:food_order/components/btn.dart';
import 'package:food_order/data/model.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;

  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => FoodDetailPageState();
}

class FoodDetailPageState extends State<FoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    var displayInfo = MediaQuery.of(context);
    final double displayWidth = displayInfo.size.width;
    final double displayHeight = displayInfo.size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar(),
      body: Column(
        children: [
          Image.asset(
            widget.food.image,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  widget.food.name,
                  style: TextStyle(
                    fontFamily: primaryFontFamily,
                    fontSize: displayWidth / 14,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.star_border_rounded,
                        color: textColorSecondary,
                      ),
                      Text(
                        "${widget.food.rating}",
                        style: TextStyle(
                          fontFamily: secondaryFontFAmily,
                          fontSize: 16,
                          color: textColorSecondary,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 7),
                        child: Text("-"),
                      ),
                      Text(
                        "${widget.food.prepTime} mins",
                        style: TextStyle(
                          color: textColorSecondary,
                          fontSize: 16,
                          fontFamily: secondaryFontFAmily,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.food.description,
                  style: TextStyle(color: textColorSecondary),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.food.price}\$",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: secondaryFontFAmily,
                  ),
                ),
                Btn(title: "Add To Cart"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget textButton(text) {
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(backgroundColor: primaryColor),
    child: Text(
      text,
      style: TextStyle(color: textColor, fontFamily: "Playwrite", fontSize: 12),
    ),
  );
}
