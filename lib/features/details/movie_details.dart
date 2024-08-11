import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helper/spacing.dart';
import 'package:movie_app/features/details/favourite_icon.dart';
import 'package:movie_app/features/details/logic/details_cubit.dart';
import 'package:movie_app/features/details/ui/widgets/cast_iteam.dart';
import 'package:movie_app/features/details/ui/widgets/custom__icon_button.dart';
import 'package:movie_app/features/details/ui/widgets/genres_section.dart';
import 'package:movie_app/features/details/ui/widgets/overview_text.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/theming/text_style.dart';
import '../home_screen/data/models/movie_model.dart';
import 'logic/url_lunsher_helper/url_luncher.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsLoading ||
            state is CreditLoading ||
            state is ReviewLoading ||
            state is VideoLuncherLoading ||
            context.read<DetailsCubit>().details == null ||
            context.read<DetailsCubit>().movieCredits == null ||
            context.read<DetailsCubit>().reviewList == null ||
            context.read<DetailsCubit>().videoList == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DetailsError ||
            state is CreditError ||
            state is ReviewError ||
            state is VideoLuncherError) {
          return const Center(
            child: Text(
              'Error: ',
              style: TextStyle(color: Colors.red),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: const Color(0xff242A32),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        foregroundDecoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Color(0xff242A32)],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [0.2, 1],
                            )),
                        child: SizedBox(
                          height: 330.h,
                          child: CachedNetworkImage(
                            imageUrl:
                            "https://image.tmdb.org/t/p/w500/${context.read<DetailsCubit>().details?.backdropPath}",
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40.h,
                        left: 20.w,
                        child: CustomIconButton(
                          icon: CupertinoIcons.back,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          color: Colors.black87.withOpacity(0.8),
                        ),
                      ),
                      FavouriteIcon(movie: movie),
                      Positioned(
                        top: 80.h,
                        right: 20.w,
                        child: CustomIconButton(
                          icon: CupertinoIcons.arrowshape_turn_up_right,
                          onTap: () {
                            _shareMovieDetails(context);
                          },
                          color: Colors.black87.withOpacity(0.8),
                        ),
                      ),
                      Positioned(
                        bottom: 15.h,
                        right: 0,
                        left: 0,
                        child: CustomIconButton(
                          value: 10,
                          icon: CupertinoIcons.play_fill,
                          onTap: () {
                            launchURL(context
                                .read<DetailsCubit>()
                                .videoList![0]
                                .key!);
                          },
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(5.h),
                  Text(
                    context.read<DetailsCubit>().details!.title,
                    style: TextStyles.font24SemiBoldWhite,
                  ),
                  verticalSpace(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${context.read<DetailsCubit>().details!.releaseDate.toString().substring(0, 10)} ',
                        style: TextStyles.textSkip.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Icon(Icons.circle, color: Colors.grey, size: 8.sp),
                      Text(
                        ' ${context.read<DetailsCubit>().details!.status} ',
                        style: TextStyles.textSkip.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Icon(Icons.circle, color: Colors.grey, size: 8.sp),
                      Text(
                        ' ${context.read<DetailsCubit>().details!.runtime.toString()} min',
                        style: TextStyles.textSkip.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.yellow,
                        size: 14.sp,
                      ),
                      Text(
                        '  ${context.read<DetailsCubit>().details!.voteAverage.toStringAsFixed(1)}',
                        style: TextStyles.textSkip.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '  (${context.read<DetailsCubit>().details!.voteCount.toString()}) Review',
                        style: TextStyles.textSkip.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(18.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: GenresSection(
                      genres: context.read<DetailsCubit>().details!.genres,
                    ),
                  ),
                  verticalSpace(10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: OverviewText(
                      text: context
                          .read<DetailsCubit>()
                          .details!
                          .overview
                          .toString(),
                    ),
                  ),
                  verticalSpace(12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          "Cast",
                          style: TextStyles.font18Bold
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(10.h),
                  SizedBox(
                    height: 140.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return CastItem(
                            credits: context.read<DetailsCubit>().movieCredits,
                            index: index,
                          );
                        }),
                  ),
                  verticalSpace(10.h),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  void _shareMovieDetails(BuildContext context) {
    final movieDetails = context.read<DetailsCubit>().details;

    final String title = movieDetails?.title ?? "Unknown title";
    final String releaseDate = movieDetails?.releaseDate.toString().substring(0, 10) ?? "Unknown date";
    final String rating = movieDetails?.voteAverage.toStringAsFixed(1) ?? "N/A";
    final String overview = movieDetails?.overview ?? "No description available";
    final String posterUrl = "https://image.tmdb.org/t/p/w500/${movieDetails?.posterPath}";

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
