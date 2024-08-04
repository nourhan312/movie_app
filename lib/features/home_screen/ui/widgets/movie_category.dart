import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/text_style.dart';

class MovieCategory extends StatelessWidget {
  const MovieCategory({super.key, required this.movies});

  final List<Map<String, String>> movies;


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
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl:
                "https://th.bing.com/th/id/R.0438cecf7c1e229e771a171015b4617a?rik=g%2fVb%2fHREm9KMiA&pid=ImgRaw&r=0",
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              movie['title']!,
              style: TextStyles.font16SemiBold,
            ),
          ],
        );
      },
    );
  }
}