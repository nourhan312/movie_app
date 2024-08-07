import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/text_style.dart';
import '../../data/models/movie_credits.dart';

class CastTab extends StatelessWidget {
  const CastTab({super.key, this.credits});
  final MovieCredits? credits;

  @override
  Widget build(BuildContext context) {
    List cast = credits!.cast!;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GridView.builder(
        itemCount: cast.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.01,
        ),
        itemBuilder: (context, index) => _buildCastMember(
            cast[index].name.toString(), cast[index].profilePath.toString()),
      ),
    );
  }

  Widget _buildCastMember(String name, String imageUrl) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              width: 100,
              height: 120,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Image.network(
                'https://pixsector.com/cache/517d8be6/av5c8336583e291842624.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 120,
                  height: 120,
                  color: Colors.white,
                ),
              ),
              imageUrl: 'https://image.tmdb.org/t/p/w500$imageUrl',
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            name,
            style: TextStyles.font20MediumWhite,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
