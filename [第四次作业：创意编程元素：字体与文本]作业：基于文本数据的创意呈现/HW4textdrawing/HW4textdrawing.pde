float x = 0, y = 0;
float stepSize = 5.0;
String letters = "The FitnessGram Pacer Test is a multistage aerobic capacity test that progressively gets more difficult as it continues. The 20 meter pacer test will begin in 30 seconds. Line up at the start. The running speed starts slowly but gets faster each minute after you hear this signal bodeboop. A sing lap should be completed every time you hear this sound. ding Remember to run in a straight line and run as long as possible. The second time you fail to complete a lap before the sound, your test is over. The test will begin on the word start. On your mark. Get ready!… Start.";
int fontSizeMin = 3;
float angleDistortion = 0.0;
int counter = 0;
PFont p;

void setup() {
  p = createFont("JJStencil Light.TTF", 20);
  textFont(p);
  //size(780, 780);
  fullScreen();
  background(255);
  smooth();
  cursor(CROSS);

  x = mouseX;
  y = mouseY;

  textAlign(LEFT);
}

void draw() {
  fill(255, 10);
  //rect(0, 0, width, height);
  fill(0);
  //if (mouseOver)
  {
    float d = dist(x, y, mouseX, mouseY);
    //textFont('Georgia');
    textSize(fontSizeMin+d/2);
    char newLetter = letters.charAt(counter);
    stepSize = textWidth(newLetter);

    if (d > stepSize) {
      float angle = atan2(mouseY-y, mouseX-x);

      pushMatrix();
      translate(x, y);
      rotate(angle + random(angleDistortion));
      text(newLetter, 0, 0);
      popMatrix();

      counter++;
      if (counter > letters.length()-1) counter = 0;

      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize;
    }
  }
}

void mouseOver() {
  x = mouseX;
  y = mouseY;
}

void keyPressed() {
  // angleDistortion ctrls arrowkeys up/down
  if (keyCode == DELETE || keyCode == BACKSPACE) background(255);
  if (keyCode == UP) angleDistortion += 0.1;
  if (keyCode == DOWN) angleDistortion -= 0.1;
}
