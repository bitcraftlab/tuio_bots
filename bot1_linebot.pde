
// Draw a rotating line around the position of every bot
class LineBot extends Bot {

  LineBot(int i) { super(i); }
 
  void draw() {
    stroke(hue , 255, 255, 100);
    strokeWeight(0.5);
    line(x, y, x + cos(a + r) * d, y + sin(a + r) * d);
  }
  
}