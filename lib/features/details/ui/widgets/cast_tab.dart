import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/text_style.dart';

class CastTab extends StatelessWidget {
  const CastTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.1,
        ),
        itemBuilder: (context, index) => _buildCastMember("dsdfdsfsd", ""),
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
                imageUrl: "https://th.bing.com/th/id/R.f9ac57f813fa30e9f1da619bdfe74e3b?rik=BK9l5FwWIPcoxg&riu=http%3a%2f%2fimages5.fanpop.com%2fimage%2fphotos%2f26900000%2fSpider-Man-spider-man-26910501-1440-900.jpg&ehk=g4ZjdTBtXupdVdblpx5LjFejKu0J71Z2jA5JHWYDrp8%3d&risl=&pid=ImgRaw&r=0")),
        const SizedBox(height: 8),
        Text(name, style: TextStyles.font20MediumWhite),
      ],
    );
  }
}
