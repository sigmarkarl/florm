import 'dart:ui';

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
    /*var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff222222);
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);*/
    //canvas.drawPicture(picture)

    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff000000);

    var pictureRecorder = PictureRecorder();
    var pictureCanvas = Canvas(pictureRecorder);
    /*if (florm.image != null) {
      pictureCanvas.drawImage(florm.image!, Offset.zero, paint);
      //pictureCanvas.drawRect(const Rect.fromLTWH(230, 340, 35, 35), paint);
    }*/
    if (florm.image != null) {
      //pictureCanvas.drawPicture(florm.lastPicture!);
      pictureCanvas.drawImage(florm.image!, Offset.zero, paint);
      //pictureCanvas.drawRect(const Rect.fromLTWH(230, 340, 35, 35), paint);
      florm.lastPicture!.dispose();
      florm.image!.dispose();
    } else {
      pictureCanvas.drawRect(
          Rect.fromLTWH(0, 0, size.width, size.height), paint);
    }

    if (florm.increment) {
      debugPrint("increment");
      florm.increment = false;
      florm.startGame(pictureCanvas, size.width, size.height);
    } else {
      debugPrint("update");
      florm.step(pictureCanvas, 0);
      florm.updateCoordinates(pictureCanvas, false, size.width, size.height);
    }

    //pictureCanvas.drawRect(Rect.fromLTWH(340.0 + count, 440, 35, 35), paint);

    florm.lastPicture = pictureRecorder.endRecording();
    canvas.drawPicture(florm.lastPicture!);
    //canvas.drawRect(const Rect.fromLTWH(240, 240, 25, 25), paint);
    florm.image =
        florm.lastPicture!.toImageSync(size.width.toInt(), size.height.toInt());

    count++;
    /*if (count%100 == 0) {
      florm.image
    }*/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
