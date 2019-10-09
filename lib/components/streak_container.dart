import 'package:flutter/material.dart';

class StreakContainer extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  StreakContainer({this.child, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
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
