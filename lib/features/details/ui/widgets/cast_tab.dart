import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/text_style.dart';
import '../../data/models/movie_credits.dart';

class CastTab extends StatelessWidget {
  const CastTab({super.key, this.credits});
  final MovieCredits? credits;

  @override
  Widget build(BuildContext context) {
    List cast = credits!.cast!;
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: GridView.builder(
        itemCount: cast.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.1,
        ),
        itemBuilder: (context, index) => _buildCastMember(
            cast[index].name.toString(), cast[index].profilePath.toString()),
      ),
    );
  }

  Widget _buildCastMember(String name, String imageUrl) {
    return Column(
      children: [
        ClipOval(
          child: CachedNetworkImage(
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              imageUrl: 'https://image.tmdb.org/t/p/w500/$imageUrl'),
        ),
        const SizedBox(height: 8),
        Text(name, style: TextStyles.font20MediumWhite),
      ],
    );
  }
}
