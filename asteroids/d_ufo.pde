class Ufo extends GameObject {

  PVector direction;
  int timer;
  int shotTimer, threshold;

  Ufo() {
    lives = 5;
    location = new PVector (random(0, width), random(0, height));
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector (0, -0.1);
    timer = 1000;
    shotTimer = 0;
    threshold = 200;
  }

  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    stroke(255);
    strokeWeight(1);
    fill(0, 0, 255);
    circle(0, 0, 30);
    popMatrix();
  }

  void act() {
    super.act();

    //dying off screen
    if ( location.y > height - size/2) lives = 0;
    if ( location.y < height - size/2) lives = 0;
    if ( location.x > width - size/2) lives = 0;
    if ( location.x < width - size/2) lives = 0;

    //getting hit by bullets
    int i = 0;
    while ( i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size) {
          obj.lives = 0;
          lives--;
        }
      }
      i++;
    }
    
    //shotting
    if (shotTimer > threshold) {
     myObjects.add(new Bullet());
     shotTimer = 0;
    }
    shotTimer++;
  }
}
