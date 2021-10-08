class Ship extends GameObject {

  PVector direction;
  int shotTimer, threshold;
  float teloTimer;

  Ship() {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    shotTimer = 0;
    threshold = 60;
    teloTimer = 200;
  }

  void show() {
    text("lives" + lives, 300, 300);
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    stroke(255);
    strokeWeight(1);
    noFill();
    triangle(-20, 20, -20, -20, 30, 0);

    popMatrix();

    //teloport cool down
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(20, 20, 200, 20);

    fill(255, 0, 0);
    if (teloTimer >= 200) fill(0, 255, 0);
    rect(20, 20, teloTimer, 20);
    if (teloTimer < 200)  teloTimer = teloTimer + 0.5;

    rectMode(CENTER);
  }

  void act() {
    super.act();

    //teleport
    if (qkey && teloTimer >= 200) {
      location.x = random(600);
      location.y = random(600);
      int i = 0;
      GameObject obj = myObjects.get(i);
      if (obj instanceof Asteroid) {
        while (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size) {
          location.x = random(600);
          location.y = random(600);
          println("ahhhh");
        }
      }
      //teloTimer = 0;
    }

    if (velocity.mag() > 10) velocity.setMag(10);

    if (wkey) {
      velocity.add(direction);
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
    }
    if (skey) velocity.sub(direction);
    if (akey) direction.rotate(radians(-5));
    if (dkey) direction.rotate(radians(5));
    if (spacekey && shotTimer > threshold) {
      myObjects.add(new Bullet());
      shotTimer = 0;
    }
    shotTimer++;


    int i = 0;
    while ( i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Asteroid) {
        if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size/2) {
          //lives--;
        }
      }
      i++;
    }
  }
}
