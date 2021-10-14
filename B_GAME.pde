void game() {
  background(0);

  bg.resize(1100, 0);
  image(bg, 00, 0);
  //pbjects
  int i = 0;
  while ( i < myObjects.size()) {
    GameObject obj = myObjects.get(i);
    obj.show();
    obj.act();

    if (obj.lives == 0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }

  //pause
  noFill();
  stroke(255);
  strokeWeight(4);
  rect(560, 40, 40, 40);
  line(555, 30, 555, 50);
  line(565, 30, 565, 50);

  rectMode(CORNER);
  //teloport cool down
  rectMode(CORNER);
  noStroke();
  fill(255);
  rect(20, 20, 200, 20);

  fill(255, 0, 0);
  if (teloTimer >= 200) fill(0, 255, 0);
  rect(20, 20, teloTimer, 20);
  
  rectMode(CENTER);
}

void gameClicks() {

  if (myShip.lives == 0) mode = GAMEOVER;


  //int i = 0;
  //while ( i < myObjects.size()) {
  //  GameObject obj = myObjects.get(i);
  //  if (obj instanceof Asteroid) {
  //    if (obj.lives == 0) mode = GAMEOVER;
  //  }
  //}

  //pause
  if ( mouseX >= 540 && mouseX <= 580 && mouseY >= 20 && mouseY <= 60) {
    mode = PAUSE;
  }
}
