


import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMovieCategory extends StatelessWidget {
  const ShimmerMovieCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 20,
        childAspectRatio: 0.6,
      ),
      itemCount: 6,  // Arbitrary number of shimmer items
      itemBuilder: (context, index) {
        return buildShimmerGridViewItem();
      },
    );
  }

  Column buildShimmerGridViewItem() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 160,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 20,
            width: 100,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}