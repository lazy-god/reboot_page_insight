import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final double minHeight;
  final Widget child;
  final LinearGradient gradient;
  BottomBar({this.minHeight, this.gradient, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          constraints: BoxConstraints(
            minHeight: minHeight,
          ),
          height: 30.0,
          child: child,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                30.0,
              ),
              topLeft: Radius.circular(
                30.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
