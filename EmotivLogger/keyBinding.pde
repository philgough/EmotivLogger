// key Bindings

// press ~ to save the data and exit the application
// press ` to start/stop recording

void keyPressed() {
	if (31 < key && key < 126 && key != '`') {
		singleNote += key;
	}
	else {
		if (key == '`') {

			Date time = new Date();
			String timeS = timeForm.format(time);
			if (recorder.isRecording()) {
				recorder.endRecord();
				researchNotes.println(timeS + "\t" + "stoppedRecording");
			}
			else {
				recorder.beginRecord();
				researchNotes.println(timeS + "\t" + "startedRecording");
			}
		}
		else {
			if (key == '~') {
				safeExit();
			}

			else {
				if (key == BACKSPACE && singleNote.length() > 0) {
					singleNote = singleNote.substring(0, singleNote.length() - 1);
				}
				else {
					if (key == ENTER) {
						Date time = new Date();
						String timeS = timeForm.format(time);
						println("saved note");
						researchNotes.println(timeS+ "\t" +singleNote);
						previousNote = singleNote;
						singleNote = "";
					}
					else {
						// ascii code for Escape key is 27
						if (key == 27) {
							println("Press SHIFT + ` to exit safely.");
							key = 0;
						}
					}
				}
			}
		}
	}
}


void safeExit() {
	// write remaning data
	eegOutput.flush();
	// close file
	eegOutput.close();
	researchNotes.flush();
	researchNotes.close();
	recorder.endRecord();
	recorder.save();
	// stop program
	exit();
}