PVector location_random;
ArrayList box;
int distance =55;
int num=150;
void setup()
{
  frameRate(50);
  size(450,450);
  background(255);
  box = new ArrayList();
  for(int i=0;i<num;i++)
  {
    location_random = new PVector(random(-141,141),random(-141,141));
    Dots dot = new Dots(location_random);
    box.add(dot);
  }
}
void draw()
{
  translate(width/2,height/2);
  fill(0);
  ellipse(0,0,400,400);
  for(int i=0;i<num;i++)
  {
    Dots dot1 = (Dots) box.get(i);
    dot1.play();
    dot1.update();
    for(int j=i;j<num;j++)
    {
      Dots dot2 = (Dots) box.get(j);
      dot2.update();
      if(dist(dot1.location.x,dot1.location.y,dot2.location.x,dot2.location.y)<distance)
      {
        for(int k=j;k<num;k++)
        {
          Dots dot3 = (Dots) box.get(k);
          //dot3.update();
          if(dist(dot1.location.x,dot1.location.y,dot3.location.x,dot3.location.y)<distance
         &&dist(dot3.location.x,dot3.location.y,dot2.location.x,dot2.location.y)<distance)
          {
          fill(dot3.c,20);
          noStroke();
          beginShape();
          vertex(dot1.location.x,dot1.location.y);
          vertex(dot2.location.x,dot2.location.y);
          vertex(dot3.location.x,dot3.location.y);
          endShape();
          }
        }
      }
    }
    
  }
   
}

class Dots
{
  PVector v;
  color c;
  PVector location;   
  Dots(PVector loc){
    location = loc;
    int i =(int)random(0,5);
    if(i == 0) c = color(#B74AD8);
    if(i == 1) c = color(#817E83);
    if(i == 2) c = color(#FCD569);
    if(i == 3) c = color(#69ECFC);
    if(i == 4) c = color(#A6FC69);
    v =new PVector(random(-0.1,0.1),random(-0.1,0.1));
  }
  void play()
  {
    fill(c,0);
    noStroke();
    ellipse(location.x,location.y,2,2);
  }
  void update()
  {
    if(dist(location.x,location.y,0,0)<200)
    {
      location.x += v.x;
      location.y += v.y;
    }
    else{
      v=v.mult(-1);
      location.x += v.x;
      location.y += v.y;
    }
  }
}

void mousePressed() {
  setup();
}
