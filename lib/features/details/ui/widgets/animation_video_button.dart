

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animated_circle.dart';
import 'custom__icon_button.dart';
import 'movie_image_and_icons.dart';

class AnimatedVideoButton extends StatefulWidget {
  final void Function() onTap;

  const AnimatedVideoButton({super.key, required this.onTap});

  @override
  _AnimatedVideoButtonState createState() => _AnimatedVideoButtonState();
}

class _AnimatedVideoButtonState extends State<AnimatedVideoButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true,period:const Duration(seconds: 2) );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Animated circles
        for (int i = 3; i > 0; i--)
          AnimatedCircle(
            controller: _controller,
            scaleFactor: 1.6 * i,
            color: Colors.red.withOpacity(0.1 * i),
          ),
        // Video Icon Button
        CustomIconButton(
          radius: 30,
          iconSize: 40,
          icon: CupertinoIcons.play_fill,
          onTap: widget.onTap,
          color: Colors.red,
          leftPadding: 5,
        ),
      ],
    );
  }
}