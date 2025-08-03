import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';

class Btn extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const Btn({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 17,
            fontFamily: secondaryFontFAmily,
          ),
        ),
      ),
    );
  }
}
