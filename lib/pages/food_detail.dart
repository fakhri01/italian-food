import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';
import 'package:food_order/components/app_bar.dart';
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
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              widget.food.name,
              style: TextStyle(
                fontFamily: 'Playwrite',
                fontSize: displayWidth / 14,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Image.asset(
              widget.food.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.food.ingredients
                  .map((ingredient) => textButton(ingredient))
                  .toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Text(
                  "20 min",
                  style: TextStyle(
                    color: textColorSecondary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Playwrite",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Delivery",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Playwrite",
                    ),
                  ),
                ),
                Text(
                  "Meat lover, get ready to meet your pizza!",
                  style: TextStyle(
                    color: textColorSecondary,
                    fontSize: 18,
                    fontFamily: "Playwrite",
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.food.price}\$",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Playwrite",
                  ),
                ),
                SizedBox(
                  width: displayWidth / 2,
                  height: displayHeight / 16,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                    ),
                    onPressed: () => () {},
                    child: Text(
                      "Add To Card",
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: "Playwrite",
                      ),
                    ),
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
