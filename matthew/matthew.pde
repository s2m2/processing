void setup() {
  size(400, 400, P3D);
  pixelDensity(displayDensity());
  background(0);
  noStroke();
}

float x = 200;
float y = 200;

void draw() {
    pushMatrix();
    fill(0, 10);
    noStroke();
    rect(0, 0, 400, 400);
    rotateY(frameCount / 200.0);
    for(int i=0;i<3;i++) {
      x = random(150, 250)+random(-50, 50);
      y = random(150, 250)+random(-50, 50);
      noFill();
      stroke(255, 255, 255);
      hexagon(x, y, 60);
    }
    box(500);
    popMatrix();
    pushMatrix();
    translate(width/2, height/2);
    rotateY(frameCount / 200.0);
    box(300);
    popMatrix();
}

void hexagon(float x, float y, float radius) {
  float angle = TWO_PI / 6;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy, 0);
  }
  endShape(CLOSE);
}
