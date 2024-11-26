import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotstar/constent/constent_api.dart';
import 'package:hotstar/controller/api_controller.dart';
import 'package:hotstar/widgets/home/appbar.dart';
import 'package:hotstar/widgets/home/carousel.dart';
import 'package:hotstar/widgets/home/future_method.dart';
import 'package:hotstar/widgets/home/horizondal_list.dart';

class HomeScreen extends StatelessWidget {
  static const logo = "assets/disney.jpg";
  ApiController apiController = Get.put(ApiController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(logo, context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel Section
            buildFutureBuilder(
              future: apiController.getTrendingMovies(),
              builder: (context, snapshot) {
                return ImageCarousel(imageAssets: [
                  '${Constants.imagePath}${snapshot.data![9].posterPath}',
                  '${Constants.imagePath}${snapshot.data![10].posterPath}',
                  '${Constants.imagePath}${snapshot.data![11].posterPath}',
                ], snapshot: snapshot);
              },
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                children: [
                  buildFutureBuilder(
                    future: apiController.getTrendingMovies(),
                    builder: (context, snapshot) {
                      return MainTileCard(
                        title: "Trending Now",
                        snapshot: snapshot,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  buildFutureBuilder(
                    future: apiController.getUpcomingMovies(),
                    builder: (context, snapshot) {
                      return MainTileCard(
                        title: "Popular",
                        snapshot: snapshot,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  buildFutureBuilder(
                    future: apiController.getTopRatedMovies(),
                    builder: (context, snapshot) {
                      return MainTileCard(
                        title: "Recommended for you",
                        snapshot: snapshot,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
