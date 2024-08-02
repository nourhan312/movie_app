
import 'package:flutter/material.dart';
import 'package:movie_app/core/theming/text_style.dart';

class TextWidgetOnDrawer extends StatelessWidget {
  final String text;

  const TextWidgetOnDrawer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 5),
      child: Text(text,style: TextStyles.font27Regular,),
    );
  }
}
