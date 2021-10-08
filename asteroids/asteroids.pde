//Emma SUn
//Oct 4th 2021
//Aster0oids



//gif intro
PImage[] gif;
int f;
int n;

//font
PFont font;

//objects
Ship myShip;
Ufo myUfo;
Asteroid myAsteroid;
ArrayList<GameObject> myObjects;

//particles
//Fire myFire;
//Particle myParticle;

//keyboard
boolean wkey, akey, skey, dkey, qkey, spacekey;

//mode framwork
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

void setup() {
  size(600, 600, FX2D);
  textMode(CENTER);
  rectMode(CENTER);

  //objects
  myUfo = new Ufo();
  myShip = new Ship();
  myAsteroid = new Asteroid();
  
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myUfo);
  myObjects.add(myShip);
  
  //asteroids
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());

  //keyboard
  wkey = akey = skey = dkey = spacekey = qkey = false;

  font = createFont("conthrax-sb.ttf", 50);

  mode = GAME;

  //intro gif

  f = 74;
  gif = new PImage[f];
  int i = 0;
  while ( i< f) {
    gif[i] = loadImage("frame_"+i+"_delay-0.05s.gif");
    i++;
  }
}

void draw() {
  background(0);

  ////pbjects
  //int i = 0;
  //while ( i < myObjects.size()) {
    //GameObject obj = myObjects.get(i);
  //  obj.show();
  //  obj.act();

    //if (obj.lives == 0) {
    //  myObjects.remove(i);
    //} else {
    //  i++;
    //}
  //}

  //mode framwoekr
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error:" + mode);
  }
  
  
}

void reset() {
  myUfo.lives = 5;
  
}
