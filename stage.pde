void drawStage() { //<>// //<>//
  fill(255);
  rectMode(CORNERS);
  rect(250, 390, 350, 380); //mapped   //the rectangle in the middle bottom
  
  rect(0,350,50,360);  //leftmost bottom rectangle




  stroke(255, 0, 0);
  rect(250, 370, 350, 380);  // rectangle hitbox

  stroke(2);
  rectMode(CORNER);
}
void stageCheck() {



  if (xpos>=250&&ypos>=370&&xpos<=350&&ypos>=370) {
    gravity=0;
    canJump2=true;
  } else {
    gravity=2;
  }
  
  
  
  
  if (stage1) {
   ypos=constrain(ypos, 20, 400);
   }
   
   if (stage2) {
   ypos=constrain(ypos, 20, 370);
   }
   
}
