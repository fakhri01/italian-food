import 'package:flutter/material.dart';

class SearchFoods extends StatefulWidget {
  final ValueChanged<String> onSearchChanged;
  const SearchFoods({super.key, required this.onSearchChanged});

  @override
  State<SearchFoods> createState() => _SearchFoodsState();
}

class _SearchFoodsState extends State<SearchFoods> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        onChanged: widget.onSearchChanged,
        decoration: InputDecoration(
          hintText: 'Tiramisu',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }
}
