class UFOBullet extends GameObject {


  UFOBullet(float x, float y, float vx, float vy) {
    //timer = 120;
    lives = 1;
    //location = new PVector(location.x, location.y);
    //velocity = new PVector(direction.x, direction.y);
    velocity.setMag(10);

    size = 10;
  }

  void show() {
    strokeWeight(1);
    stroke(255);
    noFill();
    circle(location.x, location.y, size);
  }

  void act() {
    super.act();
  }
}
