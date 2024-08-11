

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/text_style.dart';
import '../../logic/details_cubit.dart';

class MovieReview extends StatelessWidget {
  const MovieReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
