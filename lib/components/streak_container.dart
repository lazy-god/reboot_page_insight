import 'package:flutter/material.dart';
import 'package:streak/constants.dart';

class StreakContainer extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final Function onTap;
  StreakContainer({this.child, this.gradient, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        gradient: gradient,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              kPadding,
            ),
            child: child,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
