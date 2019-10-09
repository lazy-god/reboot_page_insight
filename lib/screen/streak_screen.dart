import 'package:flutter/material.dart';
import 'package:streak/components/bottom_bar.dart';
import 'package:streak/components/streak_container.dart';
import 'package:streak/components/streak_score.dart';
import 'package:streak/constants.dart';
import 'package:streak/models/streak.dart';
import 'package:streak/screen/add_screen.dart';
import 'package:streak/services/db.dart';

class StreakScreen extends StatefulWidget {
  @override
  _StreakScreenState createState() => _StreakScreenState();
}

class _StreakScreenState extends State<StreakScreen> {
  final DbProvider _dbProvider = DbProvider();
  List<Streak> _streakList;

  @override
  Widget build(BuildContext context) {
    if (_streakList == null) {
      _streakList = List<Streak>();
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: kLightBlueGreyLinearGradient,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: kPadding,
                ),
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
              Padding(
                padding: const EdgeInsets.all(
                  50.0,
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(
                            kPadding,
                          ),
                          child: StreakContainer(
                            child: Hero(
                              tag: kTagAddScreen,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8.0,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    'Add Streak',
                                    style: kStreakText.copyWith(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            gradient: kMediumBlueGreyLinearGradient,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomBar(
                gradient: kPurpleLinearGradient,
                child: StreakScore(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
