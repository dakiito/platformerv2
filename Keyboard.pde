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
      flight+=10;
      canJump1=false;
    }
  }
}


void keyReleased() {
  setSignal(false);
}
