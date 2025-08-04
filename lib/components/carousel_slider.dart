import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_order/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselComponent extends StatefulWidget {
  const CarouselComponent({super.key});

  @override
  State<CarouselComponent> createState() => _CarouselComponentState();
}

class _CarouselComponentState extends State<CarouselComponent> {
  int _currentIndex = 0;

  final List<String> carouselImages = [
    'images/pizza_home.png',
    'images/pizza_home_2.png',
    'images/pizza_home_3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: carouselImages.map((image) => Image.asset(image)).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlayInterval: Duration(milliseconds: 1500),
            autoPlay: true,
            onPageChanged: (index, reason) => setState(() {
              _currentIndex = index;
            }),
          ),
        ),
        SizedBox(height: 16),
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: carouselImages.length,
          effect: ExpandingDotsEffect(
            activeDotColor: primaryColor,
            dotColor: Colors.grey,
            dotHeight: 8.0,
            dotWidth: 8.0,
            expansionFactor: 4,
          ),
        ),
      ],
    );
  }
}
