import 'package:flutter/material.dart';
import 'package:streak/screen/streak_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: StreakScreen(),
    );
  }
}
