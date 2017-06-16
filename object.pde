
// callbacks for when objects are added, updated or removed

int mmax = 24;
PImage[] markers = new PImage[mmax];

void setupObjects() {
  
  int bx = 10;
  int by = 15;
  int dx = 200;
  int dy = 200;
  
  PImage source = loadImage("small-200.png");
  source.resize(932, 1313);
  
  for(int id = 0; id < mmax; id ++) {
    int x = id % 4;
    int y = id / 4;
    int px = bx + x * dx;
    int py = by + y * dy;
    markers[id] = source.get(px, py, dx, dy);  
  }

}


void addTuioObject(TuioObject o) {
  /*
  println(
    "add obj",
    o.getSymbolID(), 
    "(" + o.getSessionID() + ")", 
    o.getX(), 
    o.getY(), 
    o.getAngle()
  );
  */
}

void updateTuioObject (TuioObject o) {
  /*
  println(
    "set obj ",
    o.getSymbolID(),
    "(" + o.getSessionID() + ")",
    o.getX(),
    o.getY(), 
    o.getAngle(),
    o.getMotionSpeed(),
    o.getRotationSpeed(),
    o.getMotionAccel(),
    o.getRotationAccel()
  );
  */
}

void removeTuioObject(TuioObject o) {
  /*
  println(
    "del obj ",
    o.getSymbolID(), 
    "(" + o.getSessionID() + ")"
  );
  */
}


void drawObjects() {
  
  for (TuioObject o : tc.getTuioObjectList()) {

    // get location and rotation
    int w = o.getScreenX(width);
    int h = o.getScreenY(height);
    int id = o.getSymbolID();
    
    float ang = o.getAngle();
    float d = 60;

    stroke(255, 100, 100);
    fill(255, 200, 200, 100);

    // rectangle, representing the fiducial
    pushMatrix();
    translate(w, h);
    rotate(ang);
    rect(-d/2, -d/2, d, d);
    
    // draw the marker image
    pushMatrix();
    scale(-1, -1);
    image(markers[id], -d/2, -d/2, d, d);
    popMatrix();
    
    // triangle, representing the upwards direction
    fill(255, 200, 200, 50);
    stroke(255, 0, 0, 50);
    triangle(-d/2, d/2, 0, d, d/2, d/2);
    popMatrix();
    
    // draw label on top
    /*
    fill(0);
    text(id, w, h);
    */
    
    
  }
}