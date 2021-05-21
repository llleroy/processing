size(600, 600);
var grid=[];
for(int i=0;i<100;i++){
  grid[i]=[];
  for(int j=0;j<100;j++){
    grid[i][j]=0;
  }
}
var grad=0.5774;
/*
for(int i=0;i<35;i++){
  grid[i][round(i*grad)]=1;
  grid[i][40-round(i*grad)]=1;
}
for(int i=0;i<40;i++){
  grid[0][i]=1;
}
for(int i=0;i<80;i++){
  grid[i][round(i*grad)]=1;
  grid[i][92-round(i*grad)]=1;
}
for(int i=0;i<92;i++){
  grid[0][i]=1;             
}
*/
grad=1;
for(int i=0;i<57;i++){
  grid[i+42-4][1+round(i*grad)+4]=1;
}
grad=0.268;
for(int i=0;i<80;i++){
  grid[i+20-4][79-round(i*grad)+4]=1;
}
grad=0.268;
for(int i=0;i<80;i++){
  grid[20+round(i*grad)-4][79-i+4]=1;
}
var pos=[0, 0];
int cx=-59;
int cy=-59;
draw=function(){
  background(0, 155, 0);
  for(int i=0;i<100;i++){
    for(int j=0;j<100;j++){
      if(grid[i][j]==1){
        fill(0);
        stroke(255);
        strokeWeight(1);
        rect(i*5+51, j*5+51, 3, 3);
      }
    }
  }
  
  int tx=floor(mouseX/5)+cx;
  int ty=floor(mouseY/5)+cy;
  
  stroke(0);
  fill(255, 0, 0);
  rect((tx-cx)*5+1, (ty-cy)*5+1, 3, 3);
  noStroke();
  fill(50, 255, 50);
  rect(-cx*5+1, -cy*5+1, 5, 5);
  
  
  if(key=='w'&&kp){
    pos[1]--;
  }
  if(key=='s'&&kp){
    pos[1]++;
  }
  if(key=='a'&&kp){
    pos[0]--;
  }
  if(key=='d'&&kp){
    pos[0]++;
  }
  if(keyPressed){
    kp=false;
  }else{
    kp=true;
    key='';
  }
  
  if(mousePressed){
    cx+=-tx;
    cy+=-ty;
  }
  
  fill(0);
  if(tx-cx>9&&tx-cx<110&&ty-cy>9&&ty-cy<110){
    if(grid[tx-cx-10][ty-cy-10]!=1){
      fill(255, 0, 0);
    }
  }
  textSize(30);
  textAlign(CENTER);
  text((tx)+"   "+(ty), 300, 300);
  
}