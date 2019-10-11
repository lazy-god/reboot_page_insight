import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streak/components/streak_container.dart';
import 'package:streak/components/streak_dialog.dart';
import 'package:streak/components/streak_menu.dart';
import 'package:streak/constants.dart';
import 'package:streak/models/streak.dart';
import 'package:streak/services/db.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final DbProvider _dbProvider = DbProvider();
  final _textFieldController = TextEditingController();
  int _currentIconIndex = 0;
  bool _showCursor = true;
  bool _check = false;
  Color _checkColor = kSecondaryColor;
  String _titleText;

  @override
  void initState() {
    _textFieldController.text = '60';
    super.initState();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _chooseIcon() async {
    int newIndex = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StreakDialog();
      },
    );
    if (newIndex != null) {
      setState(() {
        _currentIconIndex = newIndex;
      });
    }
  }

  Widget _getChip(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showCursor = false;
        });
        _textFieldController.text = text;
      },
      child: StreakContainer(
        child: Text(
          text,
          style: kStreakText.copyWith(
            color: kSecondaryColor,
          ),
        ),
        gradient: kLightBlueGreyLinearGradient,
      ),
    );
  }

  Future<int> _insertStreak(Streak streak) async {
    return await _dbProvider.insertStreak(streak);
  }

  Widget _getCounters(IconData icon, bool add) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showCursor = false;
        });
        int curr = 0;
        if (add) {
          curr = int.parse(_textFieldController.text) + 1;
        } else {
          curr = int.parse(_textFieldController.text) - 1;
          if (curr < 0) curr = 0;
        }
        _textFieldController.text = curr.toString();
      },
      child: StreakContainer(
        child: Icon(
          icon,
          color: kSecondaryColor,
        ),
        gradient: kLightBlueGreyLinearGradient,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            kPadding,
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, 0);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: kPadding,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kSecondaryColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Hero(
                        tag: kTagAddScreen,
                        child: Text(
                          'Add Streak',
                          style: kTitleText,
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: kPadding,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 60.0,
                  left: 16.0,
                  right: 16.0,
                  bottom: 16.0,
                ),
                child: Text(
                  kAddScreenText,
                  style: kStreakText.copyWith(
                    color: kSecondaryColor,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _titleText = value;
                          });
                        },
                        style: kStreakText.copyWith(
                          color: kSecondaryColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                        ),
                        decoration: kTextFieldBorderDecoration,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                _getCounters(Icons.remove, false),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: TextField(
                                      onTap: () {
                                        setState(() {
                                          _showCursor = true;
                                        });
                                      },
                                      showCursor: _showCursor,
                                      keyboardType: TextInputType.number,
                                      controller: _textFieldController,
                                      textAlign: TextAlign.center,
                                      style: kImpStreakText.copyWith(
                                        color: kSecondaryColor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                _getCounters(Icons.add, true),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                _getChip('100'),
                                _getChip('200'),
                                _getChip('300'),
                                _getChip('500'),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: kPadding,
                                top: kPadding,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    16.0,
                                  ),
                                  gradient: kLightBlueGreyLinearGradient,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(kPadding),
                                  child: Column(
                                    children: <Widget>[
                                      StreakMenu(
                                        onTap: () {
                                          _chooseIcon();
                                        },
                                        icon: Icon(
                                          kIconList[_currentIconIndex],
                                          color: kPrimaryColor,
                                        ),
                                        text: 'Choose Avatar',
                                      ),
                                      StreakMenu(
                                        onTap: () {
                                          setState(() {
                                            if (!_check) {
                                              _check = true;
                                              _checkColor = kPrimaryColor;
                                            } else {
                                              _check = false;
                                              _checkColor = kSecondaryColor;
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          Icons.fiber_manual_record,
                                          color: _checkColor,
                                        ),
                                        text: 'Reset (on miss)',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(16.0),
                    child: GestureDetector(
                      onTap: () async {
                        Streak streak = Streak(
                          _titleText,
                          int.parse(_textFieldController.text),
                        );
                        int result = await _insertStreak(streak);
                        print(result);
                        Navigator.pop(context, result);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          gradient: kPurpleLinearGradient,
                        ),
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Continue',
                          style: kStreakText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
