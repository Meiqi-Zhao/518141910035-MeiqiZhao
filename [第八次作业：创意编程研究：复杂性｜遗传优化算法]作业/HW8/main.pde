World world;

void setup(){
  size(800,800);
  world = new World(20);
  smooth();
}

void draw(){
  background(15,180,210);
  world.run();
}

void mousePressed(){
  world.born(mouseX,mouseY);
}
