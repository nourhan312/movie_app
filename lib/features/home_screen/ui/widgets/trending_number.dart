


import 'package:flutter/material.dart';

class TrendingNumber extends StatelessWidget {
  const TrendingNumber({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Text(
          textAlign: TextAlign.end,
          '${index +1}',
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = Colors.blue,
          ),
        ),
        Text(
          textAlign: TextAlign.end,
          '${index +1}',
          style: const TextStyle(
            fontSize: 100,
            color: Color(0xFF242A32),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
