import 'package:flutter/material.dart';
import 'package:streak/constants.dart';

class StreakGraph extends StatelessWidget {
  final double maxHeight;
  StreakGraph(this.maxHeight);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              minHeight: maxHeight - 100,
            ),
          ),
        ],
      ),
      painter: StreakPainter((3 * maxHeight / 5)),
    );
  }
}

class StreakPainter extends CustomPainter {
  final double origin;
  StreakPainter(this.origin);

  double calcX(int factor, Size size) {
    return factor * size.width / 8 - 20;
  }

  double calcY(int score) {
    return score + 100.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    print('in here');
    Path path = Path();
    Paint paint = Paint();

//    final Gradient gradient = RadialGradient(
//      colors: [
//        Color.fromRGBO(255, 194, 82, 1),
//        Color.fromRGBO(255, 171, 85, 1),
//        Color.fromRGBO(255, 153, 86, 1),
//      ],
//    );
//    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);

    paint.color = Colors.white;
//    paint.shader = gradient.createShader(rect);
    paint.style = PaintingStyle.fill;

    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(calcX(1, size), calcY(150), kBarWidth, size.height),
        Radius.circular(kBarRadius),
      ),
    );
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(calcX(2, size), calcY(60), kBarWidth, size.height),
        Radius.circular(kBarRadius),
      ),
    );
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(calcX(3, size), calcY(90), kBarWidth, size.height),
        Radius.circular(kBarRadius),
      ),
    );
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(calcX(4, size), calcY(120), kBarWidth, size.height),
        Radius.circular(kBarRadius),
      ),
    );
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(calcX(5, size), calcY(0), kBarWidth, size.height),
        Radius.circular(kBarRadius),
      ),
    );
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(calcX(6, size), calcY(135), kBarWidth, size.height),
        Radius.circular(kBarRadius),
      ),
    );
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(calcX(7, size), calcY(45), kBarWidth, size.height),
        Radius.circular(kBarRadius),
      ),
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
