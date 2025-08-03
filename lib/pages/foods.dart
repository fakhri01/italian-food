import 'package:flutter/material.dart';
import 'package:food_order/components/app_bar.dart';
import 'package:food_order/components/filter_foods.dart';
import 'package:food_order/components/food_card.dart';
import 'package:food_order/components/sorting_button.dart';
import 'package:food_order/data/db.dart';
import 'package:food_order/data/model.dart';
import 'package:food_order/pages/food_detail.dart';

class Foods extends StatefulWidget {
  const Foods({super.key});

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  bool _isLoading = true;
  List<Food> _allFoods = [];
  List<Food> _foods = [];
  String _currentFilter = "All";

  void onFilterSelected(String filter) {
    if (filter != _currentFilter) {
      setState(() {
        _currentFilter = filter;
        if (filter == "All") {
          _foods = _allFoods;
        } else {
          _foods = _allFoods
              .where((food) => food.category == _currentFilter)
              .toList();
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadFoods();
  }

  Future<void> _loadFoods() async {
    try {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      final fetchFoods = foodsData;
      setState(() {
        _allFoods = fetchFoods;
        _foods = _allFoods;
        _isLoading = false;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to load: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Row(children: [Text("Search is coming soon...")]),
                FilterFoods(onFilterSelected: onFilterSelected),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: SortingButton(),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3,
                            crossAxisCount: 1,
                            mainAxisSpacing: 12,
                          ),
                      itemCount: _foods.length,
                      itemBuilder: (context, index) {
                        final food = _foods[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FoodDetailPage(food: food),
                              ),
                            );
                          },
                          splashColor: Colors.blue.withValues(alpha: 0),
                          child: FoodCard(
                            id: food.id,
                            foodName: food.name,
                            image: food.image,
                            price: food.price,
                            rating: food.rating,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
