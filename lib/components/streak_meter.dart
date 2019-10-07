import 'package:flutter/material.dart';
import 'package:streak/components/tile.dart';

class StreakMeter extends StatefulWidget {
  @override
  _StreakMeterState createState() => _StreakMeterState();
}

class _StreakMeterState extends State<StreakMeter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: Center(
            child: Container(
              width: 80.0,
              height: 4.0,
              decoration: BoxDecoration(
                color: Colors.blueGrey[200],
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              Tile(),
              Tile(),
              Tile(),
              Tile(),
            ],
          ),
        ),
      ],
    );
  }
}
