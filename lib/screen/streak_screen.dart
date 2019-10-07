import 'package:flutter/material.dart';
import 'package:streak/components/bottom_bar.dart';

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
                  child: Icon(
                    Icons.bubble_chart,
                    size: 35.0,
                    color: Colors.purple[700],
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
                        style: TextStyle(
                          fontFamily: 'Architects Daughter',
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  print(constraints.maxHeight);
                  return BottomBar(
                    minHeight: (2 * constraints.maxHeight / 3),
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple[700],
                        Colors.purple[200],
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('5 St left of 10 St'),
                        Text(''),
                      ],
                    ),
                  );
                },
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  print(constraints.maxHeight);
                  return BottomBar(
                    minHeight: (2 * constraints.maxHeight / 3) - 150,
                    gradient: LinearGradient(colors: [
                      Colors.white,
                      Colors.white,
                    ]),
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
