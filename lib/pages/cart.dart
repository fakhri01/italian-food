import 'package:flutter/material.dart';
import 'package:food_order/components/app_bar.dart';
import 'package:food_order/components/btn.dart';
import 'package:food_order/components/shopping_cart_card.dart';
import 'package:food_order/data/cart_model.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double? totalPrice = 0.0;

  final List<CartModel> testArr = [
    CartModel(
      id: 1,
      name: "Bruschetta Classica",
      image: "images/Bruschetta Classica.jpg",
      price: 8.50,
      quantity: 1,
    ),
  ];

  void removeItem(int id) {
    setState(() {
      testArr.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: testArr.length,
          itemBuilder: (context, index) {
            final test = testArr[index];
            return InkWell(
              onTap: () {
                removeItem(test.id);
              },
              child: ShoppingCartCard(
                id: test.id,
                name: test.name,
                image: test.image,
                price: test.price,
                quantity: test.quantity,
                onPressed: removeItem,
              ),
            );
          },
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
              Text("Total: \$$totalPrice", style: TextStyle(fontSize: 18)),
              Btn(title: "Checkout"),
            ],
          ),
        ),
      ),
    );
  }
}
