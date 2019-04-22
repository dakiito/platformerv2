void drawStage() { //<>// //<>//

  PImage spike= loadImage("spike.png"), 
    flag = loadImage("flag.png"), 
    wallObstacle = loadImage("wallObstacle.png"), 
    wallObstacleFlipped = loadImage("wallObstacleFlipped.png");
  fill(255);
  rectMode(CORNERS);
  imageMode(CORNERS);
  /*rect(100, 390, 640, 380); //mapped                          //rect1 the rectangle in the middle bottom
   rect(0, 350, 50, 360);    //mapped                         //rect2middle middle above tent but below tree
   rect(160, 290, 320, 300); //mapped                        //rect3  middle middle above tent but below tree
   rect (217, 311, 281, 324); //mapped                      //rect4 tent roof
   rect (320, 220, 335, 295); //mapped                     // rect5       rock wall above tent
   rect(320, 220, 352, 227);  //mapped                    //rect6 above rock wall
   rect(350, 190, 360, 220);  //mapped                   //rect7 second rock wall above tent
   rect(350, 180, 450, 190);   //mapped                 //rect 8 above second rock wall
   rect(160, 125, 285, 129);   //mapped                // rect9 tree branch right
   
   rect(480, 125, 570, 130);         //mapped        //rect11 win platform   */
  rect(340, 80, 405, 83);           //mapped        // rect10 the platform to win 
  image(spike, 310, 255, 320, 300); //mapped       // the spike above tent
  image(spike, 340, 200, 360, 230);//mapped       //  spike on second rock platform
  image(spike, 50, 330, 60, 380); //mapped       //leftmost spike
  image(spike, 70, 340, 80, 390);//mapped       //leftmost spike x2
  image(wallObstacle, 445, 210, 460, 250);     //  under 2nd rock platform
  image(wallObstacleFlipped, 470, 130, 485, 160); // under win platform

  if (flag1) {
    image(flag, 5, 322, 22, 350);
  }
  if (flag2) {
    image(flag, 600, 350, 615, 380);
  }
  if (flag3) {
    image(flag, 180, 100, 200, 125);
  }
  stroke(255, 0, 0);

  stroke(2);
  rectMode(CORNER);
  imageMode(CORNER);
}
void stageCheck() {
  if (hasWon==false);
  if (xpos>=100&&ypos>=370&&xpos<=640&&ypos<=370) {    //rect1 the floor
    gravity=0;
    canJump2=true;
  } else if (xpos>=0&&ypos>=340&&xpos<=50&&ypos<=340) {   //rect2 middle middle above tent but below tree
    gravity=0;
    canJump2=true;
  } else if (xpos>=160&&ypos>=280&&xpos<=320&&ypos<=290) { //rect3 middle middle above tent but below tree
    gravity=0;
    canJump2=true;
  } else if (xpos>=217&&ypos>=311-10&&xpos<=281&&ypos<=324-10) {  //rect4 tent roof
    gravity=0;
    canJump2=true;
  } else if (xpos>=310&&ypos>=220&&xpos<=335&&ypos<=295) {        //rect5 rock wall
    xpos=320;
    canJump2=true;
  } else if (xpos>=320&&ypos>=220-10&&xpos<=352&&ypos<=227-10) {    //rect6  platform above rock wall
    gravity=0;
    canJump2=true;
  } else if (xpos>=350&&ypos>=190&&xpos<=360&&ypos<=220) {        //rect7 second rock wall
    xpos=350;
    canJump2=true;
  } else if (xpos>=350&&ypos>=180&&xpos<=450&&ypos<=190) {  //rect8
    gravity=0;
    canJump2=true;
  } else if (xpos>=160&&ypos>=125-10&&xpos<=285&&ypos<=129-10) {    //rect9
    gravity=0;
    canJump2=true;
  } else if (xpos>=340&&ypos>=70&&xpos<=405&&ypos<=73) {    //rect 10
    gravity=0;
    canJump2=true;
  } else if (xpos>=480&&ypos>=125-10&&xpos<=570&&ypos<=130-10) { //rect 11
    gravity=0;
    hasWon=true;
    speed=0;
    canJump2=false;
  } else if (xpos>=0&&ypos>=350-10&&xpos<=40&&ypos<=360-10) {
    gravity=0;
    canJump2=true;
  } else {
    gravity+=0.4;
  }
  if (stage1) {
    ypos=constrain(ypos, 20, 370);    // keep the player on the floor and not too high
    xpos=constrain(xpos, 10, 620);    // left and right boundaries
  }
}
void obstacleCheck() {
  if (dist(xpos, ypos, 60, 380)<=30) {      // the leftmost spikes
    isDead=true;
  } else if (dist(xpos, ypos, 315, 280)<=10) {      //spike above tent
    isDead=true;
  } else if (dist(xpos, ypos, 350, 217)<=10) {      //spike above tent
    isDead=true;
  } else if (dist(xpos, ypos, 450, 230)<=10) {      //wall obstacle under second rock platform
    isDead=true;
  } else if (dist(xpos, ypos, 480, 150)<=10) {     //wall obstacle on the win platform
    isDead=true;
  } else if (dist(xpos, ypos, 10, 355)<=20&&flag1==true) {     //leftmostflag hitbox check
    flag1=false;
    achivementCount+=1;
  } else if (dist(xpos, ypos, 600, 365)<=10&&flag2==true) {  //rightmost flag hitbox check 
    flag2=false;    
    achivementCount+=1;
  } else if (dist(xpos, ypos, 190, 115)<=10&&flag3==true) {   //tree flag hitbox check
    flag3=false;    
    achivementCount+=1;
  }
}
