float xpos, //<>// //<>//
  ypos, 
  timer;
boolean canJump1=true, 
  canJump2=true, 
  stage1=true, 
  hasWon, 
  isDead;
float speed =2.777, 
  flight, 
  gravity;
PImage backGround;
boolean flag1=true, 
  flag2=true, 
  flag3=true;
int achivementCount;
void setup() { 
  size(640, 480); 
  xpos = 340; 
  ypos = 370;
  frameRate(60);
  backGround = loadImage("forestBackground.png");
}

void draw() { 


  background(backGround); 


  if (canJump2==false||canJump1==false) {  // timer on jump intializaton, check the timer tab
    fallCheck();
  }
  gravity=constrain(gravity, 0, 3.5);  
  respawn();      //teleport player if won/lost
  playerDraw();       //draw the player and update position
  playerMove();
  drawStage();      // draw the stage tab
  stageCheck();      //hitboxes
  obstacleCheck();
 // debug();
  achivements();
}

void playerDraw() { 

  fill(0, 255, 255); 
  rectMode(CENTER);
  rect(xpos, ypos, 20, 20);    //player
}

void playerMove() {

  ypos-=flight;
  ypos+=gravity;  // gravity

  flight =constrain(flight-0.5, 0.0, 10); // make the flight value smaller every time this is ran

  if (holdLeft) { 
    xpos -= speed;        //move the player and whatnot
  } 
  if (holdRight) { 
    xpos += speed;
  }
}
void respawn() {
  if (isDead) {
    isDead=false;
    xpos=340;
    ypos=370;
    achivementCount=0;
    flag1=true;
    flag2=true;
    flag3=true;
  }
  if (hasWon&&achivementCount==3) {
    textSize(40);
    fill(200, 20, 20);
    text("You COMPLETED THE GAME!!!", 0, height/2);
    text("Press R", width/2-50, height-50);
    delay(500);

    textSize(11);
  } else if (hasWon) {
    textSize(48);
    fill(255);
    text("You won!!!", width/2-40, height/2);
    text("Now go collect the flags", width/2-290, height/2+90);
    text("Press R", width/2-50, height-50);
    textSize(11);
  }
}

void achivements() {
  if (achivementCount==1) {
    fill(#FFFF5D);
    star(20, 30, 20, 10, 5);
  } else if (achivementCount==2) {
    fill(#FFFF5D);
    star(20, 30, 20, 10, 5);
    star(40, 30, 20, 10, 5);
  } else if (achivementCount==3) {
    fill(#FFFF5D);
    star(20, 30, 20, 10, 5);
    star(40, 30, 20, 10, 5);
    star(60, 30, 20, 10, 5);
  }
}
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
