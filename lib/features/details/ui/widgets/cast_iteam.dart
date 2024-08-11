import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/text_style.dart';
import '../../data/models/movie_credits.dart';

class CastItem extends StatelessWidget {
  const CastItem({
    super.key, this.credits, required this.index,
  });

  final MovieCredits? credits;
  final int index ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 15),
      child: Column(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              width: 60.w,
              height: 60.h,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Image.network(
                'https://pixsector.com/cache/517d8be6/av5c8336583e291842624.png',
                width: 60.w,
                height: 60.h,
                fit: BoxFit.cover,
              ),
              placeholder: (context, url) =>
                  Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  color: Colors.white,
                ),
              ),
              imageUrl: 'https://image.tmdb.org/t/p/w500${credits!.cast![index].profilePath}',
            ),
          ),
           Container(
             alignment: Alignment.center,

             child: Text(
              credits!.cast![index].name.toString(),
              style: TextStyles.textSkip.copyWith(
                fontSize: 15.sp,

              ),
               maxLines: 2,
                       ),
           ),
        ],
      ),
    );
  }
}
