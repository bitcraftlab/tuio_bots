
abstract class BotViz {

  PGraphics canvas, gtmp;

  Bot[] bots = new Bot[imax];

  BotViz() {

    canvas = createGraphics(width, height);

    // create all the bots
    for (int i = 0; i < imax; i++) {
      bots[i] = makeBot(i);
    }
  }
  
  void setup() {
    beginDraw();
    background(255);
    endDraw();
  }

  // start drawing to offscreen canvas
  void beginDraw() {  
    gtmp = g;
    g = canvas;
    g.beginDraw();
  }

  // stop drawing to offscreen canvas
  void endDraw() {
    g.endDraw();
    g = gtmp;
  }

  void display() {
    image(canvas, 0, 0, width, height);
  }

  void draw() {

    beginDraw();
  
    // update bot data for detected bots
    for (TuioObject o : tc.getTuioObjectList()) {
      String id = str(o.getSymbolID());

      // look up bot number + ignore ids that are not in our list
      if (dict.hasKey(id)) {
        int i = dict.get(id);
        bots[i].update(o);
      }
    }

    // simulate and draw the bots
    for ( int i = 0; i < imax; i++) {
      bots[i].tick();
      bots[i].display();
    }

    endDraw();
  }

  abstract Bot makeBot(int i);
  abstract void keyPressed();

}


class DotBotViz extends BotViz {

  Bot makeBot(int i) {
    return new DotBot(i);
  }

  void keyPressed() {
    println("Dot Bots");
  }
}


class LineBotViz extends BotViz {

  void setup() {
    beginDraw();
    background(255);
    colorMode(HSB);
    endDraw();
  }

  Bot makeBot(int i) {
    return new LineBot(i);
  }

  void keyPressed() {
    println("Line Bots");
  }
}


class WobbleBotViz extends BotViz {

  Bot makeBot(int i) {
    return new WobbleBot(i);
  }

  void keyPressed() {
    println("Wobble Bots");
  }
}