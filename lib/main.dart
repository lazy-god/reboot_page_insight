import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streak/screen/streak_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.purple[900], //or set color with: Color(0xFF0000FF)
    ));

    return MaterialApp(
      theme: ThemeData.light(),
      home: StreakScreen(),
    );
  }
}
