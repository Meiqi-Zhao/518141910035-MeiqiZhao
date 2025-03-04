Particle[] particles;
float alpha;
void setup()
{
  size(700, 800,P2D);
  background(0);
  noStroke();
  setParticles();
}
void draw()
{
  frameRate(20);
  alpha = map(mouseX, 0, width, 5, 255);//透明度
  fill(0, alpha);
  rect(0, 0, width, height);
  loadPixels();//像素
  for (Particle p : particles) {
    p.move();
  }
  updatePixels();
}

void setParticles() {
  particles = new Particle[50000];
  for (int i = 0; i < 50000; i++) 
  { 
    float x = random(width);
    float y = random(height);
    float adj = map(y, 0, height, 255, 0);
    int c = color(40, adj, 230);
    particles[i]= new Particle(x, y, c);
  }
}

void mousePressed() {
  setParticles();
}


class Particle{
  float posX, posY, incr=0, theta;
  color  c;

  Particle(float xIn, float yIn, color cIn) 
  {
    posX = xIn;
    posY = yIn;
    c = cIn;
  }
  void move() {
    update();
    wrap();
    display();
  }
  void update() {
    incr +=  .008;
    theta = noise(posX * .004+random(0,0.2), posY * .004, incr) * TWO_PI;
    posX += 2*cos(theta);
    posY += 2* sin(theta);
  }
    void display() {
    if (posX > 0 && posX < width && posY > 0  && posY < height) {
      pixels[(int)posX + (int)posY * width] =  c;
    }
  }
  void wrap() {
    if (posX < 0) posX = width-1;
    if (posX > width ) posX =  1;
    if (posY < 0 ) posY = height-1;
    if (posY > height) posY =  1;
  }
  
}
