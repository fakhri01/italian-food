import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';

class ShoppingCartCard extends StatefulWidget {
  final int id;
  final String name;
  final String image;
  final double price;
  final int quantity;
  final Function(int) onPressed;
  const ShoppingCartCard({
    super.key,
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.onPressed,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Text(
                widget.name,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Price: ${widget.price}", style: TextStyle()),
              Text("Price: ${widget.quantity}", style: TextStyle()),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
