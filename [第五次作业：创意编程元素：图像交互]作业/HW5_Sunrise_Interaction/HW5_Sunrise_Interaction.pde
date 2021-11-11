int xpos = 15;

void setup(){
  size(1080,720);
}
void draw(){
  background(132,186,228);
  fill(49,203,24); 
  ellipse(540,720,1274,563);
  noStroke();
  fill(255,175,20);
  ellipse(xpos,mouseY,100,100);
}

void keyPressed(){
  println(key);
  xpos = xpos+20;

}
