import 'package:flutter/material.dart';
import 'package:streak/constants.dart';

class StreakScore extends StatefulWidget {
  @override
  _StreakScoreState createState() => _StreakScoreState();
}

class _StreakScoreState extends State<StreakScore> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40.0,
        right: 30.0,
        left: 30.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: RichText(
              text: TextSpan(
                text: '8',
                style: kImpStreakText,
                children: [
                  TextSpan(
                    text: ' Left of',
                    style: kStreakText,
                  ),
                  TextSpan(
                    text: '\n15',
                    style: kStreakText.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' Streaks',
                    style: kStreakText,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 50.0,
          ),
          Expanded(
            child: RichText(
              textAlign: TextAlign.end,
              text: TextSpan(
                text: 'Your current streak score\n',
                style: kStreakText,
                children: [
                  TextSpan(
                    text: 'is ',
                    style: kStreakText,
                  ),
                  TextSpan(
                    text: '9',
                    style: kImpStreakText.copyWith(fontSize: 24.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
