import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/text_style.dart';

class OverviewText extends StatefulWidget {
  final String text;

  const OverviewText({Key? key, required this.text}) : super(key: key);

  @override
  _OverviewTextState createState() => _OverviewTextState();
}

class _OverviewTextState extends State<OverviewText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          overflow: TextOverflow.ellipsis,
          maxLines: isExpanded ? null : 8, // Show more lines if expanded
          style: TextStyles.font18SemiBoldWhite
              .copyWith(color: Colors.white.withOpacity(0.8),
              fontSize: 16.sp

          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? "Show Less" : "Read More",
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
