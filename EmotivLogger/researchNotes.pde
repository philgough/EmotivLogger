void recordResearchNotes() {
	fill(100);
	if (frameCount % 20 < 15) {
		text(singleNote, 40, 300, width - 40, 300);
		fill(80, 100, 255);
		text("_",  40 + textWidth(singleNote), 300, width, 300);
	}
	else {
		// fill(100);
		text(singleNote, 40, 300, width - 40, 300);
	}

	fill(200);
	if (textWidth(previousNote) < 800){
		text(previousNote, 40, 250, width-60, 50);
	}
	else {
		text(previousNote, 40, 250, 800, 50);
		text("(continued)", 840, 268);
	}
}