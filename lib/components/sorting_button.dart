import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';

class SortingButton extends StatefulWidget {
  const SortingButton({super.key});

  @override
  _SortingButtonState createState() => _SortingButtonState();
}

class _SortingButtonState extends State<SortingButton> {
  String? _selectedItem; // Holds the currently selected value

  // List of items for the dropdown
  final List<String> _dropdownItems = [
    'Price: Low to High',
    'Price: High to Low',
    'A-Z',
    'Z-A',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<String>(
          underline: SizedBox.shrink(),
          hint: Text("Sort by", style: TextStyle(color: primaryColor)),
          icon: Icon(Icons.sort, color: primaryColor),
          value: _selectedItem,
          onChanged: (String? newValue) {
            setState(() {
              _selectedItem = newValue;
            });
          },
          items: _dropdownItems.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
        ),
      ],
    );
  }
}
