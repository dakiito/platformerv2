void debug() {
  fill(255,0,0);
  text("stage1="+stage1, 50, 50); 
  text(mouseX+":"+mouseY+"flight:"+flight+"gravity:"+gravity+"posx:"+xpos+"posy:"+ypos, 20, 20); // debug
  text("canJump1:"+canJump1+"canJump2:"+canJump2,70,70);
}
