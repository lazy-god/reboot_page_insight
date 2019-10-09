import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  BottomBar({this.gradient, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: child,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                40.0,
              ),
              topLeft: Radius.circular(
                40.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
