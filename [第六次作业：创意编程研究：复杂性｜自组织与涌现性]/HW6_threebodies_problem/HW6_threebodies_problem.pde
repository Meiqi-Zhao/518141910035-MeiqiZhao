int maxsize = 300;
int i;
int j;
ArrayList<pl> planets = new ArrayList<pl>();
void setup(){
  size(1080,1080);
  for(int i=0;i<3;i++)
  planets.add(new pl(2000,1,i,500+i*350,height/5+tan(1+i)*100,i));
}

void draw(){
  background(0);
  for(int i=0;i<3;i++)
  {
    for (int j =0; j<3; j++)
    {
      planets.get(i).applyforce(planets.get(i).attract(planets.get(j)));
    }
    planets.get(i).update();
    planets.get(i).showpath();
    planets.get(i).display();
  }
}

class pl {
  int id;
  float r; 
  float mass;
  PVector pos; 
  PVector vel;
  PVector a; 
  color col;
  PVector f;
  ArrayList<PVector> path = new ArrayList<PVector>();
  pl(float m, float vx, float vy, float px, float py, int id_){
    mass = m;
    r = 10*calr(mass);
    pos = new PVector (px,py);
    vel = new PVector (vx,vy);
    id = id_;
    col = color (random(20,230),random(20,230),random(20,230));
    a = new PVector (0,0);
  }
  float calr (float m){
    return pow(m/PI*(3f/4f),1f/3f);
  }
  void display(){
  fill (col);
  noStroke();
  ellipse (pos.x, pos.y, r,r);
  fill (255);
  text(id, pos.x, pos.y);
  }
  void showpath(){
    stroke (col);
    for( int i= 0; i < path.size(); i++){
      PVector a = path.get(i);
      PVector b;
      if (i+1==path.size()){
        b=pos;
      } else {
        b = path.get(i+1);
        line(a.x,a.y,b.x,b.y);
        }
      }
    }
    
    void applyforce(PVector force){
      f = force.copy().mult(-1);
      a.add(f.div(mass));
    }
    void update(){
      vel.add(a);
      pos.add(vel);
      if(sqrt(pow(vel.x,2)+pow(vel.y,2))>6)
      vel.limit (2);
      path.add(new PVector(pos.x,pos.y));
      if (path.size()>maxsize){
        path.remove(0);
      }
    }
    
    PVector attract (pl m){
      PVector force = PVector.sub(pos, m.pos);
      float d = force.mag();
      d = constrain (d, 1.0,50);
      force.normalize();
      float strength= (0.49*mass*m.mass)/(d*d);
      force.mult(strength);
      return force;
    }
}

      
  
  
    
