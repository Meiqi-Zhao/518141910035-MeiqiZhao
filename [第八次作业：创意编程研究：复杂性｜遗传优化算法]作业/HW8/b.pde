class Bloop{
PVector location;
DNA dna;
float health;
float r;
float xoff;
float yoff;
float maxspeed;

  Bloop(PVector l, DNA dna_){
  location = l.get();
  health = 200;
  xoff=random(1000);
  yoff=random(1000);
  dna=dna_;
  maxspeed = map (dna.genes[0],0,1,15,0);
  r=map(dna.genes[0],0,1,0,50);
}

void run(){
  update();
  borders();
  display();
}

void eat(Food f){
  ArrayList<PVector> food = f.getFood();
  for(int i= food.size()-1; i>=0; i--){
    PVector foodLocation = food.get(i);
    float d = PVector.dist(location, foodLocation);
    if(d<r/2){
      health+=100;
      food.remove(i);
    }
  }
}

Bloop reproduce(){
  if (random(1)<0.0005){
    DNA childDNA=dna.copy();
    childDNA.mutate(0.01);
    return new Bloop(location,childDNA);
  }
  else {
    return null;
  }
}

void update(){
  float vx = map(noise(xoff),0,1,-maxspeed,maxspeed);
  float vy = map(noise(yoff),0,1,-maxspeed,maxspeed);
  PVector velocity = new PVector(vx,vy);
  xoff+=0.01;
  yoff += 0.01;
  
  location.add(velocity);
  health-=0.2;
}

void borders(){
  if(location.x<-r)location.x =width+r;
  if(location.y<-r)location.y =height+r;
  if(location.x> width+r)location.x =-r;  
  if(location.y> height+r)location.y =-r;
}
void display(){
  ellipseMode(CENTER);
  stroke(0,health);
  fill(0,health);
  ellipse(location.x, location.y,r,r);
}

boolean dead(){
if (health<0.0) return true;
else return false;
}
}
