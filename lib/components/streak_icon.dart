import 'package:flutter/material.dart';
import 'package:streak/constants.dart';

class StreakContainer extends StatelessWidget {
  final Widget child;
  StreakContainer(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        gradient: kLightPurpleLinearGradient,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
