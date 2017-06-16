
// mother of all bots

abstract class Bot {

  int bi;    // bot index
  float r;   // rotation
  float d;   // diamater
  float hue; // color
  
  // position and angles
  float x, y, a;
  
  // previous position and angles
  float px, py, pa;
  
  // is the bot currently drawing?
  boolean drawing = true;
  


  Bot(int i) {
    
    bi = i;
    d = 60;
    hue = map(i, 0, imax - 1, 0, 100);
    
    // position the bot where we don't see it
    x = -100;
    y = -100;
    
  }


  // update triggered by TUIO data frames
  void update(TuioObject o) {
    
    x = o.getScreenX(width);
    y = o.getScreenY(height);
    a = o.getAngle();

    // only draw if we are actually moving
    drawing = dist(x, y, px, py) > 0;
    px = x;
    py = y;
    pa = a;
    
  }

  // update triggered by processing once every frame
  void tick() {
    r += TWO_PI / 360;
  }
  
  // draw something on the canvas
  void display() {
    if(drawing) draw(); 
  }

  abstract void draw();

}