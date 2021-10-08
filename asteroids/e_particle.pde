class Particle extends GameObject {

  int t;

  Particle() {
    lives = 1;
    size = 10;

    t = 255;
    location = myAsteroid.location.copy();
    //velocity.rotate(PI);//180
    //velocity.setMag(5);
  }

  void show() {
    fill(255, 255, 255, 255);
    circle(location.x, location.y, size);
  }

  void act() {
    super.act();
    t = t - 20;
    if ( t <= 0) lives = 0;
  }
}
