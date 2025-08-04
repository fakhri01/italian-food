import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';

class SortingButton extends StatefulWidget {
  final ValueChanged<String> onSortSelected;
  const SortingButton({super.key, required this.onSortSelected});

  @override
  SortingButtonState createState() => SortingButtonState();
}

class SortingButtonState extends State<SortingButton> {
  String? _selectedItem;

  final List<String> _dropdownItems = [
    'Default',
    'Price: Low to High',
    'Price: High to Low',
    'Rating: Low to High',
    'Rating: High to Low',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: DropdownButton<String>(
            underline: SizedBox.shrink(),
            hint: Transform.translate(
              offset: Offset(80.0, 0.0),
              child: Text("Sort by", style: TextStyle(color: primaryColor)),
            ),
            icon: Icon(Icons.sort, color: primaryColor),
            value: _selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue;
                if (newValue != null) {
                  widget.onSortSelected(newValue);
                }
              });
            },
            items: _dropdownItems.map<DropdownMenuItem<String>>((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: TextStyle(color: primaryColor)),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
