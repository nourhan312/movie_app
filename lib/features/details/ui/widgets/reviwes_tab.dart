import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/spacing.dart';
import 'package:movie_app/core/theming/text_style.dart';

import '../../data/models/review_model.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key, required this.review});

  final List<Review> review;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: review.length, // Example review count
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // CircleAvatar(
              //   backgroundImage: CachedNetworkImage(
              //     imageUrl: review[index].authorDetails.avatarPath ?? '',
              //
              // )

              //  CircleAvatar(
              //   backgroundImage: AssetImage('assets/images/circle_avatar.png'),
              //   // Replace with actual image URL
              //   radius: 24,
              // ),
              horizontalSpace(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review[index].author,
                        style: TextStyles.font18SemiBoldWhite,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    Text(
                      review[index].content,
                      style: TextStyles.font14Medium,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  review[index].authorDetails.rating.toString(),
                  style: TextStyles.font18SemiBoldWhite,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
