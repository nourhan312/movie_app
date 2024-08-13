

import 'package:flutter/material.dart';

class AnimatedCircle extends StatelessWidget {
  final AnimationController controller;
  final double scaleFactor;
  final Color color;

  const AnimatedCircle({
    super.key,
    required this.controller,
    required this.scaleFactor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: (controller.value * scaleFactor) + 1,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        );
      },
    );
  }
}
