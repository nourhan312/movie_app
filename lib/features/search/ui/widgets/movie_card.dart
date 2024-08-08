import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/home_screen/data/models/movie_model.dart';


class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       context.pushNamed(Routes.detailsScreen,arguments: movie);
      },
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: CachedNetworkImage(
                imageUrl: movie.posterPath == ''
                    ? "https://www.canadasatellite.ca/media/catalog/product/cache/728617c6636d90bea9d31e9e0817f96b/i/m/image-not-available_1_11_1_1_1.png"
                    : 'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                fit: BoxFit.cover,
                height: 200.0,
                width: double.infinity,
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.originalTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 16.0,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          movie.releaseDate,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16.0,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          movie.voteAverage.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      movie.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
