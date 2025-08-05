import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';
import 'package:food_order/pages/cart.dart';

AppBar appBar(BuildContext context, {bool showCartIcon = true}) {
  return AppBar(
    title: Text(
      "Italian Food Ristorante",
      style: TextStyle(color: textColor, fontFamily: primaryFontFamily),
    ),
    backgroundColor: primaryColor,
    centerTitle: true,
    actions: [
      if (showCartIcon)
        IconButton(
          icon: Icon(Icons.shopping_bag, color: textColor),
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
