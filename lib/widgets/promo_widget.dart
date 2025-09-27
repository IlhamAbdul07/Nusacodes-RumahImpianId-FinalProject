import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PromoWidget extends StatelessWidget {
  const PromoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> promoImages = [
      'assets/images/promo1.png',
      'assets/images/promo2.png',
      'assets/images/promo3.png',
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CarouselSlider(
        items: promoImages
            .map(
              (item) => ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
          height: 100.0,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          autoPlayInterval: Duration(seconds: 3),
        ),
      ),
    );
  }
}
