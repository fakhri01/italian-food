import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';
import 'package:food_order/components/btn.dart';
import 'package:food_order/data/cart_model.dart';
import 'package:food_order/data/model.dart';
import 'package:food_order/pages/cart.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;

  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => FoodDetailPageState();
}

class FoodDetailPageState extends State<FoodDetailPage> {
  final List<CartModel> _cartItems = [];

  void addToCart(Food food) {
    final existingItemIndex = _cartItems.indexWhere(
      (element) => element.name == food.name,
    );

    if (existingItemIndex != -1) {
      _cartItems[existingItemIndex].quantity++;
    } else {
      _cartItems.add(
        CartModel(
          id: food.id,
          name: food.name,
          image: food.image,
          price: food.price,
          quantity: 1,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var displayInfo = MediaQuery.of(context);
    final double displayWidth = displayInfo.size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Italian Food Ristorante",
          style: TextStyle(color: textColor, fontFamily: primaryFontFamily),
        ),
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag, color: textColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(cartItem: _cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            widget.food.image,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  widget.food.name,
                  style: TextStyle(
                    fontFamily: primaryFontFamily,
                    fontSize: displayWidth / 14,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.star_border_rounded,
                        color: textColorSecondary,
                      ),
                      Text(
                        "${widget.food.rating}",
                        style: TextStyle(
                          fontFamily: secondaryFontFAmily,
                          fontSize: 16,
                          color: textColorSecondary,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 7),
                        child: Text("-"),
                      ),
                      Text(
                        "${widget.food.prepTime} mins",
                        style: TextStyle(
                          color: textColorSecondary,
                          fontSize: 16,
                          fontFamily: secondaryFontFAmily,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.food.description,
                  style: TextStyle(color: textColorSecondary),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.food.price}\$",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: secondaryFontFAmily,
                  ),
                ),
                Btn(
                  title: "Add To Cart",
                  onPressed: () => {addToCart(widget.food)},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget textButton(text) {
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(backgroundColor: primaryColor),
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontFamily: primaryFontFamily,
        fontSize: 12,
      ),
    ),
  );
}
