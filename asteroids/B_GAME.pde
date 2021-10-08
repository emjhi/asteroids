void game() {
  background(0);

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
}

void gameClicks() {
  //  if (myShip.lives == 0) {
  //  
   //mode = GAMEOVER;
  //  }
  
  //pause
  if ( mouseX >= 540 && mouseX <= 580 && mouseY >= 20 && mouseY <= 60){
   mode = PAUSE; 
  }
}
