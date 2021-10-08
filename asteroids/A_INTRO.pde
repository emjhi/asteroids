void intro() {
 //intro gif
  image(gif[n], 0, 0, width, height);
  if (frameCount % 5 ==0) n = n + 1;
  if (n == f) n = 0;
  
  //title text
  fill(255);
  stroke(2);
  textFont(font);
  text("ASTEROIDS", 115, 150);

  stroke(255);
  strokeWeight(3);
  noFill();
  rect(300, 300, 400, 50);
  textSize(30);
  text("START", 225, 310);
}

void introClicks() {
  if (mouseX >= 100 && mouseX <= 500 && mouseY >= 275 && mouseY <= 325) {
    mode = GAME;
  }
}
