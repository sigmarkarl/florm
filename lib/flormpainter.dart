import 'package:flutter/material.dart';
import 'florm.dart';
//import 'package:treedraw/main.dart';

class FlormPainter extends CustomPainter {
  Florm florm;
  static int count = 0;

  FlormPainter(this.florm);

  @override
  void paint(Canvas canvas, Size size) {
    //treeDraw.drawTree(canvas, size, treeUtil);
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff222222);
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    //canvas.drawRect(rect, paint);

    if (florm.increment) {
      debugPrint("increment");
      florm.increment = false;
      florm.startGame(canvas, size.width, size.height);
    } else {
      debugPrint("update");
      florm.step(canvas, 0);
      florm.updateCoordinates(canvas, false, size.width, size.height);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
