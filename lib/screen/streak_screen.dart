import 'package:flutter/material.dart';
import 'package:streak/components/bottom_bar.dart';
import 'package:streak/components/streak_meter.dart';
import 'package:streak/components/streak_score.dart';
import 'package:streak/constants.dart';

class StreakScreen extends StatefulWidget {
  @override
  _StreakScreenState createState() => _StreakScreenState();
}

class _StreakScreenState extends State<StreakScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [
                Color.fromRGBO(107, 0, 255, 1),
                Color.fromRGBO(142, 23, 251, 1),
                Color.fromRGBO(1197, 111, 232, 1),
                Color.fromRGBO(239, 154, 216, 1),
              ],
            ),
          ),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.bubble_chart,
                    size: 35.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Streak',
                        style: kTitleText,
                      ),
                    ],
                  ),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return BottomBar(
                    minHeight: (2 * constraints.maxHeight / 3),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      colors: [
                        Color.fromRGBO(0, 244, 138, 1),
                        Color.fromRGBO(0, 220, 175, 1),
                        Color.fromRGBO(0, 178, 204, 1),
                      ],
                    ),
                    child: StreakScore(),
                  );
                },
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return BottomBar(
                    minHeight: (2 * constraints.maxHeight / 3) - 160,
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white,
                      ],
                    ),
                    child: StreakMeter(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
