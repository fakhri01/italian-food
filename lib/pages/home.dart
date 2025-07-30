import 'package:flutter/material.dart';
import 'package:food_order/components/app_bar.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Page"),
            ElevatedButton(
              child: Text("Go Detail Page"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FoodDetailPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
