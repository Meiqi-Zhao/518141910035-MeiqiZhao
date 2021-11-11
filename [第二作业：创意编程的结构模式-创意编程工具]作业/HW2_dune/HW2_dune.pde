void setup(){

  size(1080,720);
}
  void draw(){
      
  //sky
  background(215,148,99);  
 
  //person
  //head
  fill(0);
  ellipse(540,266,16,17);
  //body
  fill(255);
  rect(531,276,19,70);
 
   //sun
  noStroke();
  fill(239,86,45);
  ellipse(711,136,80,80);
  
  //dune
  fill(159,134,48); 
  ellipse(540,720,1084,783);
}
