import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/spacing.dart';
import 'package:movie_app/core/theming/text_style.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 2, // Example review count
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/circle_avatar.png'),
                // Replace with actual image URL
                radius: 24,
              ),
              horizontalSpace(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title",
                        style: TextStyles.font18SemiBoldWhite,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    Text(
                      " subtitle",
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
                  "6.7",
                  style: TextStyles.font18SemiBoldWhite,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
