
// Bots leave random dots behind at regular intervals.
// Dots are bigger towards the center of the trail.

class DotBot extends Bot {

  DotBot(int i) { super(i); }

  void draw() {
    fill(#000000);
    float x1 = x + random(-15, 15);
    float y1 = y + random(-15, 15);
    float d = map(dist(x, y, x1, y1), 0, 20, 20, 0);
    ellipse(x1, y1, d, d);
  }
  
}