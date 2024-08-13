import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_style.dart';
import '../../../home_screen/data/models/movie_model.dart';
import '../../data/models/movie_arg.dart';

InkWell buildSimilarMovieItem(Movie movie, BuildContext context) {
  return InkWell(
    onTap: () {
      MovieArg movies = MovieArg(movie, null);
      context.pushNamed(Routes.movieDetails, arguments: movies);
    },
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
            fit: BoxFit.cover,
            height: 160.h,
            width: 120.w,
            errorWidget: (context, url, error) => Image.network("https://pics.clipartpng.com/No_Photography_Prohibition_Sign_PNG_Clipart-829.png"),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 160.h,
                width: 120.w,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          width: 100.w,
          child: Text(
            movie.originalTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyles.font16SemiBold,
          ),
        ),
      ],
    ),
  );
}

Widget buildSimilarLoadingItem() {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 160.h,
            width: 120,
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(height: 4.0),
      Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 20.h,
          width: 100,
          color: Colors.white,
        ),
      ),
    ],
  );
}