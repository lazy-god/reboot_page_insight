import 'package:flutter/material.dart';
import 'package:streak/components/streak_container.dart';
import 'package:streak/components/streak_score.dart';
import 'package:streak/components/tile.dart';
import 'package:streak/models/streak.dart';
import 'package:streak/services/db.dart';

import '../constants.dart';
import 'add_screen.dart';

class StreakScreen extends StatefulWidget {
  @override
  _StreakScreenState createState() => _StreakScreenState();
}

class _StreakScreenState extends State<StreakScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _heightFactorAnimation;
  double _collapsedHeightFactor = 0.47;
  double _expandedHeightFactor = 0;
  bool isAnimationCompleted = false;
  double screenHeight = 0;
  final DbProvider _dbProvider = DbProvider();
  List<Streak> _streakList;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
    _heightFactorAnimation = Tween<double>(
      begin: _collapsedHeightFactor,
      end: _expandedHeightFactor,
    ).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleVerticalUpdate(details) {
    double fractionDragged = details.primaryDelta / screenHeight;
    _controller.value = _controller.value - 2 * fractionDragged;
  }

  void _handleVerticalEnd(details) {
    if (_controller.value >= 0.5)
      _controller.forward();
    else
      _controller.reverse();
  }

  void updateStreakList() async {
    _streakList = await _dbProvider.getStreakList();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    if (_streakList == null) {
      _streakList = List<Streak>();
      updateStreakList();
    }

    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, widget) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
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
                        40.0,
                      ),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                if (await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddScreen(),
                                      ),
                                    ) !=
                                    0) {
                                  setState(() {
                                    updateStreakList();
                                  });
                                }
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
                    Expanded(
                      child: Container(
                        child: StreakScore(),
                        decoration: BoxDecoration(
                          gradient: kPurpleLinearGradient,
                          borderRadius: kSheetBorderRadius,
                        ),
                      ),
                    ),
                  ],
                ),
                FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 1 - _heightFactorAnimation.value,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onVerticalDragUpdate: _handleVerticalUpdate,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: kPadding,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 60.0,
                                  height: 5.0,
                                  decoration: BoxDecoration(
                                    color: kSecondaryColor,
                                    borderRadius: BorderRadius.circular(
                                      kPadding,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _streakList.length,
                            itemBuilder: (context, index) {
                              return Tile(
                                _streakList[index].title,
                                _streakList[index].goal.toString(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: kSheetBorderRadius,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
