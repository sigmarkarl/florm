import 'dart:core';
import 'dart:js_interop';
import 'dart:math';
import 'package:flutter/material.dart';

import 'worm.dart';

class Florm {
	/**
	 * The message displayed to the user when the server cannot be reached or
	 * returns an error.
	 */
	// ignore: constant_identifier_names
	static const String SERVER_ERROR = "An error occurred while attempting to contact the server. Please check your network connection and try again.";

	/**
	 * Create a remote service proxy to talk to the server-side Greeting
	 * service.
	 */
	//final GreetingServiceAsync greetingService = GWT
	//		.create(GreetingService.class);

	int highscore = 0;
	String huid = "";
	String highscoreholder = "no one";
	int highwidth = 1;
	int highheight = 1;
	double applex = 0;
	double appley = 0;
	double appler = 16.0;

	int setApple(Context2d context) {
		int w = context.getCanvas().getWidth();
		int h = context.getCanvas().getHeight();

		applex = Random.secure().nextDouble() * (w - appler * 2.0) + appler;
		appley = Random.secure().nextDouble() * (h - appler * 2.0) + appler;

		ImageData id = context.getImageData(applex - appler, appley - appler,
				2.0 * appler, 2.0 * appler);
		for (int x = 0; x < id.getWidth(); x += 4) {
			int y;
			for (y = 0; y < id.getHeight(); y += 4) {
				int r = id.getRedAt(x, y);
				int g = id.getGreenAt(x, y);
				int b = id.getBlueAt(x, y);

				bool inad = false;
				if (popup != null && popup.isShowing()) {
					if (applex < 160 + appler
							&& appley > (h - 600) / 2 - appler
							&& appley < (h + 600) / 2 + appler) {
					  inad = true;
					}
				}

				if (inad || r != 0 || g != 0 || b != 0) {
				  return setApple(context);
				}
			}
		}

		context.beginPath();
		context.setFillStyle("#dddddd");
		context.arc(applex, appley, appler - 4.0, 0, 2.0 * pi);
		context.fill();
		context.closePath();

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
		for (Worm w in tmpset) {
			w.kill();
		}
		tmpset.clear();
	}

	int offset = 30;
	int adw = 160;

	void updateCoordinates(Canvas cv, bool init) {
		final Context2d context = cv.getContext2d();
		if (init) {
			context.getCanvas().setWidth(w);
			context.getCanvas().setHeight(h - offset);
			cv.setWidth(w.toString() + "px");
			cv.setHeight((h - offset).toString() + "px");
			cv.setCoordinateSpaceWidth(context.getCanvas().getWidth());
			cv.setCoordinateSpaceHeight(context.getCanvas().getHeight());
		}

		context.setFillStyle("#000000");
		context.fillRect(0, 0, cv.getCoordinateSpaceWidth(),
				cv.getCoordinateSpaceHeight());

		for (Worm w in worms) {
			var xs = w.xs;
			var ys = w.ys;
			for (int i = 0; i < xs.length; i++) {
				double x = xs[i];
				double y = ys[i];
				w.draw(context, x, y, w.r, w.c, "#111111");
			}
		}
		if (!init)
			setApple(context);
	}

	void console(String s) /*-{
		if ($wnd.console)
			$wnd.console.log(s);
	}-*/;

	void drawStartMessage(Context2d context) {
		if (audio != null && audio.isAttached() && audio.isEnabled() && !audio.isPaused()) {
			audio.pause();
			audio.setCurrentTime(0.0);
		}

		if (w > 480 && h > 320) {
			infohtml.setHTML("Press enter or mouseclick to add new worm (<- and -> to control)<br>"
					+ "Free Superpower of the month: Deflection<br>"
					+
					// "Invite a friend and get the Critical angle Superpower for free!<br>"
					// +
					"The highsore amoung your friends is: "
					+ highscoreholder
					+ " with "
					+ highscore.toString()
					+ " points ("
					+ highwidth.toString()
					+ "x"
					+ highheight.toString()
					+ ")<br>"
					+ "Beat the highscore, challenge friends and get a Superpower of your choice for free");
			info.center();
			gplusgo();
			fbParse();
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

	void resize(RootPanel rp, int ww, int hh) {
		w = ww;
		h = hh;
		rp.setWidth(w.toString() + "px");
		rp.setHeight(h.toString() + "px");

		// console( w + " " + Window.getClientWidth() + " " + h + " " +
		// Window.getClientHeight() );
		// rp.setWidth( (w-100)+"px" );
		// rp.setHeight( (h-100)+"px" );
		updateCoordinates(cv, true);

		/*
		 * if( popup != null ) { if( h >= 720 && w >= 720 ) {
		 * popup.setPopupPosition(0, (h-600)/2); popup.show(); } else
		 * popup.hide(); }
		 */

		if (info.isVisible() && w > info.getOffsetWidth()
				&& h > info.getOffsetHeight()) {
			info.setPopupPosition((w - info.getOffsetWidth()) / 2,
					(h - info.getOffsetHeight()) / 2);
		} else
			info.hide();

		if (w * h <= 320 * 480) {
			lorcon = true;
			criang = true;
		} else {
			if (!powerset.contains("lorcon"))
				lorcon = false;
			if (!powerset.contains("criang"))
				criang = false;
			delay = 40;
		}
	}

	bool init() /*-{
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
	}-*/;

	TextBox timebox;
	int count = 0;
	int currentFrame = 0;

	void step(double time) {
		// Browser.getWindow().getConsole().log( "erm" );
		if (worms.isEmpty) {
			// Browser.getWindow().getConsole().log("io");
			drawStartMessage(cv.getContext2d());
			if (timer == null) {
			  cancelAnimationFrame(currentFrame);
			} else {
			  timer.cancel(); // dunno
			}
			return;
			//this.cancel();
		}
		if (!pause) {
			Context2d context = cv.getContext2d();
			for (Worm w in worms) {
				w.advance(context);
			}
			if ((count++) % 50 == 0) {
				if (timebox != null)
					timebox.setText((count / 50).toString());
			}
			if (timer == null)
				requestAnimationFrame();
		}
	}

	void cancelAnimationFrame(int id) /*-{
		$wnd.cancelAnimationFrame(id);
	}-*/;

	int requestAnimationFrame() /*-{
		return $wnd.requestAnimationFrame($wnd.step);
	}-*/;

	int w = 0;
  int h = 0;
	Canvas? cv;
	Timer timer = null;
	Set<Worm> worms;
	HorizontalPanel hscore;
	PopupPanel popup;
	PopupPanel info;
	HTML infohtml;
	int delay = 0;

	void onModuleLoad() {
		Window.enableScrolling(false);

		final Element donateEl = Document.get().getElementById("donate");
		donateEl.removeFromParent();

		final Widget mondesWidget;
		final Widget lorconWidget;
		final Widget luckWidget;
		final Widget quatelWidget;
		final Widget criangWidget;
		final Widget deflecWidget;
		final Widget dipillWidget;
		final Widget extlifWidget;

		bool nreq = init();

		String fbuid = "";
		NodeList<Element> nl = Document.get().getElementsByTagName("meta");
		int i;
		for (i = 0; i < nl.getLength(); i++) {
			Element e = nl.getItem(i);
			String prop = e.getAttribute("property");
			if (prop.equals("fbuid")) {
				// setUserId( e.getAttribute("content") );
				fbuid = e.getAttribute("content");
				break;
			}
		}

		final Element mondesEl = Document.get().getElementById("mondes");
		mondesEl.removeFromParent();
		final Element lorconEl = Document.get().getElementById("lorcon");
		lorconEl.removeFromParent();
		final Element luckEl = Document.get().getElementById("luck");
		luckEl.removeFromParent();
		final Element quatelEl = Document.get().getElementById("quatel");
		quatelEl.removeFromParent();
		final Element criangEl = Document.get().getElementById("criang");
		criangEl.removeFromParent();
		final Element deflecEl = Document.get().getElementById("deflec");
		deflecEl.removeFromParent();
		final Element dipillEl = Document.get().getElementById("dipill");
		dipillEl.removeFromParent();
		final Element extlifEl = Document.get().getElementById("extlif");
		extlifEl.removeFromParent();

		if (fbuid != null) {
			// offset = 120;
			final Button mondesAnc = new Button("Buy");
			mondesAnc.addClickHandler(new ClickHandler() {
				void onClick(ClickEvent event) {
					fbPay("mondes");
				}
			});
			mondesWidget = mondesAnc;
			final Button lorconAnc = new Button("Buy");
			lorconAnc.addClickHandler(new ClickHandler() {
				void onClick(ClickEvent event) {
					fbPay("lorcon");
				}
			});
			lorconWidget = lorconAnc;
			final Button luckAnc = new Button("Buy");
			luckAnc.addClickHandler(new ClickHandler() {
				void onClick(ClickEvent event) {
					fbPay("luck");
				}
			});
			luckWidget = luckAnc;
			final Button quatelAnc = new Button("Buy");
			quatelAnc.addClickHandler(new ClickHandler() {
				void onClick(ClickEvent event) {
					fbPay("quatel");
				}
			});
			quatelWidget = quatelAnc;
			final Button criangAnc = new Button("Buy");
			criangAnc.addClickHandler(new ClickHandler() {
				void onClick(ClickEvent event) {
					fbPay("criang");
				}
			});
			criangWidget = criangAnc;
			final Button deflecAnc = new Button("Buy");
			deflecAnc.addClickHandler(new ClickHandler() {
				void onClick(ClickEvent event) {
					fbPay("deflec");
				}
			});
			deflecWidget = deflecAnc;
			final Button dipillAnc = new Button("Buy");
			dipillAnc.addClickHandler(new ClickHandler() {
				void onClick(ClickEvent event) {
					fbPay("dipill");
				}
			});
			dipillWidget = dipillAnc;
			final Button extlifAnc = new Button("Buy");
			extlifAnc.addClickHandler(new ClickHandler() {
				void onClick(ClickEvent event) {
					fbPay("extlif");
				}
			});
			extlifWidget = extlifAnc;
		} else {
			console("eldor");

			mondesEl.getStyle().setDisplay(Display.INLINE);
			lorconEl.getStyle().setDisplay(Display.INLINE);
			luckEl.getStyle().setDisplay(Display.INLINE);
			quatelEl.getStyle().setDisplay(Display.INLINE);
			criangEl.getStyle().setDisplay(Display.INLINE);
			deflecEl.getStyle().setDisplay(Display.INLINE);
			dipillEl.getStyle().setDisplay(Display.INLINE);
			extlifEl.getStyle().setDisplay(Display.INLINE);

			mondesWidget = new SimplePanel();
			mondesWidget.getElement().appendChild(mondesEl);
			lorconWidget = new SimplePanel();
			lorconWidget.getElement().appendChild(lorconEl);
			luckWidget = new SimplePanel();
			luckWidget.getElement().appendChild(luckEl);
			quatelWidget = new SimplePanel();
			quatelWidget.getElement().appendChild(quatelEl);
			criangWidget = new SimplePanel();
			criangWidget.getElement().appendChild(criangEl);
			deflecWidget = new SimplePanel();
			deflecWidget.getElement().appendChild(deflecEl);
			dipillWidget = new SimplePanel();
			dipillWidget.getElement().appendChild(dipillEl);
			extlifWidget = new SimplePanel();
			extlifWidget.getElement().appendChild(extlifEl);
		}
		donateEl.getStyle().setDisplay(Display.INLINE);

		final RootPanel rp = RootPanel.get("content");
		Style st = rp.getElement().getStyle();

		st.setMargin(0.0, Unit.PX);
		st.setPadding(0.0, Unit.PX);
		st.setBorderWidth(0.0, Unit.PX);
		st.setBackgroundColor("#222222");

		final VerticalPanel vp = new VerticalPanel();
		vp.setHorizontalAlignment(VerticalPanel.ALIGN_CENTER);
		vp.setVerticalAlignment(VerticalPanel.ALIGN_MIDDLE);
		st = vp.getElement().getStyle();
		st.setBackgroundColor("#333333");

		// FocusPanel fp = new FocusPanel();
		// fp.setWidth( "100%" );
		// fp.setHeight( "100%" );
		cv = Canvas.createIfSupported();
		st = cv.getElement().getStyle();
		st.setMargin(0.0, Unit.PX);
		st.setPadding(0.0, Unit.PX);
		st.setBorderWidth(0.0, Unit.PX);
		cv.setWidth("100%");
		cv.setHeight("100%");

		vp.setWidth("100%");
		vp.setHeight("100%");
		// fp.add( cv );

		worms = new HashSet<Worm>();
		w = Window.getClientWidth() - adw;
		h = Window.getClientHeight();
		rp.setWidth(w + "px");
		rp.setHeight(h + "px");

		if (w * h <= 320 * 480) {
			lorcon = true;
			criang = true;
			delay = 60;
		} else
			delay = 40;

		// w = Window.getClientWidth();
		// h = Window.getClientHeight();
		updateCoordinates(cv, true);
		Window.addResizeHandler(new ResizeHandler() {
			void onResize(ResizeEvent event) {
				int w = event.getWidth() - adw;
				int h = event.getHeight();
				resize(rp, w, h);
			}
		});

		timebox = new TextBox();
		timebox.setReadOnly(true);
		timebox.setPixelSize(32, 10);
		timebox.setSize("32px", "10px");

		// requestAnimationFrame();
		if (nreq) {
			timer = new Timer() {
				int count = 0;

				void run() {
					step(0);
				}

				void cancel() {
					super.cancel();
					count = 0;
				}
			};
		}

		String useragent = Window.Navigator.getUserAgent();
		cv.addMouseDownHandler(this);
		cv.addMouseUpHandler(this);
		cv.addMouseMoveHandler(this);
		cv.addTouchStartHandler(this);
		cv.addTouchEndHandler(this);
		cv.addTouchMoveHandler(this);

		if (useragent.contains("MSIE")) {
			ieSpec();
		} else {
			cv.addKeyDownHandler(this);
			cv.addKeyUpHandler(this);
		}

		cv.setFocus(true);

		// Style style;
		HorizontalPanel hp = new HorizontalPanel();
		// hp.getElement().getStyle().setColor("#ffffff");
		hp.setVerticalAlignment(HorizontalPanel.ALIGN_MIDDLE);
		hp.setHorizontalAlignment(HorizontalPanel.ALIGN_CENTER);
		// hp.setHeight("10px");
		hp.setSpacing(10);

		/*
		 * Button spcredit = new Button("SP Credits"); spcredit.addClickHandler(
		 * new ClickHandler() {
		 * 
		 * @Override public void onClick(ClickEvent event) { fbPay( "abc123" );
		 * } });
		 */

		/*
		 * <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
		 * <input type="hidden" name="cmd" value="_s-xclick"> <input
		 * type="hidden" name="hosted_button_id" value="L4TC92APSZDHW"> <input
		 * type="image"
		 * src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif"
		 * border="0" name="submit"
		 * alt="PayPal - The safer, easier way to pay online!"> <img alt=""
		 * border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif"
		 * width="1" height="1"> </form>
		 */

		/*
		 * <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
		 * <input type="hidden" name="cmd" value="_s-xclick"> <input
		 * type="hidden" name="hosted_button_id" value="8245UZK73CU5U"> <input
		 * type="image"
		 * src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif"
		 * border="0" name="submit"
		 * alt="PayPal - The safer, easier way to pay online!"> <img alt=""
		 * border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif"
		 * width="1" height="1"> </form>
		 */

		/*
		 * FormPanel form = new FormPanel(); form.setAction(
		 * "https://www.paypal.com/cgi-bin/webscr" ); form.setMethod(
		 * FormPanel.METHOD_POST );
		 * 
		 * HorizontalPanel holder = new HorizontalPanel();
		 * holder.setVerticalAlignment( HorizontalPanel.ALIGN_MIDDLE );
		 * holder.setHorizontalAlignment( HorizontalPanel.ALIGN_CENTER );
		 * 
		 * Hidden cmd = new Hidden("cmd", "_s-xclick"); Hidden hosted_button_id
		 * = new Hidden("hosted_button_id", "8245UZK73CU5U"); Image img = new
		 * Image( "https://www.paypalobjects.com/en_US/i/scr/pixel.gif" );
		 * img.setAltText(""); img.setWidth("1"); img.setHeight("1");
		 * 
		 * InputElement iel = Document.get().createImageInputElement();
		 * iel.setName("submit"); iel.setSrc(
		 * "https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif" );
		 * iel.setAlt( "PayPal - The safer, easier way to pay online!" );
		 * 
		 * SimplePanel imageinput = new SimplePanel();
		 * imageinput.getElement().appendChild( iel );
		 * 
		 * holder.add( cmd ); holder.add( hosted_button_id ); holder.add(
		 * imageinput ); holder.add( img ); form.add( holder );
		 */

		hscore = new HorizontalPanel();
		hscore.setVerticalAlignment(HorizontalPanel.ALIGN_MIDDLE);
		hscore.setHorizontalAlignment(HorizontalPanel.ALIGN_CENTER);
		hscore.setWidth("160px");
		// hscore.setHeight("50px");

		Label timelabel = new Label("Time:");
		timelabel.getElement().getStyle().setColor("#eeeeee");
		// timelabel.setHeight("50px");

		HorizontalPanel coverpanel = new HorizontalPanel();
		coverpanel.setVerticalAlignment(HorizontalPanel.ALIGN_MIDDLE);
		coverpanel.setHorizontalAlignment(HorizontalPanel.ALIGN_CENTER);
		coverpanel.setSpacing(5);
		coverpanel.setWidth("100%");
		// coverpanel.setHeight("50px");

		HorizontalPanel timepanel = new HorizontalPanel();
		timepanel.setVerticalAlignment(HorizontalPanel.ALIGN_MIDDLE);
		timepanel.setHorizontalAlignment(HorizontalPanel.ALIGN_CENTER);
		timepanel.setWidth("150px");
		// timepanel.setHeight("50px");

		timepanel.add(timelabel);
		timepanel.add(timebox);

		plus = Document.get().createElement("g:plusone");
		plus.setAttribute("size", "small");

		like = Document.get().createElement("fb:like");
		like.setAttribute("width", "200");
		like.setAttribute("font", "arial");
		like.setAttribute("layout", "button_count");
		like.setAttribute("colorscheme", "dark");
		like.setAttribute("send", "true");
		like.setAttribute("href", "http://apps.facebook.com/webwormgame");
		like.setId("fblike");

		login = loginButton();

		sp = new SimplePanel();
		splus = new SimplePanel();

		SimplePanel form = new SimplePanel();
		form.getElement().appendChild(donateEl);

		hp.add(sp);
		// hp.add( spcredit );
		hp.add(power);
		hp.add(form);
		hp.add(splus);

		/*
		 * final Element ads = Document.get().getElementById("ads");
		 * ads.removeFromParent(); if( fbuid == null ) { if( ads != null ) {
		 * popup = new PopupPanel(); Style style =
		 * popup.getElement().getStyle(); style.setBorderWidth(0.0, Unit.PX);
		 * style.setMargin(0.0, Unit.PX);
		 * 
		 * //final SimplePanel spopup = new SimplePanel();
		 * //spopup.setWidth("160px"); //spopup.setHeight("600px");
		 * 
		 * //<script type="text/javascript"
		 * //src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
		 * //</script> //popup.add( spopup );
		 * 
		 * popup.getElement().appendChild( ads ); popup.setPopupPosition(0,
		 * (h-600)/2); popup.setPixelSize(156, 594);
		 * 
		 * if( h >= 720 ) { popup.show(); popup.setSize(156+"px", 594+"px"); }
		 * 
		 * *popup.setPopupPositionAndShow( new PositionCallback() {
		 * 
		 * @Override public void setPosition(int offsetWidth, int offsetHeight)
		 * { popup.setPopupPosition(0, (h-600)/2); popup.setPixelSize(156, 594);
		 * *setGadsPars(); ScriptElement adscript =
		 * Document.get().createScriptElement();
		 * adscript.setType("text/javascript");
		 * adscript.setSrc("http://pagead2.googlesyndication.com/pagead/show_ads.js"
		 * ); adscript.setAttribute("async", "true");
		 * spopup.getElement().appendChild( adscript ); } });* } }
		 */
		// new fbInit(fbuid);
		// fetchHighScores();

		String id = "facebook-jssdk";
		ScriptElement se = Document.get().createScriptElement();
		se.setId(id);
		se.setAttribute("async", "true");
		se.setSrc("//connect.facebook.net/en_US/all.js");
		Document.get().getElementById("fb-root").appendChild(se);

		// sp.getElement().appendChild( e );
		// sp.setWidth("170px");

		splus.getElement().appendChild(plus);

		// splus.setWidth("100px");

		// HorizontalPanel hsp = new HorizontalPanel();
		// hsp.setSpacing(2);
		// hsp.add( sp );
		// hsp.add( splus );

		// coverpanel.add( hsp );
		// coverpanel.add( form );
		coverpanel.add(hscore);
		coverpanel.add(timepanel);

		/*
		 * if( fbuid != null ) { SimplePanel adsPanel = new SimplePanel();
		 * adsPanel.getElement().appendChild( ads ); adsPanel.setPixelSize( 728,
		 * 90 ); adsPanel.setSize("728px", "90px"); vp.add( adsPanel ); offset =
		 * 120; }
		 */
		vp.add(coverpanel);
		vp.add(cv);
		// vp.add( hp );

		HorizontalPanel links = new HorizontalPanel();
		links.setSpacing(10);

		Anchor contact = new Anchor("huldaeggerts@gmail.com");
		contact.setHref("mailto:huldaeggerts@gmail.com");
		links.add(contact);

		HTML html = new HTML("|");
		links.add(html);

		if (fbuid == null) {
			Anchor smas = new Anchor("suggestadate.appspot.com");
			smas.setHref("http://suggestadate.appspot.com");
			links.add(smas);

			html = new HTML("|");
			links.add(html);

			Anchor fast = new Anchor("apps.facebook.com/webwormgame");
			fast.setHref("https://apps.facebook.com/webwormgame");
			links.add(fast);
		} else {
			Anchor smas = new Anchor("apps.facebook.com/suggestdate");
			smas.setHref("https://apps.facebook.com/suggestdate");
			smas.setTarget("_blank");
			links.add(smas);

			html = new HTML("|");
			links.add(html);

			Anchor fast = new Anchor("webwormgame.appspot.com");
			fast.setHref("http://webwormgame.appspot.com");
			fast.setTarget("_blank");
			links.add(fast);
		}

		info = new PopupPanel();
		VerticalPanel infov = new VerticalPanel();
		infov.setHorizontalAlignment(VerticalPanel.ALIGN_CENTER);
		infov.setVerticalAlignment(VerticalPanel.ALIGN_MIDDLE);
		infov.setSpacing(15);
		infohtml = new HTML();

		Button play = new Button();
		play.setText("Play");
		play.addClickHandler(new ClickHandler() {
			void onClick(ClickEvent event) {
				startGame();
			}
		});

		final RadioButton seren = new RadioButton("faudio", "Worm-serenade");
		final RadioButton rhaps = new RadioButton("faudio", "Worm-rhapsody");
		final RadioButton etude = new RadioButton("faudio", "Worm-etude");
		final RadioButton faudio = new RadioButton("faudio", "No eff-ing music");
		seren.addClickHandler(new ClickHandler() {
			void onClick(ClickEvent event) {
				audio.setEnabled(true);
				audio.setSrc("flabb2.webm");
			}
		});
		rhaps.addClickHandler(new ClickHandler() {
			void onClick(ClickEvent event) {
				audio.setEnabled(true);
				audio.setSrc("hey.webm");
			}
		});
		etude.addClickHandler(new ClickHandler() {
			void onClick(ClickEvent event) {
				audio.setEnabled(true);
				audio.setSrc("etude.webm");
			}
		});
		faudio.addClickHandler(new ClickHandler() {
			void onClick(ClickEvent event) {
				audio.setEnabled(false);
			}
		});

		HorizontalPanel hpaudio = new HorizontalPanel();
		hpaudio.setSpacing(5);
		hpaudio.add(seren);
		hpaudio.add(rhaps);
		hpaudio.add(etude);
		hpaudio.add(faudio);

		HTML musicmessage = new HTML("Coming soon, Worm-valz and Worm-toccata and fuge. <br>If you like the game soundtrack, stay tuned!");

		infov.add(play);
		infov.add(infohtml);
		infov.add(hp);
		infov.add(hpaudio);
		infov.add(musicmessage);
		infov.add(links);
		info.add(infov);

		audio = Audio.createIfSupported();
		audio.setSrc("flabb2.webm");
		audio.setLoop(true);
		audio.getAudioElement().setAttribute("loop", "true");
		coverpanel.add( audio );
		//hpaudio.add( audio );

		/*
		 * setGadsPars(); ScriptElement adscript =
		 * Document.get().createScriptElement();
		 * adscript.setType("text/javascript");
		 * adscript.setSrc("http://pagead2.googlesyndication.com/pagead/show_ads.js"
		 * ); adscript.setAttribute("async", "true");
		 * RootPanel.get("fb-root").getElement().appendChild( adscript );
		 */

		rp.add(vp);
	}

	Audio audio = null;

	void playMusic() {
		Browser.getWindow().getConsole().log(audio.isAttached());
		if (audio != null && audio.isEnabled() && audio.isPaused() ) {
			audio.setCurrentTime(0.0);
			audio.play();
		}
	}

	void startGame() {
		int ws = worms.length;
		if (ws == 0) {
			playMusic();

			worms.add(Worm.construct(this, "#00ff00", KeyCodes.KEY_LEFT, KeyCodes.KEY_RIGHT, KeyCodes.KEY_LEFT, KeyCodes.KEY_RIGHT));
			updateCoordinates(cv, false);

			if (timer != null) {
				info.hide();
				cv.setFocus(true);
				timer.scheduleRepeating(delay);
			}
			info.hide();
			cv.setFocus(true);
			currentFrame = requestAnimationFrame();
		} else if (ws == 1) {
			Worm w = worms.first;
			if (w.c == "#00ff00") {
				worms.add(Worm.construct(this, "#0000ff", 'z', 'x', 'Z', 'X'));
      } else {
				worms.add(Worm.construct(this, "#00ff00", KeyCodes.KEY_LEFT, KeyCodes.KEY_RIGHT, KeyCodes.KEY_LEFT, KeyCodes.KEY_RIGHT));
      }
		} else {
			Worm w1 = worms.first;
			Worm w2 = worms.last;
			if ((w1.c == "#00ff00" && w2.c == "#ff0000") || (w2.c == "#00ff00" && w1.c == "#ff0000")) {
				worms.add(Worm.construct(this, "#0000ff", 'z', 'x', 'Z', 'X'));
			} else if ((w1.c == "#0000ff" && w2.c == "#ff0000") || (w2.c == "#0000ff" && w1.c == "#ff0000")) {
				worms.add(Worm.construct(this, "#00ff00", KeyCodes.KEY_LEFT, KeyCodes.KEY_RIGHT, KeyCodes.KEY_LEFT, KeyCodes.KEY_RIGHT));
			} else {
				worms.add(Worm.construct(this, "#ff0000", 'n', 'm', 'N', 'M'));
			}
		}
	}

	void keyUp(int keyCode) {
		keyset.remove(keyCode);
	}

	void keyDown(int keycode) {
		if (keycode == ' ') {
			pause = !pause;
		} else if (keycode == KeyCodes.KEY_ESCAPE) {
			if (timer != null)
				timer.cancel();
			Set<Worm> wset = Set<Worm>.from(worms);
			for (Worm w : wset) {
				w.kill();
			}
			wset.clear();
		} else if (keycode == KeyCodes.KEY_ENTER) {
			startGame();
		} else {
			keyset.add(keycode);
		}
	}

	var keyset = <String>{};

	void onKeyUp(KeyUpEvent event) {
		keyUp(event.getNativeKeyCode());
	}

	void onKeyDown(KeyDownEvent event) {
		int keycode = event.getNativeKeyCode();
		keyDown(keycode);
	}

	bool mousedown = false;
	bool touchdown = false;
	bool wastouched = false;

	void start( int x, int y ) {
		playMusic();

		double angle = atan2(cv.getCoordinateSpaceHeight() - y, x - cv.getCoordinateSpaceWidth() / 2);
		worms.add(new Worm("#00ff00", KeyCodes.KEY_LEFT, KeyCodes.KEY_RIGHT, KeyCodes.KEY_LEFT, KeyCodes.KEY_RIGHT, angle));
		updateCoordinates(cv, false);

		if (timer != null) {
			info.hide();
			cv.setFocus(true);
			timer.scheduleRepeating(delay);
		}
		info.hide();
		cv.setFocus(true);
		currentFrame = requestAnimationFrame();
	}
	
	void mouseTouch(int x, int y) {
		if (worms.isEmpty) {
			start( x, y );
		} else {
			Worm? w = null;
			for (Worm wrm in worms) {
				w = wrm;
				w.setTarget(x, y);
				//break;
			}

			//w.setTarget(x, y);
		}
	}

	void onMouseDown(MouseDownEvent event) {
		if( !wastouched ) {
			mousedown = true;
	
			int x = event.getX();
			int y = event.getY();
	
			mouseTouch(x, y);
		} else wastouched = false;
	}

	void onMouseMove(MouseMoveEvent event) {
		if (mousedown) {
			int x = event.getX();
			int y = event.getY();

			Worm w = worms.first;
			w.setTarget(x, y);
		}
	}

	void onMouseUp(MouseUpEvent event) {
		mousedown = false;
	}

	void onTouchMove(TouchMoveEvent event) {
		Touch touch = event.getTouches().get(0);
		int x = touch.getClientX();
		int y = touch.getClientY();
		// int x = event.getX();
		// int y = event.getY();

		Worm w = worms.first;
		w.setTarget(x, y);
	}

	void onTouchEnd(TouchEndEvent event) {
		touchdown = false;
		
		keyset.remove( KeyCodes.KEY_LEFT );
		keyset.remove( KeyCodes.KEY_RIGHT );
	}

	void onTouchStart(TouchStartEvent event) {
		touchdown = true;
		wastouched = true;

		// event.get
		JsArray<Touch> touches = event.getTouches();
		if (touches.length() > 1) {
			pause = !pause;
		} else {
			Touch touch = event.getTouches().get(0);
			int x = touch.getClientX();
			int y = touch.getClientY();

			if (worms.size() == 0) {
				start( x, y );
			} else if( cv != null ) {
				int w = cv.getCoordinateSpaceWidth();
				
				if( x < w/2 ) keyset.add( KeyCodes.KEY_LEFT );
				else keyset.add( KeyCodes.KEY_RIGHT );
			}
			//mouseTouch(x, y);
		}
	}
}
