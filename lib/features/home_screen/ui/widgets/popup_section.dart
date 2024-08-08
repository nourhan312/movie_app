

import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/extentions.dart';
import 'package:movie_app/core/helper/spacing.dart';
import '../../../../core/routing/routes.dart';

class PopupSection extends StatelessWidget {
  const PopupSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      position: PopupMenuPosition.under,
      onSelected: (String result) {
        switch (result) {
          case 'Search':
          context.pushNamed(Routes.searchScreen);
            break;
          case 'Favorite':
            context.pushNamed(Routes.favScreen);
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
         PopupMenuItem<String>(
          value: 'Search',
          child: Row(
            children: [
              const Text('Search'),
              horizontalSpace(5),
              const Icon(Icons.search)
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'Favorite',
          child: Row(
            children: [
              const Text('Favorite'),
              horizontalSpace(5),
              const Icon(Icons.favorite_outline)
            ],
          ),
        ),
      ],
      child: const Icon(
        color: Colors.white,
        Icons.more_vert,
        size: 26,
      ),
    );
  }
}