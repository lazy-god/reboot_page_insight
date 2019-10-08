import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streak/components/streak_dialog.dart';
import 'package:streak/components/streak_icon.dart';
import 'package:streak/constants.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _textFieldController = TextEditingController();
  int _currentIconIndex = 0;
  bool _showCursor = true;

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
    setState(() {
      _currentIconIndex = newIndex;
    });
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
                      Navigator.pop(context);
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
                        tag: kTagTitle,
                        child: Text(
                          'Streak',
                          style: kTitleText,
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Icon(
                      Icons.arrow_back_ios,
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
                              child: GestureDetector(
                                onTap: () {
                                  _chooseIcon();
                                },
                                child: StreakContainer(
                                  child: Icon(
                                    kIconList[_currentIconIndex],
                                    size: 60.0,
                                    color: kPrimaryColor,
                                  ),
                                  gradient: kLightPurpleLinearGradient,
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
                      onTap: () {
                        print('continue');
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
