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
  double totalPrice = 0.0;

  final List<CartModel> testArr = [
    CartModel(
      id: 1,
      name: "Bruschetta Classica",
      image: "images/Bruschetta Classica.jpg",
      price: 8.50,
      quantity: 1,
    ),
    CartModel(
      id: 2,
      name: "Caprese Salad",
      image: "images/Affogato.jpg",
      price: 12.00,
      quantity: 1,
    ),
    CartModel(
      id: 3,
      name: "Fritto Misto",
      image: "images/Bistecca Fiorentina.webp",
      price: 15.00,
      quantity: 3,
    ),
  ];

  void removeItem(int id) {
    setState(() {
      testArr.removeWhere((element) => element.id == id);
    });
  }

  void increaseQuantity(int id) {
    setState(() {
      final item = testArr.firstWhere((element) => (element.id == id));
      item.quantity++;
    });
  }

  void decreaseQuantity(int id) {
    setState(() {
      final item = testArr.firstWhere((element) => (element.id == id));
      if (item.quantity > 0) {
        item.quantity--;
        if (item.quantity == 0) {
          removeItem(id);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    totalPrice = testArr.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );
    return Scaffold(
      appBar: appBar(context, showCartIcon: false),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: testArr.length,
          itemBuilder: (context, index) {
            final item = testArr[index];
            return ShoppingCartCard(
              id: item.id,
              name: item.name,
              image: item.image,
              price: item.price,
              quantity: item.quantity,
              onPressed: removeItem,
              onIncreaseQuantity: increaseQuantity,
              onDecreaseQuantity: decreaseQuantity,
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
              Text(
                "Total: \$${totalPrice.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 18),
              ),
              Btn(title: "Checkout"),
            ],
          ),
        ),
      ),
    );
  }
}
