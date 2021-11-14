// this is the Guan Li Xi Tong
class World{
  
ArrayList<Bloop> bloops;
Food food;


World(int num) {
  food = new Food (num);
  bloops = new ArrayList<Bloop>();
  for (int i = 0; i < num; i++){
  PVector l = new PVector (random(width), random(height));
  DNA dna = new DNA();
  bloops.add (new Bloop(l, dna));
  }
}

void born(float x, float y) {
PVector l = new PVector(x,y);
DNA dna = new DNA();
bloops.add(new Bloop(l, dna));
}

void run(){
  food.run();
  for (int i = bloops.size()-1; i >= 0; i--){
    Bloop b = bloops.get(i);
    b.run();
    b.eat(food);
if (b. dead()){
  bloops.remove(i);
  food.add(b.location);
}
Bloop child = b.reproduce();
if (child!=null) bloops.add(child);
}
}
}
  
