int nbCircles = 25;
Circle[] circles;
MyColor myColor;
float rMax,dMin;

void setup()
{
  size(400,400,P2D);
  frameRate(50);
  
  rMax =min(width,height)/2;
  dMin =max(width,height)/4;
  
  circles = new Circle[nbCircles];
  
  for(int i = 0;i < nbCircles;i++)
  {
    circles[i] = new Circle(random(rMax),0,0);
  }
   myColor = new MyColor();
}
void draw()
{
  background(0,60);
  translate(width/2,height/2);
  myColor.update(); 
  for (int j = 0; j < nbCircles; j++)
  {
      circles[j].update();                
    for (int i = j+1; i < nbCircles; i++)    
    {
      connect(circles[j], circles[i]); 
    }
  }
  
}

void connect(Circle c1,Circle c2)
{
  float d, x1, y1, x2, y2, r1 = c1.radius, r2 = c2.radius;
  float rCoeff = map(min(abs(r1), abs(r2)), 0, rMax, 0.08, 1);
  int n1 = c1.nbLines, n2 = c2.nbLines;
  for (int i = 0; i < n1; i++)
   {
    x1 = c1.x + r1 * cos(i * TWO_PI / n1 + c1.theta);
    y1 = c1.y + r1 * sin(i * TWO_PI / n1 + c1.theta);
    for (int j = 0; j < n2; j++)
    {
      x2 = c2.x + r2 * cos(j * TWO_PI / n2 + c2.theta);
      y2 = c2.y + r2 * sin(j * TWO_PI / n2 + c2.theta);

      d = dist(x1, y1, x2, y2);
      if (d < dMin)
      {
        stroke(myColor.R + r2/1.5, myColor.G + r2/2.2, myColor.B + r2/1.5, map(d, 0, dMin, 140, 0) * rCoeff);
        line(x1, y1, x2, y2);
      }
    }
  }
}

class Circle
{
  float x,y,radius,theta = 0;
  int nbLines = (int)random(3,25);
  float rotSpeed = (random(0,1) < 0.5 ? 1 : -1) * random(0.005, 0.034);
  float radSpeed = (random(0,1) < 0.5 ? 1 : -1) * random(0.3, 1.4);
  
  Circle(float p_radius, float p_x, float p_y)
  {
    radius = p_radius;
    x = p_x;
    y = p_y;
  }
  
  void update()
  {
    theta = rotSpeed + theta;
    radius = radius + radSpeed;
    radSpeed *= abs(radius) > rMax ? -1 : 1;  

  }
}
class MyColor
{
   float R, G, B, Rspeed, Gspeed, Bspeed;
   float minSpeed = 0.2;
   float maxSpeed = 0.8;
  MyColor()
  {
    R = random(20, 255);
    G = random(20, 255);
    B = random(20, 255);
    Rspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Gspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Bspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
  }
  void update()
  {
    Rspeed *= ((R += Rspeed) > 255 || (R < 20)) ? -1 : 1;
    Gspeed *= ((G += Gspeed) > 255 || (G < 20)) ? -1 : 1;
    Bspeed *= ((B += Bspeed) > 255 || (B < 20)) ? -1 : 1;
  }
}

void mousePressed() {
  setup();
}
  
