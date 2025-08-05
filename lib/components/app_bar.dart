import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';
import 'package:food_order/pages/cart.dart';

AppBar appBar(context) {
  return AppBar(
    title: Text(
      "Italian Food Ristorante",
      style: TextStyle(color: textColor, fontFamily: "Playwrite"),
    ),
    backgroundColor: primaryColor,
    centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(Icons.shopping_bag),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cart()),
          );
        },
      ),
    ],
  );
}
