class Ufo extends GameObject {

  PVector direction;
  int timer;
  int shotTimer, threshold;
  float vx, vy;

  Ufo() {
    lives = 5;
    //location = new PVector (random(0, width), random(0, height));
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 1);
    velocity.rotate(random(0, TWO_PI));
    direction = new PVector (0, -0.1);
    timer = int(random(500, 2000));
    shotTimer = 0;
    threshold = 200;
    size = 30;
    
    vx = myShip.location.x - location.x;
    vy = myShip.location.y - location.y;
        
  }

  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    stroke(255);
    strokeWeight(2);
    fill(0, 0, 255);
    circle(0, 0, size);
    popMatrix();
  }

  void act() {
    super.act();

    //dying off screen
    //if ( location.y > height - size/2) lives = 0;
    //if ( location.y < height - size/2) lives = 0;
    //if ( location.x > width - size/2) lives = 0;
    //if ( location.x < width - size/2) lives = 0;

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
    //if (shotTimer > threshold) {
    myObjects.add(new UFOBullet(location.x, location.y, vx, vy));
   //shotTimer = 0;
    //}
    //shotTimer++;
  }
}
