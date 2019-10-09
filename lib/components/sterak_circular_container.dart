import 'package:flutter/material.dart';

class StreakCircularContainer extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  StreakCircularContainer({this.child, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          100.0,
        ),
        gradient: gradient,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
