

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/home_screen/ui/widgets/trending_number.dart';

class TrendingListViewItem extends StatelessWidget {
  const TrendingListViewItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5),
      child: SizedBox(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl:
                  "https://th.bing.com/th/id/R.0438cecf7c1e229e771a171015b4617a?rik=g%2fVb%2fHREm9KMiA&pid=ImgRaw&r=0",
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            TrendingNumber(index: index),
          ],
        ),
      ),
    );
  }
}
