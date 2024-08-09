import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helper/spacing.dart';
import 'package:movie_app/features/details/ui/widgets/custom__icon_button.dart';

import '../../core/theming/text_style.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Material(
                elevation: 10,
                color: Colors.transparent,
                child: SizedBox(
                  height: 330.h,
                  child: Image.asset(
                    'assets/images/back_ground.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 40.h,
                left: 20.w,
                child: CustomIconButton(
                  icon: CupertinoIcons.back,
                  onTap: () {},
                  color: Colors.black87.withOpacity(0.8),
                ),
              ),
              Positioned(
                top: 40.h,
                right: 20.w,
                child: CustomIconButton(
                  icon: CupertinoIcons.heart,
                  onTap: () {},
                  color: Colors.black87.withOpacity(0.8),
                ),
              ),
              Positioned(
                bottom: 2.h,
                right: 0,
                left: 0,
                child: CustomIconButton(
                  value: 10,
                  icon: CupertinoIcons.play_fill,
                  onTap: () {},
                  color: Colors.red,
                ),
              ),
            ],
          ),
          verticalSpace(5.h),
          const Text(
            'Spyder',
            style: TextStyles.font24SemiBoldWhite,
          ),
          verticalSpace(5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '2021',
                style: TextStyles.textSkip.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(
                'Drama',
                style: TextStyles.textSkip.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(
                '12 Epoides',
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
                color: Colors.yellowAccent,
                size: 14.sp,
              ),
              Text(
                ' 4.2',
                style: TextStyles.textSkip.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(
                '  12 review',
                style: TextStyles.textSkip.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          verticalSpace(18.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Text(
                  textAlign: TextAlign.start,
                  'Spyder',
                  style: TextStyles.font18Bold.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          verticalSpace(10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    'ghffghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhfhjghggggggggggggggggggggggggggggggggg',
                    style: TextStyles.font20Regular,
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Text(
                  textAlign: TextAlign.start,
                  'Spyder',
                  style: TextStyles.font18Bold.copyWith(color: Colors.white),
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
                  return Padding(
                    padding: const EdgeInsets.only(right: 10, left: 15),
                    child: Column(
                      children: [
                        ClipOval(
                            child: Image.asset(
                          'assets/images/profile_image.jpg',
                          fit: BoxFit.cover,
                          height: 60.h,
                          width: 60.w,
                        )),
                        const Text(
                          'name',
                          style: TextStyles.textSkip,
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
