import 'worm.dart';

/* new void makeHighScore(final int score, final Worm worm) {
		DialogBox db = new DialogBox();
		db.setText("Congratulations, you have the highscore among your friends! ("
				+ score + ")");
		// final TextBox tb = new TextBox();
		// tb.setWidth("400px");
		// tb.setText( name );
		db.setAutoHideEnabled(true);
		db.setModal(true);

		VerticalPanel vp = new VerticalPanel();
		VerticalPanel hp = new VerticalPanel();

		final RadioButton criang = new RadioButton("superpower", "Critical angle");
		final RadioButton quatel = new RadioButton("superpower", "Quantum teleportation");
		final RadioButton lorcon = new RadioButton("superpower", "Lorentz contraction");
		final RadioButton extlif = new RadioButton("superpower", "Extra life");
		final RadioButton luck = new RadioButton("superpower", "Luck");
		final RadioButton deflec = new RadioButton("superpower", "Deflection");
		final RadioButton dipill = new RadioButton("superpower", "Dietary pill");
		final RadioButton mondes = new RadioButton("superpower", "Monolith destroyer");

		criang.setEnabled(!powerset.contains("criang"));
		quatel.setEnabled(!powerset.contains("quatel"));
		lorcon.setEnabled(!powerset.contains("lorcon"));
		extlif.setEnabled(!powerset.contains("extlif"));
		luck.setEnabled(!powerset.contains("luck"));
		deflec.setEnabled(!powerset.contains("deflec"));
		dipill.setEnabled(!powerset.contains("dipill"));
		mondes.setEnabled(!powerset.contains("mondes"));

		hp.add(criang);
		hp.add(quatel);
		hp.add(lorcon);
		hp.add(extlif);
		hp.add(luck);
		hp.add(deflec);
		hp.add(dipill);
		hp.add(mondes);

		// vp.add( tb );
		vp.add(hp);

		db.add(vp);
		pause = true;
		db.addCloseHandler(new CloseHandler<PopupPanel>() {
			@Override
			public void onClose(CloseEvent<PopupPanel> event) {
				String superpowers = "";
				if (Webworm.this.lorcon)
					superpowers = superpowers.length() == 0 ? "lorcon"
							: "\tlorcon";
				if (Webworm.this.quatel)
					superpowers = superpowers.length() == 0 ? "quatel"
							: "\tquatel";
				if (Webworm.this.dipill)
					superpowers = superpowers.length() == 0 ? "dipill"
							: "\tdipill";
				if (Webworm.this.luck)
					superpowers = superpowers.length() == 0 ? "luck" : "\tluck";
				if (Webworm.this.extlif)
					superpowers = superpowers.length() == 0 ? "extlif"
							: "\textlif";
				if (Webworm.this.deflec)
					superpowers = superpowers.length() == 0 ? "deflec"
							: "\tdeflec";
				if (Webworm.this.criang)
					superpowers = superpowers.length() == 0 ? "criang"
							: "\tcriang";
				if (Webworm.this.mondes)
					superpowers = superpowers.length() == 0 ? "mondes"
							: "\tmondes";

				final String bonuspower;
				if (criang.getValue())
					bonuspower = "criang";
				else if (quatel.getValue())
					bonuspower = "quatel";
				else if (lorcon.getValue())
					bonuspower = "lorcon";
				else if (extlif.getValue())
					bonuspower = "extlif";
				else if (luck.getValue())
					bonuspower = "luck";
				else if (deflec.getValue())
					bonuspower = "deflec";
				else if (dipill.getValue())
					bonuspower = "dipill";
				else if (mondes.getValue())
					bonuspower = "mondes";
				else
					bonuspower = "";

				powerset.add(bonuspower);

				/*
				 * for( String pow : powerset ) { if( superpowers.length() == 0
				 * ) superpowers = pow; else superpowers += "\t"+pow; }
				 */

				// Window.alert(bonuspower + " " + dipill.getValue());

				// tb.getText()
				saveHighScore(score, worm, superpowers, bonuspower);
				// sendMessage(huid, "You have been challenged in WebWorm");
			}
		});
		db.center();
	}*/

void saveHighScore(
    int score, final Worm worm, String superpowers, String bonuspower) {}

	/* new void saveHighScore(int score, final Worm worm, String superpowers, String bonuspower) {
		greetingService.highScore(null, uid, score, cv.getCoordinateSpaceWidth(), cv.getCoordinateSpaceHeight(), superpowers, bonuspower, new AsyncCallback<String>() {
			void onFailure(Throwable caught) {
				Window.alert(caught.getMessage());
				// Window.alert( caught.getStackTrace()[0].toString() );

				pause = false;
				if (worms.size() == 0) {
					updateCoordinates(cv, false);
					drawStartMessage(cv.getContext2d());
				}
			}

			void onSuccess(String result) {
				String[] split = result.split("\t");
				if (split.length > 3) {
					try {
						huid = split[0];
						long nuid = Long.parseLong(huid);
						highscoreholder = fuids.get(nuid);
						highscore = Integer
								.parseInt(split[split.length - 3]);
						highwidth = Integer
								.parseInt(split[split.length - 2]);
						highheight = Integer
								.parseInt(split[split.length - 1]);
					} catch (Exception e) {
					}
				}
				pause = false;
				if (worms.size() == 0) {
					updateCoordinates(cv, false);
					drawStartMessage(cv.getContext2d());
				}
			}
		});
	}*/

  /* new void fetchHighScores() {
		StringBuilder sb = new StringBuilder();
		for (long fuid : fuids.keySet()) {
			if (sb.length() == 0)
				sb.append("" + fuid);
			else
				sb.append("," + fuid);
		}
		String friends = sb.toString();
		greetingService.highScore(friends, uid, 0, 0, 0, "", "",
				new AsyncCallback<String>() {
					@Override
					public void onSuccess(String result) {
						String[] split = result.split("\t");
						if (split.length > 3) {
							try {
								console("erm ");
								huid = split[0];
								highscoreholder = fuids.get(Long
										.parseLong(huid));
								highscore = Integer
										.parseInt(split[split.length - 3]);
								highwidth = Integer
										.parseInt(split[split.length - 2]);
								highheight = Integer
										.parseInt(split[split.length - 1]);
							} catch (Exception e) {
							}
						}

						if (worms.size() == 0) {
							drawStartMessage(cv.getContext2d());
						}
					}

					@Override
					public void onFailure(Throwable caught) {
						console("epic failure " + caught.getMessage());
						console("epic " + caught.getStackTrace()[0].toString());
					}
				});
	}*/