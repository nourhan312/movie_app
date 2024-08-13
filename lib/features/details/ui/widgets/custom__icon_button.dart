
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.color,
    this.iconColor = Colors.white,
    this.radius,
    this.iconSize,
    this.leftPadding,
  });
  final IconData icon;
  final void Function() onTap;

  final Color? color;
  final double? radius;
  final double? iconSize;
  final double? leftPadding;
  final iconColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: color ?? Colors.black38,
        radius: radius ?? 20.sp,
        child: Padding(
          padding: EdgeInsets.only(left: leftPadding ?? 0.0),
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize ?? 27.sp,
          ),
        ),
      ),
    );
  }
}
