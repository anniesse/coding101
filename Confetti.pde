Confetti[] confetti = new Confetti[100];
boolean partyTime = false;

void setup() {
  size(1200, 800);
     background(255);
        smooth();
       
  for (int i = 0; i < confetti.length; i++) {
    confetti[i] = new Confetti();
  }
}

void mousePressed() {
  partyTime = true; 
  for (Confetti c : confetti) {
    c.burst(mouseX, mouseY);
  }
}

void draw() {
  background(#260085);
  if (partyTime) {
    for (Confetti c : confetti) {
      c.show();
      c.update();
    }
  }
}
class Confetti {
  float x, y;
  float xspeed, yspeed;
  Confetti() {
    x = -1200;
    y = -800;
    xspeed = 0;
    yspeed = 0;
  }
      
  void burst(float mx, float my) {
    x = mx;
    y = my;
    xspeed = random(-15, 10);
    yspeed = random(-15, 10);
  }
  
  void update(){
   x = x + xspeed; 
   y = y + yspeed; 
   
   yspeed = yspeed + 0.5; 
  }

  void show() {
    fill(r,g,b);
    ellipseMode(CENTER);
    ellipse(x, y, 8, 12);
  }
  
void mousePressed(){
  r = random(0);
  g = random(0);
  b = random(0);
}

float r = random(255);
float g = random(255);
float b = random(255);
}
