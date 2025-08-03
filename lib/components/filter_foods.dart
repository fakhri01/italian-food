import 'package:flutter/material.dart';
import 'package:food_order/components/btn.dart';

class FilterFoods extends StatefulWidget {
  final ValueChanged<String> onFilterSelected;
  const FilterFoods({super.key, required this.onFilterSelected});

  @override
  State<FilterFoods> createState() => _FilterFoodsState();
}

class _FilterFoodsState extends State<FilterFoods> {
  final filters = ["All", "Antipasti", "Pasta", "Secondi", "Dolci"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 12),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters
            .map(
              (filter) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Btn(
                  title: filter,
                  onPressed: () => widget.onFilterSelected(filter),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
