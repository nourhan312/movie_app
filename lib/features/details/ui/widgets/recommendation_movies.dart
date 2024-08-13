

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/text_style.dart';
import '../../logic/details_cubit.dart';
import 'movie_iteam.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textAlign: TextAlign.start,
              "Recommendation Movies",
              style: TextStyles.font18Bold.copyWith(color: Colors.white),
            ),
            verticalSpace(10),
            BlocBuilder<DetailsCubit, DetailsState>(
              builder: (context, state) {
                return SizedBox(
                  height: 230.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                    context.read<DetailsCubit>().recommendList!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: buildSimilarMovieItem(
                          context.read<DetailsCubit>().recommendList![index],
                          context,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ));
  }
}
