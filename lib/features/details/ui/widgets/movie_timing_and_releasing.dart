

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/text_style.dart';
import '../../logic/details_cubit.dart';

class MovieTimeAndReleasing extends StatelessWidget {
  const MovieTimeAndReleasing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
