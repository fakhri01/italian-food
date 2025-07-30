import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';

AppBar appBar() {
  return AppBar(
    title: Text(
      "Italian Food Ristorante",
      style: TextStyle(color: textColor, fontFamily: "Playwrite"),
    ),
    backgroundColor: primaryColor,
    centerTitle: true,
  );
}
