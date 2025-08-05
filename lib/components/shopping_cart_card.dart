import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';

class ShoppingCartCard extends StatefulWidget {
  final int id;
  final String name;
  final String image;
  final double price;
  final int quantity;
  final Function(int) onPressed;
  final Function(int) onIncreaseQuantity;
  final Function(int) onDecreaseQuantity;
  const ShoppingCartCard({
    super.key,
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
    required this.onPressed,
    required this.onIncreaseQuantity,
    required this.onDecreaseQuantity,
  });

  @override
  State<ShoppingCartCard> createState() => _ShoppingCartCardState();
}

class _ShoppingCartCardState extends State<ShoppingCartCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(widget.image, width: 130, fit: BoxFit.fitHeight),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Price: \$ ${widget.price.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => (setState(() {
                        widget.onDecreaseQuantity(widget.id);
                      })),
                      icon: Icon(Icons.remove),
                    ),
                    Text("${widget.quantity}", style: TextStyle(fontSize: 15)),
                    IconButton(
                      visualDensity: VisualDensity(horizontal: 0),
                      onPressed: () => (setState(() {
                        widget.onIncreaseQuantity(widget.id);
                      })),
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  widget.onPressed(widget.id);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
