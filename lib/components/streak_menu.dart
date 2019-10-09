import 'package:flutter/material.dart';
import 'package:streak/components/streak_container.dart';
import 'package:streak/constants.dart';

class StreakMenu extends StatefulWidget {
  final Function onTap;
  final Widget icon;
  final String text;
  StreakMenu({this.icon, this.text, this.onTap});

  @override
  _StreakMenuState createState() => _StreakMenuState();
}

class _StreakMenuState extends State<StreakMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kPadding,
      ),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: widget.onTap,
            child: StreakContainer(
              child: widget.icon,
              gradient: kLightBlueGreyLinearGradient,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: kPadding,
            ),
            child: Text(
              widget.text,
              style: kStreakText.copyWith(
                color: kSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
