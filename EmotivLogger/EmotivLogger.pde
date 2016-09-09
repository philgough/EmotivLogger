/**
 * EPOC Logger 2
 * originally by Joshua Madara, hyperRitual.com
 * This sketch logs data from the Emotiv EPOC via
 * OSC messages, to a tabbed file.

 * 
 * Modified by Phil Gough to also record audio as a .wav file and 
 * to allow the researcher to take notes on observations
 */

// Text parser
import oscP5.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
// Minim
import ddf.minim.*;

// declare objects
// Text parser
OscP5 oscP5;
PrintWriter eegOutput;
PrintWriter researchNotes;
SimpleDateFormat dateForm;
SimpleDateFormat timeForm;

String[] emotions = 
{
  "Engaged/Bored",
  "Excitement",
  "Excitement Long Term",
  "Meditation",
  "Frustration"
};


String singleNote;
String previousNote = "";
// Minim
Minim minim;
AudioInput in;
AudioRecorder recorder;


void setup() {

  size(displayWidth, displayHeight);


  // listen for OSC messages on port 7400
  oscP5 = new OscP5(this, 7400);
  
  // format datestamp for the file name
  dateForm = new SimpleDateFormat("yyyy_MM_dd");
  
  // format timestamp for the the log entries
  timeForm = new SimpleDateFormat("HH.mm.ss.SSS");
  
  // create a file to log data to
  Date date = new Date(); // get the current date
  String dateS = dateForm.format(date); // format the date
  String timeS = hour() + "_" + minute();

  eegOutput = createWriter("dataRecording/" + dateS + "/epoc_log_"+timeS+".txt"); // include the date in the file name

  researchNotes = createWriter("dataRecording/" + dateS + "/notes_log_" + timeS + ".txt");
  singleNote = "";

  // Initialise audio recorder
  minim = new Minim(this);

  in = minim.getLineIn();
  // records to specified fileName
  recorder = minim.createRecorder(in, "dataRecording/" + dateS + "/audio_log_" + timeS + ".wav", false);

  textFont(createFont("Source Code Pro", 18));

}

void draw() {
  // this sketch does not draw anything specific
  background(255);
  fill(0);
  audio();
  recordResearchNotes();
}


