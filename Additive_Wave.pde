int xspacing = 12;
int w = 100;
int maxwaves = 6;

float theta = 0.0;
float[] amplitude = new float[maxwaves];
float[] dx = new float[maxwaves];       
float[] yvalues;                        

void setup() {
  size(1000, 800);
  frameRate(30);
  colorMode(RGB, 255, 255, 255, 100);
  w = width + 16;

  for (int i = 0; i < maxwaves; i++) {
    amplitude[i] = random(10,30);
    float period = random(100,500);
    dx[i] = (TWO_PI / period) * xspacing;
  }

  yvalues = new float[w/xspacing];
}

void draw() {
  background(#922b21);
  calcWave();
  renderWave();
}

void calcWave() {
  theta += 0.02;

  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = 0;
  }
 
  for (int j = 0; j < maxwaves; j++) {
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      if (j % 2 == 0)  yvalues[i] += sin(x)*amplitude[j];
      else yvalues[i] += cos(x)*amplitude[j];
      x+=dx[j];
    }
  }
}

void renderWave() {
  noStroke();
  fill(#f1948a);
  ellipseMode(CENTER);
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing,height/2+yvalues[x],25,30);
  }
}
