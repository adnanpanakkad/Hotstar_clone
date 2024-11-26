import 'package:flutter/material.dart';
import 'package:hotstar/constent/constent_api.dart';

class MainTileCard extends StatelessWidget {
  const MainTileCard({
    super.key,
    required this.title,
    required this.movies, 
  });

  final String title;
  final List movies;
  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const SizedBox(); 
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index]; // Access movie details
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    width: 100,
                    height: 150,
                    child: Image.network(
                      '${Constants.imagePath}${movie.posterPath}', // Use movie's poster path
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.broken_image, color: Colors.white),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
