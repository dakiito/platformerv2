void fallCheck() {

  if (canJump1==false) {
    timer=millis();
    canJump1=true;
    gravity=0;
  }    
  if (millis()-1000>timer) {
    canJump2=true;
  }else{
   canJump2=false; 
  }
  
}
