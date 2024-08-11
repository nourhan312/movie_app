import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_style.dart';
import '../../../home_screen/data/models/movie_model.dart';

InkWell buildGridViewItem(Movie movie, BuildContext context) {
  return InkWell(
    onTap: () => context.pushNamed(Routes.movieDetails, arguments: movie),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
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
          movie.originalTitle,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyles.font16SemiBold,
        ),
      ],
    ),
  );
}