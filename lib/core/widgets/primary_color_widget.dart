

import 'package:flutter/material.dart';

class PrimaryColorWidget extends StatelessWidget {
  const PrimaryColorWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.yellow.shade700, Colors.yellow.shade400],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}

