import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/details/ui/widgets/similar_section.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/text_style.dart';
import '../../../home_screen/data/models/movie_model.dart';
import '../../logic/details_cubit.dart';
import 'cast_section.dart';
import 'genres_section.dart';
import 'movie_image_and_icons.dart';
import 'movie_review.dart';
import 'movie_timing_and_releasing.dart';
import 'overview_text.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MovieImageAndIcons(
            movie: movie,
          ),
          verticalSpace(5.h),
          Text(
            textAlign: TextAlign.center,
            context.read<DetailsCubit>().details!.title,
            style: TextStyles.font24SemiBoldWhite,
          ),
          verticalSpace(5.h),
          const MovieTimeAndReleasing(),
          verticalSpace(5.h),
          const MovieReview(),
          verticalSpace(18.h),
          const GenresSection(),
          verticalSpace(10.h),
          OverviewText(
            text: context
                .read<DetailsCubit>()
                .details!
                .overview
                .toString(),
          ),
          verticalSpace(12.h),
          const CastSection(),
          verticalSpace(10.h),
          const SimilarSection(),
        ],
      ),
    );
  }
}
