ArrayList waterfall = new ArrayList();
PVector gravity = new PVector(0, 0.02);
PImage bg;

void setup(){
  size(479, 640);
  bg = loadImage("purge.jpeg");
  noStroke();
}

void draw(){
  background(bg);
  fill(0, 20);
  rect(0, 0, width, height);
  fill(0);
  for(int i = 0; i < waterfall.size(); i++){
    Drop d = (Drop) waterfall.get(i);
    d.draw();
    d.applyForce(gravity);
    if(d.loc.y > d.stop){
      /* Reset defaults */
      d.loc = new PVector(random(200, 250), 258);
      d.vel = new PVector(sin(radians(random(-90, 90)))/5, 0);
    }
  }
  if(waterfall.size() < 800){
    waterfall.add(new Drop(new PVector(random(200, 250), 258)));
  }
}

class Drop {
  PVector loc;
  PVector vel;
  PVector acc;
  float stop;
  float d = random(1, 5);
  
  Drop(PVector loc){
    this.loc = loc;
    stop = height-random(50, 100);
    vel = new PVector(sin(radians(random(-90, 90)))/5, 0);
    acc = new PVector(0, 0);
  }
  
  void draw(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    ellipse(loc.x, loc.y +50, d +10, d +10); 
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, 1.5-d/5);
    acc.add(f);
  }
}
