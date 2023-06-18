import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

import 'florm.dart';
import 'highscore.dart';

class Worm {
  Florm florm;

  double r = 0.0;
  double a = 0.0;
  double s = 0.0;
  Color c = Colors.black;
  int d = 0;
  double adiv = 0.0;

  double tx = 0;
  double ty = 0;

  String left = "";
  String right = "";
  String leftv = "";
  String rightv = "";

  List<double> xs = [];
  List<double> ys = [];

  int i = 0;
  int l = 0;

  bool quatel = false;
  bool deflec = false;
  bool extlif = false;

  int score = 0;

  //HorizontalPanel hp = HorizontalPanel();
  //TextBox scorebox = TextBox();

  // ValueBox<Integer> scorebox = new ValueBox<Integer>();

  Worm.withAngle(this.florm, this.c, this.left, this.right, this.leftv,
      this.rightv, double angle) {
    Worm(florm, c, left, right, leftv, rightv, angle, florm.lorcon,
        florm.criang, florm.quatel, florm.dipill, florm.deflec, florm.extlif);
  }

  Worm.construct(
      this.florm, this.c, this.left, this.right, this.leftv, this.rightv) {
    Worm(florm, c, left, right, leftv, rightv, pi / 2.0, florm.lorcon,
        florm.criang, florm.quatel, florm.dipill, florm.deflec, florm.extlif);
  }

  Worm(
      this.florm,
      this.c,
      this.left,
      this.right,
      this.leftv,
      this.rightv,
      double angle,
      bool lorcon,
      bool criang,
      this.quatel,
      bool dipill,
      this.deflec,
      this.extlif) {
    r = 5.0;
    l = 24;
    i = 0;

    tx = -1.0;
    ty = -1.0;

    if (criang) {
      adiv = 12.0;
    } else {
      adiv = 16.0;
    }

    if (dipill) {
      d = 12;
    } else {
      d = 18;
    }

    if (lorcon) {
      s = 6.5;
    } else {
      s = 8.5;
    }

    score = 0;

    /*Canvas label = Canvas.createIfSupported();

    label.setSize("18px", "18px");
    label.setCoordinateSpaceWidth(18);
    label.setCoordinateSpaceHeight(18);
    Context2d context = label.getContext2d();
    context.clearRect(0.0, 0.0, 20.0, 20.0);
    context.setFillStyle(c);
    context.beginPath();
    context.arc(9.0, 10.0, 6.0, 0.0, pi * 2.0);
    context.fill();
    context.closePath();
    scorebox.setSize("24px", "10px");
    scorebox.setPixelSize(24, 10);
    scorebox.setReadOnly(true);
    scorebox.setText("0");

    hp.add(label);
    hp.add(scorebox);

    florm.hscore.add(hp);*/

    xs = [];
    ys = [];

    double w = florm.cv!.getLocalClipBounds().width;
    double h = florm.cv!.getLocalClipBounds().height;

    double x;
    double y;

    int ws = florm.worms.length;
    if (ws == 0) {
      a = angle;
      x = w / 2.0;
      y = h - 10.0;
    } else if (ws == 1) {
      a = 0.0;
      x = 10.0;
      y = h / 2.0;
    } else {
      // if( ws == 2 ) {
      a = pi;
      x = w - 10.0;
      y = h / 2.0;
    }

    xs.add(x);
    ys.add(y);
  }

  void kill() {
    xs.clear();
    ys.clear();

    //florm.hscore.remove(hp);
    florm.worms.remove(this);
    if (florm.uid != "" &&
        florm.uid.isNotEmpty &&
        (score > florm.highscore ||
            (score == florm.highscore &&
                (florm.cv!.getLocalClipBounds().width *
                        florm.cv!.getLocalClipBounds().height <
                    florm.highwidth * florm.highheight)))) {
      // String name = fuids.get( Long.parseLong(uid) );
      if (florm.uid != florm.huid) {
        // new sendMessage(huid, "You have been challenged in WebWorm", score, this);
      } else {
        String superpowers = "";
        if (florm.lorcon) {
          superpowers = superpowers.isEmpty ? "lorcon" : "\tlorcon";
        }
        if (florm.quatel) {
          superpowers = superpowers.isEmpty ? "quatel" : "\tquatel";
        }
        if (florm.dipill) {
          superpowers = superpowers.isEmpty ? "dipill" : "\tdipill";
        }
        if (florm.luck) {
          superpowers = superpowers.isEmpty ? "luck" : "\tluck";
        }
        if (florm.extlif) {
          superpowers = superpowers.isEmpty ? "extlif" : "\textlif";
        }
        if (florm.deflec) {
          superpowers = superpowers.isEmpty ? "deflec" : "\tdeflec";
        }
        if (florm.criang) {
          superpowers = superpowers.isEmpty ? "criang" : "\tcriang";
        }
        if (florm.mondes) {
          superpowers = superpowers.isEmpty ? "mondes" : "\tmondes";
        }

        saveHighScore(score, this, superpowers, "");
      }
    }

    //if (timer != null && worms.size() == 0) timer.cancel();
  }

  void setTarget(double x, double y) {
    tx = x;
    ty = y;
  }

  void advance(Canvas context, double w, double h) {
    if (xs.isEmpty) {
      kill();
    } else {
      if (l < xs.length) {
        i = min(i, xs.length - 1);
        double tx = xs.removeAt((i + 1) % xs.length);
        double ty = ys.removeAt((i + 1) % ys.length);
        draw(context, tx, ty, r + 2.0, Colors.black, Colors.black);
      } else {
        if (florm.keyset.contains(left) || florm.keyset.contains(leftv)) {
          a += pi / adiv;
          tx = -1;
          // if( a >= Math.PI ) a -= 2.0*Math.PI;
        }

        if (florm.keyset.contains(right) || florm.keyset.contains(rightv)) {
          a -= pi / adiv;
          tx = -1;
          // if( a < -Math.PI ) a += 2.0*Math.PI;
        }

        double ox = getX();
        double oy = getY();
        if (tx >= 0) {
          double angle = atan2(oy - ty, tx - ox);
          double na = a / (2.0 * pi);
          double fl = na.abs().floorToDouble();
          na = na >= 0 ? (na - fl) * 2.0 * pi : (na + fl + 1.0) * 2.0 * pi;
          na = na >= pi ? na - 2.0 * pi : na;

          double adel = pi / adiv;
          double diffa = angle - na;
          double adiffa = diffa.abs();
          if (adiffa < adel) {
            a = angle;
            tx = -1;
          } else if (adiffa < pi) {
            a += angle < na ? -adel : adel;
          } else {
            a += angle < na ? adel : -adel;
          }
        }

        double dx = s * cos(a);
        double dy = s * sin(a);
        double x = ox + dx;
        double y = oy - dy;

        i = (i + 1) % l;
        if (xs.length < l) {
          xs.length = l;
          ys.length = l;
          xs[i] = x;
          ys[i] = y;
        } else {
          double tx = xs[i] = x;
          double ty = ys[i] = y;
          draw(context, tx, ty, r + 2.0, Colors.black, Colors.black);
        }

        dx = (x - florm.applex);
        dy = (y - florm.appley);
        if (sqrt(dx * dx + dy * dy) < florm.appler + 1.0) {
          var path = Path();
          path.addOval(Rect.fromCircle(
              center: Offset(x, y), radius: florm.appler - 2.0));
          path.close();
          //context.arc(
          //    florm.applex, florm.appley, florm.appler - 2.0, 0, 2.0 * pi);
          var paint = Paint();
          paint.color = Colors.black;
          paint.style = PaintingStyle.stroke;
          context.drawPath(path, paint);
          paint.style = PaintingStyle.fill;
          context.drawPath(path, paint);

          score++;
          // new scorebox.setText(score.toString());
          l += d;

          florm.setApple(context, w, h);
        }

        // new ImageData id = context.getImageData(x, y, 1.0, 1.0);
        int blue = 0; //id.getBlueAt(0, 0);
        int red = 0; //id.getRedAt(0, 0);
        int green = 0; //id.getGreenAt(0, 0);

        double wbound = florm.cv!.getLocalClipBounds().width;
        double hbound = florm.cv!.getLocalClipBounds().height;

        if (x < 0 || y < 0 || x >= wbound || y >= hbound) {
          if (quatel) {
            if (x < 0) {
              xs[i] = x + wbound;
            } else if (x >= wbound) {
              xs[i] = x - wbound;
            }

            if (y < 0) {
              ys[i] = y + hbound;
            } else if (y >= hbound) {
              ys[i] = y - hbound;
            }
          } else if (deflec) {
            if (x < 0) {
              a = -a + pi;
            } else if (x >= wbound) {
              a = -a + pi;
            }

            if (y < 0) {
              a = -a;
            } else if (y >= hbound) {
              a = -a;
            }
          } else {
            l = 0;
            florm.countLiving();
          }
        } else if (blue != 0 || green != 0 || red != 0) {
          if (extlif) {
            extlif = false;
            draw(context, x, y, r, c, const Color(0x00111111));
          } else {
            l = 0;
            florm.countLiving();
          }
        } else {
          draw(context, x, y, r, c, const Color(0x00111111));
        }
      }
    }
  }

  void draw(Canvas context, double tx, double ty, double tr, Color fillcolor,
      Color strokecolor) {
    var path = Path();
    path.addOval(Rect.fromCircle(center: Offset(tx, ty), radius: tr));
    path.close();
    var paint = Paint();
    paint.color = fillcolor;
    paint.style = PaintingStyle.fill;
    context.drawPath(path, paint);
    paint.color = strokecolor;
    paint.style = PaintingStyle.stroke;
    context.drawPath(path, paint);
  }

  double getX() {
    return xs[i];
  }

  double getY() {
    return ys[i];
  }
}
