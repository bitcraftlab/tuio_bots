
// Each bot creates a wobbly polygon, that follows it around

class WobbleBot extends Bot {

  WobbleBot(int i) { super(i); }

  void draw() {
    
      stroke(0, 100);
      strokeWeight(0.2);
      noFill();
      beginShape();
      int n = bi + 4;
      for (int i = 0; i < n + 2; i++) {
        float ang = map(i, 0, n-1, 0, TWO_PI) + a ;// noise(i * 0.1, frameCount * 0.1);
        float x1 = x + cos(ang) * d;
        float y1 = y + sin(ang) * d;
        curveVertex(x1, y1);
      }
      endShape();

  }
}