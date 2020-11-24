PVector[] points = new PVector[4];
float angle = 0;

float[][] projection = {
  {1, 0, 0},
  {0, 1, 0}
};

void setup() {
  size(800, 600);
  
  points[0] = new PVector(-100, -100);
  points[1] = new PVector(100, -100);
  points[2] = new PVector(100, 100);
  points[3] = new PVector(-100, 100);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  stroke(255);
  strokeWeight(16);
  noFill();
  
  float[][] rotation = {
    {cos(angle), -sin(angle), 0},
    {sin(angle), cos(angle), 0}
  };
  for (PVector v : points) {
    PVector projected2d = matmul(projection, v);
    PVector rotated = matmul(rotation, projected2d);
    point(rotated.x, rotated.y);
    
    //point(v.x, v.y);
  }
  
  
  angle += 0.01;
}
