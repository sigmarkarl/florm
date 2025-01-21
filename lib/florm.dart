import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'worm.dart';

class Florm {
  /// The message displayed to the user when the server cannot be reached or
  /// returns an error.
  // ignore: constant_identifier_names
  static const String SERVER_ERROR =
      "An error occurred while attempting to contact the server. Please check your network connection and try again.";

  /// Create a remote service proxy to talk to the server-side Greeting
  /// service.
  //final GreetingServiceAsync greetingService = GWT
  //		.create(GreetingService.class);

  Florm();

  int highscore = 0;
  String huid = "";
  String highscoreholder = "no one";
  int highwidth = 1;
  int highheight = 1;
  double applex = 0;
  double appley = 0;
  double appler = 16.0;
  bool increment = true;

  int setApple(Canvas context, double w, double h) {
    applex = Random.secure().nextDouble() * (w - appler * 2.0) + appler;
    appley = Random.secure().nextDouble() * (h - appler * 2.0) + appler;

    // context.getImageData
    var id = Rect.fromLTWH(
        applex - appler, appley - appler, 2.0 * appler, 2.0 * appler);
    for (int x = 0; x < id.width; x += 4) {
      int y;
      for (y = 0; y < id.height; y += 4) {
        int r = 0; //id.getRedAt(x, y);
        int g = 0; //id.getGreenAt(x, y);
        int b = 0; //id.getBlueAt(x, y);

        bool inad = false;
        /*if (popup != null && popup.isShowing()) {
          if (applex < 160 + appler &&
              appley > (h - 600) / 2 - appler &&
              appley < (h + 600) / 2 + appler) {
            inad = true;
          }
        }*/

        if (inad || r != 0 || g != 0 || b != 0) {
          return setApple(context, w, h);
        }
      }
    }

    var path = Path();
    path.addOval(
        Rect.fromCircle(center: Offset(applex, appley), radius: appler - 2.0));
    path.close();
    //context.arc(
    //    florm.applex, florm.appley, florm.appler - 2.0, 0, 2.0 * pi);
    var paint = Paint();
    paint.color = const Color(0x00dddddd);
    paint.style = PaintingStyle.stroke;
    context.drawPath(path, paint);
    paint.style = PaintingStyle.fill;
    context.drawPath(path, paint);

    /*context.beginPath();
		context.setFillStyle("#dddddd");
		context.arc(applex, appley, appler - 4.0, 0, 2.0 * pi);
		context.fill();
		context.closePath();*/

    return 0;
  }

  bool lorcon = false;
  bool criang = false;
  bool quatel = false;
  bool dipill = false;
  bool deflec = false;
  bool extlif = false;
  bool luck = false;
  bool mondes = false;

  bool pause = false;

  void countLiving() {
    bool stillliving = false;
    for (Worm w in worms) {
      if (w.l > 0) {
        stillliving = true;
        break;
      }
    }

    if (!stillliving) {
      killall();
    }
  }

  void killall() {
    var tmpset = Set<Worm>.from(worms);
    for (Worm worm in tmpset) {
      worm.kill(w, h);
    }
    tmpset.clear();
  }

  int offset = 30;
  int adw = 160;

  void updateCoordinates(Canvas context, bool init, double ww, double hh) {
    w = ww;
    h = hh;
    if (init) {
      /*context.getCanvas().setWidth(w);
			context.getCanvas().setHeight(h - offset);
			cv.setWidth(w.toString() + "px");
			cv.setHeight((h - offset).toString() + "px");
			cv.setCoordinateSpaceWidth(context.getCanvas().getWidth());
			cv.setCoordinateSpaceHeight(context.getCanvas().getHeight());*/
    }

    context.drawRect(Rect.fromLTWH(0, 0, w, h - offset),
        Paint()..color = const Color(0x00000000));

    for (Worm w in worms) {
      var xs = w.xs;
      var ys = w.ys;
      for (int i = 0; i < xs.length; i++) {
        double x = xs[i];
        double y = ys[i];
        w.draw(context, x, y, w.r, w.c, const Color(0x00111111));
      }
    }
    if (!init) setApple(context, w, h - offset);
  }

  void console(String s) {
    debugPrint(s);
  }

  void drawStartMessage(Canvas context) {
    /*if (audio != null && audio.isAttached() && audio.isEnabled() && !audio.isPaused()) {
			audio.pause();
			audio.setCurrentTime(0.0);
		}*/

    if (w > 480 && h > 320) {
      /*infohtml.setHTML(
          "Press enter or mouseclick to add new worm (<- and -> to control)<br>Free Superpower of the month: Deflection<br>The highsore amoung your friends is: $highscoreholder with $highscore points (${highwidth}x$highheight)<br>Beat the highscore, challenge friends and get a Superpower of your choice for free");
      info.center();*/
      // gplusgo();
      //fbParse();
    }

    /*
		 * String msg =
		 * "Press enter or mouseclick to add new worm (<- and -> to control)";
		 * context.setFillStyle("#eeeeee"); TextMetrics tm =
		 * context.measureText( msg ); context.fillText(msg,
		 * (context.getCanvas().getWidth()-tm.getWidth())/2.0,
		 * context.getCanvas().getHeight()/2.0);
		 * 
		 * String jscore =
		 * "ãƒ�ã‚¤ã‚¹ã‚³ã‚¢ã‚’ãƒ“ãƒ¼ãƒˆã�¨ç„¡æ–™ã�§ã�Šå¥½ã�¿ã�®ã‚¹ãƒ¼ãƒ‘ãƒ¼ãƒ‘ãƒ¯ãƒ¼ã‚’å¾—ã‚‹"
		 * ; tm = context.measureText( jscore ); context.fillText(jscore,
		 * (context.getCanvas().getWidth()-tm.getWidth())/2.0,
		 * context.getCanvas().getHeight()/2.0+90);
		 * 
		 * String japs =
		 * "æ–°ã�—ã�„ãƒ¯ãƒ¼ãƒ ã‚’è¿½åŠ ã�™ã‚‹ã�«ã�¯ã€�Enterã‚­ãƒ¼ã‚’æŠ¼ã�—ã�¾ã�™ï¼ˆ<ã‚’ - ã�¨ - >ã‚’åˆ¶å¾¡ã�™ã‚‹ï¼‰"
		 * ; tm = context.measureText( japs ); context.fillText(japs,
		 * (context.getCanvas().getWidth()-tm.getWidth())/2.0,
		 * context.getCanvas().getHeight()/2.0+60);
		 * 
		 * String disc = "Free Superpower of the month: Deflection"; tm =
		 * context.measureText( disc ); context.fillText(disc,
		 * (context.getCanvas().getWidth()-tm.getWidth())/2.0,
		 * context.getCanvas().getHeight()/2.0+30);
		 * 
		 * String invt =
		 * "Invite a friend and get the Critical angle Superpower for free!"; tm
		 * = context.measureText( invt ); context.fillText(invt,
		 * (context.getCanvas().getWidth()-tm.getWidth())/2.0,
		 * context.getCanvas().getHeight()/2.0-30);
		 * 
		 * String nipp =
		 * "ãƒ�ã‚¤ã‚¹ã‚³ã‚¢: "+highscoreholder+" ã�¨ "+highscore+" ãƒ�ã‚¤ãƒ³ãƒˆ ("
		 * +highwidth+"x"+highheight+")"; tm = context.measureText( nipp );
		 * context.fillText(nipp,
		 * (context.getCanvas().getWidth()-tm.getWidth())/2.0,
		 * context.getCanvas().getHeight()/2.0-120);
		 * 
		 * String allt =
		 * "All time highsore is: "+highscoreholder+" with "+highscore
		 * +" points ("+highwidth+"x"+highheight+")"; tm = context.measureText(
		 * allt ); context.fillText(allt,
		 * (context.getCanvas().getWidth()-tm.getWidth())/2.0,
		 * context.getCanvas().getHeight()/2.0-90);
		 * 
		 * String beat =
		 * "Beat the all time highscore and get a Superpower of your choice for free"
		 * ; tm = context.measureText( beat ); context.fillText(beat,
		 * (context.getCanvas().getWidth()-tm.getWidth())/2.0,
		 * context.getCanvas().getHeight()/2.0-60);
		 */
  }

  String uid = "";

  void resize(Canvas cv, double ww, double hh) {
    //rp.setWidth("${w}px");
    //rp.setHeight("${h}px");

    // console( w + " " + Window.getClientWidth() + " " + h + " " +
    // Window.getClientHeight() );
    // rp.setWidth( (w-100)+"px" );
    // rp.setHeight( (h-100)+"px" );
    updateCoordinates(cv, true, ww, hh);

    /*
		 * if( popup != null ) { if( h >= 720 && w >= 720 ) {
		 * popup.setPopupPosition(0, (h-600)/2); popup.show(); } else
		 * popup.hide(); }
		 */

    /*if (info.isVisible() &&
        w > info.getOffsetWidth() &&
        h > info.getOffsetHeight()) {
      info.setPopupPosition(
          (w - info.getOffsetWidth()) / 2, (h - info.getOffsetHeight()) / 2);
    } else
      info.hide();*/

    if (w * h <= 320 * 480) {
      lorcon = true;
      criang = true;
    } else {
      //if (!powerset.contains("lorcon")) lorcon = false;
      //if (!powerset.contains("criang")) criang = false;
      delay = 40;
    }
  }

  bool init() {
    return false;
  }

  /*{
		$wnd.requestAnimationFrame = $wnd.requestAnimationFrame
				|| $wnd.mozRequestAnimationFrame
				|| $wnd.webkitRequestAnimationFrame
				|| $wnd.msRequestAnimationFrame;
		$wnd.cancelAnimationFrame = $wnd.cancelAnimationFrame
				|| $wnd.mozCancelAnimationFrame;

		var s = this;
		$wnd.step = function(time) {
			s.@org.simmi.client.Webworm::step(D)( time );
		}

		return $wnd.requestAnimationFrame == null;
	}*/

  //TextBox timebox;
  int count = 0;
  int currentFrame = 0;

  void step(Canvas cv, double time) {
    // Browser.getWindow().getConsole().log( "erm" );
    if (worms.isEmpty) {
      // Browser.getWindow().getConsole().log("io");
      drawStartMessage(cv);
      /*if (timer == null) {
        cancelAnimationFrame(currentFrame);
      } else {
        timer.cancel(); // dunno
      }*/
      return;
      //this.cancel();
    }
    if (!pause) {
      //Context2d context = cv.getContext2d();
      var remset = [];
      for (Worm worm in worms) {
        if (worm.advance(cv, w, h)) {
          remset.add(worm);
        }
      }
      if (remset.isNotEmpty) debugPrint("removed ${remset.length} worms");
      worms.removeAll(remset);
      if ((count++) % 50 == 0) {
        //timebox.setText((count / 50).toString());
      }
      //if (timer == null) requestAnimationFrame();
    }
  }

  double w = 0;
  double h = 0;
  //Timer timer = null;
  var worms = <Worm>{};
  //HorizontalPanel hscore;
  //PopupPanel popup;
  //PopupPanel info;
  //HTML infohtml;
  int delay = 0;

  /*Audio audio = null;
	void playMusic() {
		Browser.getWindow().getConsole().log(audio.isAttached());
		if (audio != null && audio.isEnabled() && audio.isPaused() ) {
			audio.setCurrentTime(0.0);
			audio.play();
		}
	}*/

  void startGame(Canvas cv, double ww, double hh) {
    int ws = worms.length;
    if (ws == 0) {
      //playMusic();

      var worm = Worm.construct(
          this, const Color(0x0000ff00), 'LEFT', 'RIGHT', 'LEFT', 'RIGHT');
      worms.add(worm);
      updateCoordinates(cv, false, ww, hh);

      /*if (timer != null) {
        info.hide();
        //cv.setFocus(true);
        timer.scheduleRepeating(delay);
      }
      info.hide();*/
      //cv.setFocus(true);
      //currentFrame = requestAnimationFrame();
    } else if (ws == 1) {
      Worm worm = worms.first;
      if (worm.c == Colors.green) {
        worms.add(Worm.construct(this, Colors.blue, 'z', 'x', 'Z', 'X'));
      } else {
        worms.add(Worm.construct(
            this, Colors.green, 'LEFT', 'RIGHT', 'LEFT', 'RIGHT'));
      }
    } else {
      Worm w1 = worms.first;
      Worm w2 = worms.last;
      if ((w1.c == Colors.green && w2.c == Colors.red) ||
          (w2.c == Colors.green && w1.c == Colors.red)) {
        worms.add(Worm.construct(this, Colors.blue, 'z', 'x', 'Z', 'X'));
      } else if ((w1.c == Colors.blue && w2.c == Colors.red) ||
          (w2.c == Colors.blue && w1.c == Colors.red)) {
        worms.add(Worm.construct(
            this, Colors.green, 'LEFT', 'RIGHT', 'LEFT', 'RIGHT'));
      } else {
        worms.add(Worm.construct(this, Colors.red, 'n', 'm', 'N', 'M'));
      }
    }
  }

  void keyUp(Canvas cv, String keyCode) {
    keyset.remove(keyCode);
  }

  void keyDown(Canvas cv, String keycode) {
    if (keycode == ' ') {
      pause = !pause;
    } else if (keycode == "ESC") {
      //if (timer != null) timer.cancel();
      Set<Worm> wset = Set<Worm>.from(worms);
      for (Worm worm in wset) {
        worm.kill(w, h);
      }
      wset.clear();
    } else if (keycode == 'ENTER') {
      startGame(cv, w, h);
    } else {
      keyset.add(keycode);
    }
  }

  var keyset = <String>{};

  void onKeyUp(KeyUpEvent event) {
    //keyUp(event.logicalKey.keyLabel);
  }

  void onKeyDown(KeyDownEvent event) {
    var keycode = event.logicalKey.keyLabel;
    //keyDown(keycode);
  }

  bool mousedown = false;
  bool touchdown = false;
  bool wastouched = false;

  void start(Canvas cv, double x, double y, double w, double h) {
    //playMusic();

    double angle = atan2(h - y, x - w / 2);
    worms.add(Worm.withAngle(this, const Color(0x0000ff00), "LEFT", "RIGHT",
        "LEFT", "RIGHT", angle, w, h));
    updateCoordinates(cv, false, w, h);

    /*if (timer != null) {
      info.hide();
      //cv.setFocus(true);
      timer.scheduleRepeating(delay);
    }
    info.hide();*/
    //cv.setFocus(true);
    //currentFrame = requestAnimationFrame();
  }

  void mouseTouch(Canvas cv, double x, double y) {
    if (worms.isEmpty) {
      start(cv, x, y, w, h);
    } else {
      Worm? w;
      for (Worm wrm in worms) {
        w = wrm;
        w.setTarget(x, y);
        //break;
      }

      //w.setTarget(x, y);
    }
  }

  void onMouseDown(Canvas cv, double x, double y) {
    if (!wastouched) {
      mousedown = true;

      //int x = event.getX();
      //int y = event.getY();

      mouseTouch(cv, x, y);
    } else {
      wastouched = false;
    }
  }

  void onMouseMove(double x, double y) {
    if (mousedown) {
      //int x = event.getX();
      //int y = event.getY();

      Worm w = worms.first;
      w.setTarget(x, y);
    }
  }

  void onMouseUp(int x, int y) {
    mousedown = false;
  }

  void onTouchMove(double x, double y) {
    /*Touch touch = event.getTouches().get(0);
    int x = touch.getClientX();
    int y = touch.getClientY();*/
    // int x = event.getX();
    // int y = event.getY();

    Worm w = worms.first;
    w.setTarget(x, y);
  }

  void onTouchEnd(String event) {
    touchdown = false;

    keyset.remove("LEFT");
    keyset.remove("RIGHT");
  }

  void onTouchStart(String event) {
    touchdown = true;
    wastouched = true;

    // event.get
    /*JsArray<Touch> touches = event.getTouches();
    if (touches.length() > 1) {
      pause = !pause;
    } else {
      Touch touch = event.getTouches().get(0);
      int x = touch.getClientX();
      int y = touch.getClientY();

      if (worms.isEmpty) {
        start(x, y);
      } else if (cv != null) {
        int w = cv.getCoordinateSpaceWidth();

        if (x < w / 2)
          keyset.add("LEFT");
        else
          keyset.add("RIGHT");
      }
      //mouseTouch(x, y);
    }*/
  }
}
