
String project = "drawing-bots-small";

void setupSim() {
  stopTuioSim();  
}


// stop the simulation
void stopTuioSim() {
  
  // kill previously running instances of bittwist
  exec(new String[] { "killall", "bittwist" }); 
  
  // markers we use in our real-time scenario
  String[] ids = { "13", "14", "15", "16", "17" };
  int[] idx = { 0, 1, 2, 3, 4 };
  
  // update the marker dictionary
  dict = new IntDict(ids, idx);

}

void startTuioSim() {
  
  // use bittwist -d to list network devices 
  String lo = "lo0";
  
  // replay pcap file that was captured with wireshark
  exec(new String[] { "/usr/local/bin/bittwist", "-i", lo, dataPath(project + ".pcap") }); 
  
  // markers we used during simulation
  String[] ids = { "14", "15", "23", "18", "19" };
  int[] idx = { 0, 1, 2, 3, 4 };
  
  // update the marker dictionary
  dict = new IntDict(ids, idx);
   
}