import 'package:flutter/material.dart';
import 'package:streak/components/streak_icon.dart';
import 'package:streak/constants.dart';

class StreakDialog extends StatefulWidget {
  @override
  _StreakDialogState createState() => _StreakDialogState();
}

class _StreakDialogState extends State<StreakDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        kPadding,
      )),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Choose Image',
              style: kStreakText.copyWith(
                color: kPrimaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: kPadding,
              ),
              child: Table(
                children: [
                  TableRow(
                    children: List.generate(
                      4,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StreakContainer(
                            Icon(
                              Icons.add,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  TableRow(
                    children: List.generate(
                      4,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StreakContainer(
                            Icon(
                              Icons.add,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  TableRow(
                    children: List.generate(
                      4,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StreakContainer(
                            Hero(
                              tag: kTagIcon,
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
