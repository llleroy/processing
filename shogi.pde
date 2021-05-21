size(600, 600);
textAlign(CENTER, CENTER);
//vars
var grid=[];
for(int i=0;i<9;i++){
  grid[i]=[];
  for(int j=0;j<9;j++){
  grid[i][j]=0;
  }
}

for(int i=0;i<9;i++){
  grid[i][2]=22;
  grid[i][6]=8;
}

grid[1][7]=6;
grid[7][7]=7;
grid[1][1]=21;
grid[7][1]=20;

grid[0][8]=5;
grid[1][8]=4;
grid[2][8]=3;
grid[3][8]=2;
grid[4][8]=1;
grid[5][8]=2;
grid[6][8]=3;
grid[7][8]=4;
grid[8][8]=5;
grid[0][0]=19;
grid[1][0]=18;
grid[2][0]=17;
grid[3][0]=16;
grid[4][0]=15;
grid[5][0]=16;
grid[6][0]=17;
grid[7][0]=18;
grid[8][0]=19;

var sel=[-1, -1];
bool clicked=false;
var posMoves=[];
int posNo=0;
var turn=true;
bool pressed=false;
bool flip=true;
bool proB=true;
bool proW=true;
var handB=[];
var handA=[];
var countB=0;
var countA=0;
//functions
var rem=function(array[], pos){
  if(pos==0){
    return subset(array, 1);
  }
  if(pos==array.length-1){
    return shortern(array);
  }
  return concat(subset(array, 0, pos), subset(array, pos+1, array.length-(pos+1)));
}
var piece = function(x, y, t){
  /*
  
  t = type of piece
  -1: DEBUG
  0: Blank
  1: King
  2: Gold General
  3: Silver General
  4: Knight
  5: Lance
  6: Bishop
  7: Rook
  8: Pawn
  9-14: Promotion variant (+6)
  15-28: Opposition variant (+14)
  
  */
  if(t!=0){
    fill(255);
    noStroke();
    //polygon(3, [200, 250, 200], [100, 170, 200]);
    //debug
    if(t>28||t<-1||t%1!=0){
      t=-1;
    }
    x++;
    y++;
    x=50+(x*50);
    y=50+(y*50);
    
    //backing
    if(t<=14){
      triangle(x-15, y-5, x, y-20, x+15, y-5);
      quad(x-15, y-5, x+15, y-5, x+20, y+20, x-20, y+20);
    }else{
      triangle(x-15, y+5, x, y+20, x+15, y+5);
      quad(x-15, y+5, x+15, y+5, x+20, y-20, x-20, y-20);
    }
    //text
    fill(0);
    textSize(25);
    var name;
    if(t==-1){
      name="!?";
    }
    if(t==1){
      name="玉";
    }
    if(t==15){
      name="王";
    }
    if(t%14==2){
      name="金";
    }
    if(t%14==3){
      name="銀";
    }
    if(t%14==4){
      name="桂";
    }
    if(t%14==5){
      name="香";
    }
    if(t%14==6){
      name="角";
    }
    if(t%14==7){
      name="飛";
    }
    if(t%14==8){
      name="歩";
    }
    if(t%14==9){
      name="全";
    }
    if(t%14==10){
      name="圭";
    }
    if(t%14==11){
      name="杏";
    }
    if(t%14==12){
      name="馬";
    }
    if(t%14==13){
      name="龍";
    }
    if(t%14==0){
      name="と";
    }
    if(t<=14){
      text(name, x, y+5);
    }else{
      rotate(PI);
      text(name, -x, -y+5);
      rotate(PI);
    }
  }
}
var check=function(x, y, t){
  int tSign=1;
  if(!turn){
    t-=14;
    tSign=-1;
  }
  if(t==1){
    newPos(x-1, y);
    newPos(x-1, y-1);
    newPos(x, y-1);
    newPos(x+1, y-1);
    newPos(x+1, y);
    newPos(x+1, y+1);
    newPos(x, y+1);
    newPos(x-1, y+1);
  }
  if(t==2||t==9||t==10||t==11||t==14){
    newPos(x-1, y);
    newPos(x-1, y-1*tSign);
    newPos(x, y-1*tSign);
    newPos(x+1, y-1*tSign);
    newPos(x+1, y);
    newPos(x, y+1*tSign);
  }
  if(t==3){
    newPos(x-1, y-1*tSign);
    newPos(x, y-1*tSign);
    newPos(x+1, y-1*tSign);
    newPos(x+1, y+1*tSign);
    newPos(x-1, y+1*tSign);
  }
  if(t==4){
    newPos(x-1, y-2*tSign);
    newPos(x+1, y-2*tSign);
  }
  if(t==5){
    run(x, y, 0, -1);
  }
  if(t==6){
    run(x, y, -1, -1);
    run(x, y, 1, -1);
    run(x, y, 1, 1);
    run(x, y, -1, 1);
  }
  if(t==7){
    run(x, y, 0, -1);
    run(x, y, 0, 1);
    run(x, y, 1, 0);
    run(x, y, -1, 0);
  }
  if(t==8){
    newPos(x, y-1*tSign);
  }
  if(t==12){
    run(x, y, -1, -1);
    run(x, y, 1, -1);
    run(x, y, 1, 1);
    run(x, y, -1, 1);
    newPos(x-1, y);    
    newPos(x, y-1);    
    newPos(x+1, y);    
    newPos(x, y+1);    
  }
  if(t==13){
    run(x, y, 0, -1);
    run(x, y, 0, 1);
    run(x, y, 1, 0);
    run(x, y, -1, 0);
    newPos(x-1, y-1);
    newPos(x+1, y-1);
    newPos(x+1, y+1);
    newPos(x-1, y+1);
  }
}
var newPos=function(x, y){
  if(x>=0&&x<=8&&y>=0&&y<=8){
    if(grid[x][y]==0||(turn&&grid[x][y]>=15)||(!turn&&grid[x][y]<=14)){
      posMoves[posNo]=[];
      posMoves[posNo][0]=x;
      posMoves[posNo][1]=y;
      posNo++;
      //add(posMoves, )
    }
  }
}
var run=function(x, y, a, b){
  int run=1;
  int tSign=1;
  if(!turn){
    tSign=-1;
  }
  bool loop=true;
  while(x+run*tSign*a>=0&&x+run*tSign*a<=8&&y+run*tSign*b>=0&&y+run*tSign*b<=8&&loop){
    if(grid[x+run*tSign*a][y+run*tSign*b]==0){
      newPos(x+run*tSign*a, y+run*tSign*b);
    }else{
      loop=false;
      run--;
    }
    run++;
  }
  if(x+run*tSign*a>=0&&x+run*tSign*a<=8&&y+run*tSign*b>=0&&y+run*tSign*b<=8){
    if((turn&&grid[x+run*tSign*a][y+run*tSign*b]>=15)||(!turn&&grid[x+run*tSign*a][y+run*tSign*b]<=14)){
      newPos(x+run*tSign*a, y+run*tSign*b);
    }
  }
}
//loop
draw=function(){
  //board
  background(200, 150, 0);
  stroke(0);
  strokeWeight(3);
  for(int i=0;i<10;i++){
    line(75+(i*50), 75, 75+(i*50), 525);
    line(75, 75+(i*50), 525, 75+(i*50));
  }
  //pieces
  for(int i=0;i<9;i++){
    for(int j=0;j<9;j++){
      piece(i, j, grid[i][j]);
    }
  }
  //accessories
  textSize(15);
  noStroke();
  if(flip){
    fill(0);
    text("B L A C K", 300, 540);
    text("Promotions?", 60, 540);
    fill(255);
    text("W H I T E", 300, 60);
    text("Promotions?", 540, 60);
  }else{
    fill(255);
    text("W H I T E", 300, 540);
    text("Promotions?", 60, 540);
    fill(0);
    text("B L A C K", 300, 60);
    text("Promotions?", 540, 60);
  }
  
  if(turn&&flip||!turn&&!flip){
    fill(0);
  }else{
    fill(255);
  }
  noStroke();
  ellipse(-565, 300, 1200, 1200);
  ellipse(300, -565, 1200, 1200);
  ellipse(1165, 300, 1200, 1200);
  ellipse(300, 1165, 1200, 1200);  
  
  if(proB){
    fill(50, 255, 50);
    rect(30, 550, 50, 50);
    fill(0, 100, 0);
    textSize(25);
    text("Yes", 55, 575);
  }else{
    fill(255, 100, 100);
    rect(30, 550, 50, 50);
    fill(150, 0, 0);
    textSize(25);
    text("No", 55, 575);
  }
  if(proW){
    fill(50, 255, 50);
    rect(515, 0, 50, 50);
    fill(0, 100, 0);
    textSize(25);
    text("Yes", 540, 25);
  }else{
    fill(255, 100, 100);
    rect(515, 0, 50, 50);
    fill(150, 0, 0);
    textSize(25);
    text("No", 540, 25);
  }
  
  noStroke();
  fill(50, 100, 255);
  triangle(585, 540, 585, 510, 555, 510);
  triangle(540, 585, 510, 585, 510, 555);
  triangle(15, 60, 15, 90, 45, 90);
  triangle(60, 15, 90, 15, 90, 45);
  
  noFill();
  strokeWeight(3);
  stroke(0);
  rect(545, 545, 50, 50, 1);
  rect(5, 5, 50, 50, 1);
  if(handB.length>0){
    piece(9.4, 9.4, handB[abs(countB%handB.length)]);
  }
  if(handA.length>0){
    piece(-1.4, -1.4, handA[abs(countA%handA.length)]);
  }
  
  fill(255);
  textSize(15);
  rotate(-PI/4);
  if(handB.length>0){
    text((abs(countB%handB.length)+1), 0, 535*sqrt(2));
  }
  rotate(PI);
  if(handA.length>0){
    text((abs(countA%handA.length)+1), 0, -65*sqrt(2));
  }
  rotate(-3*PI/4);
  
  
  //clicked square
  posMoves=[];
  posNo=0;
  fill(100, 100, 255, 100);
  noStroke();
  if(sel[0]>=0&&sel[1]>=0){
    rect(75+sel[0]*50, 75+sel[1]*50, 50, 50);
    //possible moves
    check(sel[0], sel[1], grid[sel[0]][sel[1]]);
  }
  if(sel[0]==-2&&sel[1]==-2&&handB.length>0){
    rect(545, 545, 50, 50);
    if(turn){
      for(int i=0;i<9;i++){
        for(int j=0;j<9;j++){
          if(grid[i][j]==0){
            newPos(i, j);
          }
        }
      }
    }
  }
  if(sel[0]==-3&&sel[1]==-3&&handA.length>0){
    rect(5, 5, 50, 50);
    if(!turn){
      for(int i=0;i<9;i++){
        for(int j=0;j<9;j++){
          if(grid[i][j]==0){
            newPos(i, j);
          }
        }
      }
    }
  }
  
  //possible squares
  fill(0, 255, 0, 100);
  for(int i=0;i<posNo;i++){
    rect(75+posMoves[i][0]*50, 75+posMoves[i][1]*50, 50, 50);
  }
  
  //mouse inputs
  if(!clicked&&mousePressed){
    clicked=true;
    if(mouseX>75&&mouseX<525&&mouseY>75&&mouseY<525){
      var nX=floor((mouseX-75)/50);
      var nY=floor((mouseY-75)/50);
      if(posNo>0){
        for(int i=0;i<posNo;i++){
          if(posMoves[i][0]==nX&&posMoves[i][1]==nY){
            if(turn){
              turn=false;
            }else{
              turn=true;
            }
            int taken=grid[nX][nY];
            if(taken!=0){        
               if((taken>=9&&taken<=14)||taken>=23){
                taken-=6;
              }
              if(taken>=15){
                taken-=14;
              }else{
                taken+=14;
              }
              if(turn){
                handA=append(handA, taken);
              }else{
                handB=append(handB, taken);
              }
            }
            if(sel[0]==-2&&sel[1]==-2){
              grid[nX][nY]=handB[abs(countB%handB.length)];
              
              handB=rem(handB, abs(countB%handB.length));
              
            }else if(sel[0]==-3&&sel[1]==-3){
              grid[nX][nY]=handA[abs(countA%handA.length)];
              
              handA=rem(handA, abs(countA%handA.length));                    
            }else{
              grid[nX][nY]=grid[sel[0]][sel[1]];
              grid[sel[0]][sel[1]]=0;
            }
            if(sel[0]>-1&&sel[1]>-1){
              if(proB&&nY<=2&&!turn&&grid[nX][nY]>=3&&grid[nX][nY]<=8){
                grid[nX][nY]+=6;
              }
              if(proW&&nY>=6&&turn&&grid[nX][nY]>=17&&grid[nX][nY]<=22){
                grid[nX][nY]+=6;
              }
            }
            
            sel=[-1, -1];
            posMoves=[];
            posNo=0;
          }
        }
        if(posNo>0){
          if(sel[0]==nX&&sel[1]==nY){
            sel=[-1, -1];
          }else{
            sel=[nX, nY];
          }
        }
      }else{
        if(sel[0]==nX&&sel[1]==nY){
          sel=[-1, -1];
        }else{
          sel=[nX, nY];
        }
      }
      
    }
    if(mouseX>30&&mouseX<80&&mouseY>550&&mouseY<600){
      if(proB){
        proB=false;
      }else{
        proB=true;
      }
    }
    if(mouseX>515&&mouseX<565&&mouseY>0&&mouseY<50){
      if(proW){
        proW=false;
      }else{
        proW=true;
      }
    }
    
    if(mouseX>mouseY+45&&mouseX<90&&mouseY>15){
      countA--;
    }
    if(mouseX+45<mouseY&&mouseX>15&&mouseY<90){
      countA++;
    }
    if(mouseX>mouseY+45&&mouseX<585&&mouseY>510){
      countB++;
    }
    if(mouseX+45<mouseY&&mouseX>510&&mouseY<585){
      countB--;
    }
    
    if(mouseX>545&&mouseX<595&&mouseY>545&&mouseY<595){
      sel=[-2, -2];
    }
    if(mouseX>5&&mouseX<55&&mouseY>5&&mouseY<55){
      sel=[-3, -3];
    }
    
  }else if(!mousePressed){
    clicked=false;
  }  
  
  //key inputs
  if(!pressed&&keyPressed){
    pressed=true;
    //flip board
    if(key=='f'||key=='F'){
      int hold=-1;
      for(int i=0;i<9;i++){
        for(int j=0;j<5;j++){
          if(j!=4||i<4){
            hold=grid[i][j];
            grid[i][j]=grid[8-i][8-j];
            grid[8-i][8-j]=hold;
          }
        }
      }
      for(int i=0;i<9;i++){
        for(int j=0;j<9;j++){
          if(grid[i][j]<=14&&grid[i][j]>=1){
            grid[i][j]+=14;
          }else if(grid[i][j]>=15){
            grid[i][j]-=14;
          }
        }
      }
      if(sel[0]>=0&&sel[1]>=0){
        sel=[8-sel[0], 8-sel[1]];
      }
      if(sel[0]==-2&&sel[1]==-2){
        sel=[-3, -3];
      }else if(sel[0]==-3&&sel[1]==-3){
        sel=[-2, -2];
      }
      if(flip){
        flip=false;
      }else{
        flip=true;
      }
      if(turn){
        turn=false;
      }else{
        turn=true;
      }
      if(proB){
        proB=proW;
        proW=true;
      }else{
        proB=proW;
        proW=false;
      }
      
      var hold = handA;
      handA=handB;
      handB=hold;
      for(int i=0;i<handA.length;i++){  
        if(handA[i]>=15){
          handA[i]-=14;
        }else{
          handA[i]+=14;
        }
      }
      for(int i=0;i<handB.length;i++){  
        if(handB[i]>=15){
          handB[i]-=14;
        }else{
          handB[i]+=14;
        }
      }
      int countHold=countB;
      countB=countA;
      countA=countHold;
      
      
      
      
    }
    
  }else if(!keyPressed){
    pressed=false;
  }
  //border
  stroke(0);
  strokeWeight(1);
  noFill();
  rect(0, 0, 599, 599);
  
  //win check
  
  for(int i=0;i<handB.length;i++){
    if(handB[i]==1){
      fill(0);
      textSize(100);
      text("Black Wins", 300, 300);
      end();
    }
  }
  for(int i=0;i<handA.length;i++){
    if(handA[i]==15){
      fill(255);
      textSize(100);
      text("White Wins", 300, 300);
      end();
    }
  }
  
  //debug
  textSize(30);
  fill(0);
  //text(rem([1, 2], 0), 205, 200);
  if(key=='*'){
    fill(0);
    textSize(150);
    text("END", 300, 300);
    end();
  }
}