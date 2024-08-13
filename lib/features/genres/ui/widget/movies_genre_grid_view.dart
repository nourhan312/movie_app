import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:movie_app/features/details/data/models/movie_arg.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/text_style.dart';

import '../../data/models/movies_depends_on_genre_id.dart';

class MovieGenresGridView extends StatelessWidget {
  const MovieGenresGridView({super.key, required this.movies});

  final List<GenresMovie> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 20,
        childAspectRatio: 0.59,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return buildGridViewItem(movie, context);
      },
    );
  }

  InkWell buildGridViewItem(GenresMovie movie, BuildContext context) {
    return InkWell(
      onTap: () {
        MovieArg movies = MovieArg(null, movie);
        context.pushNamed(Routes.movieDetails, arguments: movies);
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
              fit: BoxFit.cover,
              height: 160,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 160,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            movie.title!,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font16SemiBold,
          ),
        ],
      ),
    );
  }
}