import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../core/helper/spacing.dart';
import '../../../genres/data/models/movies_depends_on_genre_id.dart';
import '../../../home_screen/data/models/movie_model.dart';
import '../../logic/details_cubit.dart';
import '../../logic/url_lunsher_helper/url_luncher.dart';
import 'animation_video_button.dart';
import 'custom__icon_button.dart';
import 'favourite_icon.dart';

class MovieImageAndIcons extends StatelessWidget {
  const MovieImageAndIcons({super.key, required this.movie, this.moviesGeneres, this.isMovieGenres});

  final Movie ? movie;
  final GenresMovie ? moviesGeneres ;
  final bool  ? isMovieGenres ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xff242A32), Colors.black26, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.04, .5, .7],
            )),
            child: SizedBox(
              height: 500.h,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/w500/${context.read<DetailsCubit>().details?.posterPath}",
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.network(
                    "https://pics.clipartpng.com/No_Photography_Prohibition_Sign_PNG_Clipart-829.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 60),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomIconButton(
                      icon: CupertinoIcons.back,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      color: Colors.black87.withOpacity(0.8),
                    ),
                    const Spacer(),
                 isMovieGenres! ? const SizedBox() :   FavouriteIcon(movie: movie!),
                  ],
                ),
                verticalSpace(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomIconButton(
                      icon: CupertinoIcons.arrowshape_turn_up_right,
                      onTap: () {
                        _shareMovieDetails(context);
                      },
                      color: Colors.black87.withOpacity(0.8),
                    ),
                  ],
                ),
                const Spacer(),
                AnimatedVideoButton(
                  onTap: () {
                    launchURL(context.read<DetailsCubit>().videoList![0].key!);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _shareMovieDetails(BuildContext context) {
    final movieDetails = context.read<DetailsCubit>().details;

    final String title = movieDetails?.title ?? "Unknown title";
    final String releaseDate =
        movieDetails?.releaseDate.toString().substring(0, 10) ?? "Unknown date";
    final String rating = movieDetails?.voteAverage.toStringAsFixed(1) ?? "N/A";
    final String overview =
        movieDetails?.overview ?? "No description available";
    final String posterUrl =
        "https://image.tmdb.org/t/p/w500/${movieDetails?.posterPath}";

    final String message = """
Check out this movie:
Title: $title
Release Date: $releaseDate
Rating: $rating/10

Overview:
$overview

Check out the poster:
$posterUrl
""";

    Share.share(message);
  }
}



