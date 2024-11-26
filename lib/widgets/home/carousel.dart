import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageAssets;
  const ImageCarousel({
    super.key,
    required this.imageAssets,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        imageAssets.length,
        (index) => Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              image: NetworkImage(imageAssets[index]),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      options: CarouselOptions(
        height: 350,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 9 / 3,
        enableInfiniteScroll: true,
        initialPage: 0,
      ),
    );
  }
}
