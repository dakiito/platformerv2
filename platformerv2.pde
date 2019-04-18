float xpos;  //<>// //<>//
float ypos;
float timer;
boolean canJump1=true, 
  canJump2=true, 
  stage1=true, 
  stage2, 
  stage3;

float flight;
float gravity;
PImage backGround;
void setup() { 
  size(640, 480); 
  xpos = 50; 
  ypos = 400;
  frameRate(60);
  backGround = loadImage("forestBackground.png");
}

void draw() { 


  background(backGround); 


if(canJump2==false||canJump1==false){
  fallCheck();
}

  playerDraw();       //draw the player and update position
  playerMove();
  drawStage();
  stageCheck();

  debug();
}

void playerDraw() { 

  fill(0, 255, 255); 
  rectMode(CENTER);
  rect(xpos, ypos, 20, 20);    //player
}

void playerMove() {
  xpos=constrain(xpos, 20, 620);
  ypos-=flight;
  ypos+=gravity;  // gravity

  flight =constrain(flight-0.5, 0.0, 10); // make the flight value smaller every time this is ran
  float speed =2.0 ; 
  if (holdLeft) { 
    xpos -= speed;        //move the player and whatnot
  } 
  if (holdRight) { 
    xpos += speed;
  }
}
