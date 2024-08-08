
import 'package:flutter/material.dart';

class ImageBack extends StatelessWidget {
  final int top;

  const ImageBack({
    super.key,
    required this.top,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top.toDouble(), left: 10),
      child: Image.asset(
        "assets/images/icon_back.png",
        width: 14,
        height: 24,
      ),
    );
  }
}
