class Food{
  ArrayList<PVector> food;
  
  Food(int num){
    food = new ArrayList();
    for(int i= 0; i<num; i++){
      food.add(new PVector(random(width),random(height)));
    }
  }
  
  void add(PVector l){
    food.add(l.get());
  }
  void run(){
    for (PVector f: food){
      rectMode(CENTER);
      stroke(0);
      fill(175);
      rect(f.x,f.y,8,8);
    }
    if(random(1)<0.001){
    food.add(new PVector(random(width),random(height)));
  }
}

ArrayList getFood(){
  return food;
}
}
