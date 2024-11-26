import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotstar/constent/constent_api.dart';
import 'package:hotstar/controller/api_controller.dart';
import 'package:hotstar/widgets/home/appbar.dart';
import 'package:hotstar/widgets/home/carousel.dart';
import 'package:hotstar/widgets/home/horizondal_list.dart';

class HomeScreen extends StatelessWidget {
  static const logo = "assets/disney.jpg";
  final ApiController apiController =
      Get.put(ApiController()); 
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(logo, context),
      body: Obx(() {
        if (apiController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (apiController.trendingMovies.isEmpty &&
            apiController.upcomingMovies.isEmpty &&
            apiController.topRatedMovies.isEmpty) {
          return const Center(child: Text('No data available.'));
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Carousel Section
              ImageCarousel(
                imageAssets: apiController.trendingMovies
                    .take(3)
                    .map((movie) => '${Constants.imagePath}${movie.posterPath}')
                    .toList(),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  children: [
                    MainTileCard(
                      title: "Trending Now",
                      movies: apiController.trendingMovies.toList(),
                    ),
                    const SizedBox(height: 30),
                    MainTileCard(
                      title: "Popular",
                      movies: apiController.topRatedMovies.toList(),
                    ),
                    const SizedBox(height: 30),
                    MainTileCard(
                      title: "Recommended for you",
                      movies: apiController.upcomingMovies.toList(),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
