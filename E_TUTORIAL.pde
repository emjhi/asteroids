void tutorial() {
  
  fill(255);
  text("timer" + textTimer, 300, 100);

  if (textTimer <= 500) {
    textFont(font2);
    textSize(100);

    fill(255, 255, 255, t);
    text("TUTORIAL", width/2, height/2);
      if (textTimer > 400) t = t - 3;
      textTimer = textTimer + 1;
    
  //} else if ( ) {
    
  //}
    //rect(300, 300, 200, 200);
    
  }

}

void tutorialClicks() {
}
