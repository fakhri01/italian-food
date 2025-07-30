import 'package:flutter/material.dart';
import 'package:food_order/components/app_bar.dart';
import 'package:food_order/components/food_card.dart';
import 'package:food_order/data/db.dart';
import 'package:food_order/pages/food_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: GridView.builder(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // mainAxisSpacing: 12,
            // crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemCount: foods.length,
          itemBuilder: (context, index) {
            final food = foods[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FoodDetailPage()),
                );
              },
              splashColor: Colors.blue.withValues(alpha: 0),
              child: FoodCard(
                foodName: food.name,
                image: food.image,
                price: food.price,
              ),
            );
          },
        ),
      ),
    );
  }
}
