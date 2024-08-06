import 'package:flutter/material.dart';

class CastTab extends StatelessWidget {
  const CastTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16.0),
      crossAxisCount: 2,
      children: [
        _buildCastMember('Tom Holland', 'assets/images/circle_avatar.png'),
        _buildCastMember('Zendaya', 'assets/images/circle_avatar.png'),
        _buildCastMember('Benedict Cumberbatch', 'assets/images/circle_avatar.png'),
        _buildCastMember('Brad Pitt', 'assets/images/circle_avatar.png'),
      ],
    );
  }

  Widget _buildCastMember(String name, String imageUrl) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imageUrl),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
