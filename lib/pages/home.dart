import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';
import 'package:food_order/components/btn.dart';
import 'package:food_order/components/carousel_slider.dart';
import 'package:food_order/pages/foods.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselComponent(),
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 20),
            child: Text(
              "Fresh and delicious, every time.",
              style: TextStyle(
                color: primaryColor,
                fontFamily: primaryFontFamily,
                fontSize: 18,
              ),
            ),
          ),
          Btn(
            title: "GET STARTED",
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Foods()),
            ),
          ),
        ],
      ),
    );
  }
}
