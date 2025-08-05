import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';

class ShoppingCartCard extends StatefulWidget {
  const ShoppingCartCard({super.key});

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
          Image.asset("images/Arancini.jpg", width: 130, fit: BoxFit.fitHeight),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Text(
                "Product Name",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Price: ", style: TextStyle()),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(icon: Icon(Icons.close), onPressed: () => {}),
            ],
          ),
        ],
      ),
    );
  }
}
