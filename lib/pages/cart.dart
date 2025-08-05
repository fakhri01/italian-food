import 'package:flutter/material.dart';
import 'package:food_order/components/app_bar.dart';
import 'package:food_order/components/btn.dart';
import 'package:food_order/components/shopping_cart_card.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ShoppingCartCard(),
              ShoppingCartCard(),
              ShoppingCartCard(),
              ShoppingCartCard(),
              ShoppingCartCard(),
              ShoppingCartCard(),
              ShoppingCartCard(),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(color: Colors.amber[50]),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Price: "),
              Btn(title: "Checkout"),
            ],
          ),
        ),
      ),
    );
  }
}
