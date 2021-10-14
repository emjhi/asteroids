//Emma SUn
//Oct 4th 2021
//Aster0oids

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//sound variables
Minim minim;
AudioPlayer win, lose, explode, shoot;

//teloport
float teloTimer = 200;

//tutorial variables
int textTimer = 0;
int t = 255;

//gif intro
PImage[] gif;
int f;
int n;

//game background
PImage bg;

//font
PFont font;
PFont font2;

//objects
Ship myShip;
ArrayList<GameObject> myObjects;

//keyboard
boolean wkey, akey, skey, dkey, qkey, spacekey;

//mode framwork
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;
final int TUTORIAL = 5;

void setup() {
  size(600, 600, FX2D);
  rectMode(CENTER);
  textAlign(CENTER);

  //objects
  myShip = new Ship();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);

  //asteroids
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());

  //keyboard
  wkey = akey = skey = dkey = spacekey = qkey = false;

  //font
  font = createFont("conthrax-sb.ttf", 50);
  font2 = createFont("Star Trek_future.ttf", 50);

  mode = INTRO;

  //intro gif
  f = 74;
  gif = new PImage[f];
  int i = 0;
  while ( i< f) {
    gif[i] = loadImage("frame_"+i+"_delay-0.05s.gif");
    i++;

    bg = loadImage("maxresdefault.jpg");
  }

  //minim
  minim = new Minim(this);
  win = minim.loadFile("mixkit-retro-game-notification-212.wav");
  lose = minim.loadFile("mixkit-arcade-space-shooter-dead-notification-272.wav");
  shoot = minim.loadFile("mixkit-laser-gun-shot-3110.wav");
  explode = minim.loadFile("mixkit-truck-crash-with-explosion-1616.wav");
}

void draw() {
  background(0);

  //mode framwoekr
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == TUTORIAL) {
    tutorial();
  } else {
    println("Mode error:" + mode);
  }
}

void reset() {
}

void tactile() {
}
