//<>// //<>//
boolean holdLeft = false, 
  holdRight = false;



void setSignal (boolean setTo) {
  if (keyCode == LEFT) {
    holdLeft = setTo;
  }
  if (keyCode == RIGHT) {
    holdRight = setTo;
  }
}

void keyPressed() {
  setSignal(true);
  if (canJump2) {
    if (keyCode == UP) {     //when up is pressed then increase flight value
      flight+=15;
      canJump1=false;
    }
  }
  if (hasWon) {
    if (key=='r'||key=='R') {
      hasWon=false;
      xpos = 340; 
      ypos = 370;
      speed=2.777;
    }
  }
}


void keyReleased() {
  setSignal(false);
}
