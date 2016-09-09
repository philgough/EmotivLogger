// receive, parse, and write OSC data to the log file
void oscEvent(OscMessage theOscMessage) {
  for (int i = 0; i < emotions.length; i++) {  
    if (theOscMessage.checkAddrPattern("/AFF/" + emotions[i])==true) {
      Date time = new Date(); // get the current time
      String timeS = timeForm.format(time); // format the time
      String event = theOscMessage.addrPattern(); // get the message's address pattern
      println(event);
      float value = theOscMessage.get(0).floatValue(); // get the message's value
      eegOutput.println(timeS+"\t"+emotions[i]+"\t"+value); // write it all to the log file
    }
  }
}