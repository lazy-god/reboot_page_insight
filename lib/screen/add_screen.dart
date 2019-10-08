import 'package:flutter/material.dart';
import 'package:streak/components/streak_dialog.dart';
import 'package:streak/components/streak_icon.dart';
import 'package:streak/constants.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _textFieldController = TextEditingController();
  var _currentIcon = 1;

  @override
  void initState() {
    _textFieldController.text = '60';
    super.initState();
  }

  Future<void> _chooseIcon() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return StreakDialog();
        });
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
//                      Navigator.pop(context);
                      _chooseIcon();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: kPadding,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kPrimaryColor,
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
                    color: kPrimaryColor,
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
                          color: kPrimaryColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                        ),
                        decoration: kTextFieldBorderDecoration,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: kPadding,
                                top: kPadding,
                              ),
                              child: IndexedStack(
                                index: _currentIcon,
                                children: <Widget>[
                                  StreakContainer(
                                    Icon(
                                      Icons.shopping_cart,
                                      size: 60.0,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  StreakContainer(
                                    Icon(
                                      Icons.add,
                                      size: 60.0,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  StreakContainer(
                                    Icon(
                                      Icons.report_problem,
                                      size: 60.0,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  StreakContainer(
                                    Icon(
                                      Icons.group_work,
                                      size: 60.0,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  StreakContainer(
                                    Icon(
                                      Icons.bubble_chart,
                                      size: 60.0,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                StreakContainer(
                                  Icon(
                                    Icons.remove,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: TextField(
                                      controller: _textFieldController,
                                      textAlign: TextAlign.center,
                                      style: kStreakText.copyWith(
                                        color: kPrimaryColor,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      decoration:
                                          kTextFieldBorderDecoration.copyWith(
                                        labelText: '',
                                      ),
                                    ),
                                  ),
                                ),
                                StreakContainer(
                                  Icon(
                                    Icons.add,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(kPadding),
                                  child: StreakContainer(
                                    Text(
                                      '100',
                                      style: kStreakText.copyWith(
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: StreakContainer(
                                    Text(
                                      '200',
                                      style: kStreakText.copyWith(
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: StreakContainer(
                                    Text(
                                      '300',
                                      style: kStreakText.copyWith(
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: StreakContainer(
                                    Text(
                                      '500',
                                      style: kStreakText.copyWith(
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
