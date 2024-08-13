import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:movie_app/features/details/data/models/movie_arg.dart';
import 'package:movie_app/features/genres/data/models/movies_depends_on_genre_id.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_style.dart';
import '../../data/models/movie_model.dart';
class MovieCategory extends StatelessWidget {
  const MovieCategory({super.key, this.movies, this.genreMovies});

  final List<Movie>? movies;
  final List<GenresMovie>? genreMovies;

  @override
  Widget build(BuildContext context) {
    // Combine both lists, filtering out any null values
    final combinedList = <dynamic>[
      if (movies != null) ...movies!,
      if (genreMovies != null) ...genreMovies!,
    ];

    if (combinedList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.grey,),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 20,
        childAspectRatio: 0.59,
      ),
      itemCount: combinedList.length,
      itemBuilder: (context, index) {
        // Determine if the item is a Movie or GenresMovie
        final item = combinedList[index];
        return buildGridViewItem(item, context);
      },
    );
  }

  InkWell buildGridViewItem(dynamic item, BuildContext context) {
    // Check if item is Movie or GenresMovie and handle accordingly
    final isMovie = item is Movie;
    final posterPath = isMovie ? item.posterPath : (item as GenresMovie).posterPath;
    final originalTitle = isMovie ? item.originalTitle : item.originalTitle;

    return InkWell(
      onTap: () {
        MovieArg movies = MovieArg(isMovie ? item : null, isMovie ? null : item);
        context.pushNamed(Routes.movieDetails, arguments: movies);
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: "https://image.tmdb.org/t/p/w500/$posterPath",
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
            originalTitle ?? " ",
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font16SemiBold,
          ),
        ],
      ),
    );
  }
}
