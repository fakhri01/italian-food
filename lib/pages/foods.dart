import 'package:flutter/material.dart';
import 'package:food_order/components/app_bar.dart';
import 'package:food_order/components/food_card.dart';
import 'package:food_order/data/db.dart';
import 'package:food_order/data/model.dart';
import 'package:food_order/pages/food_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  List<Food> _foods = [];

  @override
  void initState() {
    super.initState();
    _loadFoods();
  }

  Future<void> _loadFoods() async {
    try {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      final fetchFoods = foods;
      setState(() {
        _foods = fetchFoods;
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
          : Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.95,
                    crossAxisCount: 2,
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
                            builder: (context) => FoodDetailPage(food: food),
                          ),
                        );
                      },
                      splashColor: Colors.blue.withValues(alpha: 0),
                      child: FoodCard(
                        id: food.id,
                        foodName: food.name,
                        image: food.image,
                        price: food.price,
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
