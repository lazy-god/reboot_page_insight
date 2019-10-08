import 'package:flutter/material.dart';
import 'package:streak/components/bottom_bar.dart';
import 'package:streak/components/streak_meter.dart';
import 'package:streak/components/streak_score.dart';
import 'package:streak/constants.dart';
import 'package:streak/screen/add_screen.dart';

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
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.bubble_chart,
                        size: 35.0,
                        color: Colors.deepPurple,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddScreen(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.add_box,
                          size: 35.0,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 60.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Hero(
                        tag: kTagTitle,
                        child: Text(
                          'Streak',
                          style: kTitleText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return BottomBar(
                    minHeight: (4 * constraints.maxHeight / 5),
                    gradient: kPurpleLinearGradient,
                    child: StreakScore(),
                  );
                },
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return BottomBar(
                    minHeight: (4 * constraints.maxHeight / 5) - 160,
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
