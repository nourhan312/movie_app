

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/text_style.dart';
import '../../logic/details_cubit.dart';
import 'cast_iteam.dart';

class CastSection extends StatelessWidget {
  const CastSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            textAlign: TextAlign.start,
            "Cast",
            style: TextStyles.font18Bold
                .copyWith(color: Colors.white),
          ),
        ),
        verticalSpace(10.h),
        SizedBox(
          height: 120.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: context.read<DetailsCubit>().movieCredits!.cast!.length,
              itemBuilder: (context, index) {
                return CastItem(
                  credits: context.read<DetailsCubit>().movieCredits,
                  index: index,
                );
              }),
        ),
      ],
    );
  }
}
