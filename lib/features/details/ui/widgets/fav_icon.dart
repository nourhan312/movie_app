import 'package:flutter/material.dart';

class FavIcon extends StatefulWidget {
  const FavIcon({super.key});

  @override
  _FavIconState createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  Color iconColor = Colors.white; // Initial color

  void _toggleIconColor() {
    setState(() {
      iconColor = iconColor == Colors.red ? Colors.white : Colors.red; // Toggle color
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite, color: iconColor),
      onPressed: _toggleIconColor,
    );
  }
}