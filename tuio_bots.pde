
// Sketch for the Drawing Bot Visualization
// presented at Creative Space 2017 at HS Mainz

// (c) Bitcraftlab 2017

import TUIO.TuioClient;
import TUIO.*;
TuioProcessing tc;

// modes
boolean debugMode = true;
boolean simMode = false;

// random id and counter used for saving unique screenshots
int randid = int(random(1000));
int counter = 0;

// marker dictionary and maximum number of markers
IntDict dict;
int imax = 5;

PFont font;


BotViz[] vizzes;
BotViz viz;

void setup() {
  
  setupObjects();
  setupSim();
  
  vizzes = new BotViz[] {
    new LineBotViz(),
    new WobbleBotViz(),
    new DotBotViz()
  };
  
  for(int i = 0; i < vizzes.length; i++) {
    vizzes[i].setup(); 
  }
  
  viz = vizzes[0];

  // size(1280, 800);
  fullScreen();
  noCursor();
  
  font = createFont("", 12);
  textFont(font); 
  tc  = new TuioProcessing(this);
  
}


void draw() {
  
  // update all visualizations
  for(int i = 0; i < vizzes.length; i++) {
    vizzes[i].draw();
  }
  
  viz.display();
  
  if(debugMode) {
    drawObjects();
    fill(0);
    text("DEBUG", width - 60, 20);
  }
  
  if(simMode) {
    fill(0);
    text("SIMULATION", 20, 20);
  }
  
}


void keyPressed() {
  
  switch(key) {
    
    // press [1] ... [3] to switch between visualizations
    case '1':
      viz = vizzes[0];
      break;
      
    case '2':
      viz = vizzes[1];
      break;
      
    case '3': 
      viz = vizzes[2];
      break;
      
    // press [d] to toggle debug mode
    case 'd':
      debugMode = !debugMode;
      break;
      
    // press [s] to show simulation from a previous recording
    case 's':
      simMode = !simMode;
      if(simMode) {
        startTuioSim();
      } else {
        stopTuioSim();
      };
      break;
      
    // press [c] to clear current visualization
    case 'c': 
      viz.setup();
      break;
      
    // press [space] to save screenshots
    case ' ': 
      // increase screenshot counter
      counter++;
      // new thread, so the drawing is not interrupted
      thread("screenCap");
      break;
     
  }
  
  // the individual visualizations may want to handle keys as well ...
  viz.keyPressed();

}


// capture screen and the state of all visualizations
void screenCap() {

  String prefix = "capture-" + pad(randid, 4) + "-";
  String postfix = "-" + pad(counter, 5) + ".png";
  
  // save current view
  saveFrame(prefix + "screen" + postfix);
    
  // save all visualizations
  for(int i = 0; i < vizzes.length; i++) {
    vizzes[i].canvas.save(prefix + "viz-" + pad(i, 3) + postfix);
  }
        
}

// left pad a number with 0s
String pad(int i, int n) {
  return trim(nfs(i, n));
}


// tuio frame callback
void refresh(TuioTime t) {
  /*
  println(
    "frame", 
    "#" + t.getFrameID(), 
    " (" + t.getTotalMilliseconds() + ")"
  );
  */
}