import 'package:flutter/material.dart';
import 'package:streak/components/streak_icon.dart';
import 'package:streak/constants.dart';

class StreakDialog extends StatefulWidget {
//  final Function onIconChange;
//  StreakDialog({this.onIconChange});

  @override
  _StreakDialogState createState() => _StreakDialogState();
}

class _StreakDialogState extends State<StreakDialog> {
  List<Widget> getChildren(int st, int en, List<IconData> iconList) {
    List<Widget> children = List();
    for (int i = st; i < en; ++i) {
      children.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context, i);
            },
            child: StreakContainer(
              child: Icon(
                iconList[i],
                color: kSecondaryColor,
              ),
              gradient: kLightBlueGreyLinearGradient,
            ),
          ),
        ),
      );
    }
    return children;
  }

  List<TableRow> getTable(List<IconData> iconList) {
    List<TableRow> tableRow = List();
    tableRow.add(TableRow(children: getChildren(0, 4, iconList)));
    tableRow.add(TableRow(children: getChildren(4, 8, iconList)));
    tableRow.add(TableRow(children: getChildren(8, 12, iconList)));
    return tableRow;
  }

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
                children: getTable(kIconList),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
