import 'package:flutter/material.dart';
import 'package:streak/components/streak_container.dart';
import 'package:streak/constants.dart';

class Tile extends StatefulWidget {
  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StreakContainer(
            child: Icon(
              Icons.shopping_cart,
              color: Colors.deepPurple,
            ),
            gradient: kLightPurpleLinearGradient,
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Shopping',
                        style: kStreakText.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        '300',
                        style: kStreakText.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    right: 20.0,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 25.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          color: Colors.blueGrey[100],
                        ),
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            height: 25.0,
                            width: constraints.maxWidth / 2,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                                gradient: kMediumPurpleLinearGradient),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Awesome! You are on right track',
                      style: kStreakText.copyWith(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 1.0,
                  color: Colors.blueGrey[100],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
