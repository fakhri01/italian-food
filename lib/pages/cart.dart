import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';
import 'package:food_order/components/btn.dart';
import 'package:food_order/components/shopping_cart_card.dart';
import 'package:food_order/data/cart_model.dart';

class Cart extends StatefulWidget {
  final List<CartModel> cartItem;

  const Cart({super.key, required this.cartItem});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final List<CartModel> currentCartItems = widget.cartItem;
    double totalPrice = 0.0;

    void removeItem(int id) {
      setState(() {
        currentCartItems.removeWhere((element) => element.id == id);
      });
    }

    void increaseQuantity(int id) {
      setState(() {
        final item = currentCartItems.firstWhere(
          (element) => (element.id == id),
        );
        item.quantity++;
      });
    }

    void decreaseQuantity(int id) {
      setState(() {
        final item = currentCartItems.firstWhere(
          (element) => (element.id == id),
        );
        if (item.quantity > 0) {
          item.quantity--;
          if (item.quantity == 0) {
            removeItem(id);
          }
        }
      });
    }

    totalPrice = currentCartItems.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: primaryColor,
        title: Text(
          "Italian Food Ristorante",
          style: TextStyle(color: textColor, fontFamily: primaryFontFamily),
        ),
      ),
      body: currentCartItems.isEmpty
          ? Center(
              child: Text(
                "Your cart is empty!",
                style: TextStyle(fontSize: 17),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: currentCartItems.length,
                itemBuilder: (context, index) {
                  final item = currentCartItems[index];
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
