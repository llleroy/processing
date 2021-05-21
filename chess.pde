//setup-------------------
size(600, 600);
textAlign(CENTER, CENTER);
//variables-------------------
var board=[];
for(int i=0;i<8;i++){
  board[i]=[];
  for(j=0;j<8;j++){
    board[i][j]=0;
  }
}
var hover=[-2, -2];
var select=[-2, -2];
var posMoves=[];
bool turn=true;
bool toSearch=true;
//functions-------------------
boardIs=function(x, y, n){
  board[x-1][8-y]=n;
}
boardIs(5, 1, 1);
boardIs(4, 1, 2);
boardIs(3, 1, 3);
boardIs(6, 1, 3);
boardIs(2, 1, 4);
boardIs(7, 1, 4);
boardIs(1, 1, 5);
boardIs(8, 1, 5);
boardIs(1, 2, 6);
boardIs(2, 2, 6);
boardIs(3, 2, 6);
boardIs(4, 2, 6);
boardIs(5, 2, 6);
boardIs(6, 2, 6);
boardIs(7, 2, 6);
boardIs(8, 2, 6);
boardIs(5, 8, 7);
boardIs(4, 8, 8);
boardIs(3, 8, 9);
boardIs(6, 8, 9);
boardIs(2, 8, 10);
boardIs(7, 8, 10);
boardIs(1, 8, 11);
boardIs(8, 8, 11);
boardIs(1, 7, 12);
boardIs(2, 7, 12);
boardIs(3, 7, 12);
boardIs(4, 7, 12);
boardIs(5, 7, 12);
boardIs(6, 7, 12);
boardIs(7, 7, 12);
boardIs(8, 7, 12);

var moveCheck=function(x, y){
  bool search=true;
  int delay=0;
  int i=select[0];
  int j=select[1];
  bool noTake = false;
  if(board[i][j]==6){
    noTake=true;
    if(j==6){
      delay=1;
    }else{
      delay=2;
    }
  }
  if(board[i][j]==12){
    noTake=true;
    if(j==1){
      delay=1;
    }else{
      delay=2;
    }
  }
  while(search){
    if(!(i==select[0]&&j==select[1])){
      int n=board[i][j]; 
      if((turn&&n>=1&&n<=6)||(!turn&&n>=7&&n<=12)){
        search=false;
      }else if(n!=0){
        if(!noTake){
          posMoves[posMoves.length()]=[i, j];
        }
        search=false;
      }else{
        posMoves[posMoves.length()]=[i, j];
      }
      if(delay>0){
        delay++;
      }
      if(delay>=3){
        search=false;
      }
    }
    i+=x;
    j+=y;
    if(!(i>=0&&i<=7&&j>=0&&j<=7)){
      search=false;
    }
  }
  toSearch=false;
}

//loop-------------------
draw=function(){
  background(160, 160, 150);
  for(int i=0;i<8;i++){
    for(j=0;j<8;j++){
      noStroke();
      var selectColour=[0, 0, 0];
      if((i+j)%2==0){
        selectColour=[255, 255, 255];
      }else{
        selectColour=[0, 0, 0];        
      }
      if(i==hover[0]&&j==hover[1]){
        selectColour=[0, 200, 20];
      }
      if(i==select[0]&&j==select[1]){
        selectColour=[0, 0, 150];
      }
      fill(selectColour[0], selectColour[1], selectColour[2]);
      rect(i*70+20, j*70+20, 70, 70);
      stroke(50, 150, 20);
      strokeWeight(2);
      //Pieces
      var bNo=board[i][j];
      var bX=i*70+55;
      var bY=j*70+55;
      
      if(bNo>=1&&bNo<=6){
        fill(200, 220, 80);
      }
      if(bNo>=7&&bNo<=12){
        fill(80, 20, 20);
        bNo-=6;
      }
      
      if(bNo==1){
        quad(bX-25, bY-15, bX+25, bY-15, bX+20, bY+25, bX-20, bY+25);
        rect(bX-4, bY-25, 8, 10);
        
        noStroke();
        rect(bX-3, bY-16, 6, 3);
        stroke(50, 150, 20);
        strokeWeight(2);
        
        fill(selectColour[0], selectColour[1], selectColour[2]);
        triangle(bX-15, bY-7, bX-4, bY-7, bX-4, bY+3);
        triangle(bX+15, bY-7, bX+4, bY-7, bX+4, bY+3);
      }
      if(bNo==2){
        triangle(bX-12, bY+25, bX+12, bY+25, bX, bY-20);
        triangle(bX-25, bY+25, bX-3, bY+25, bX-15, bY-20);
        triangle(bX+3, bY+25, bX+25, bY+25, bX+15, bY-20);
        quad(bX, bY-25, bX+4, bY-21, bX, bY-17, bX-4, bY-21);
        quad(bX-15, bY-25, bX-11, bY-21, bX-15, bY-17, bX-19, bY-21);
        quad(bX+15, bY-25, bX+11, bY-21, bX+15, bY-17, bX+19, bY-21);
        
        noStroke();
        rect(bX-15, bY+24, 30, -15);
      }
      if(bNo==3){
        quad(bX, bY-25, bX+15, bY+5, bX, bY+25, bX-15, bY+5);
        quad(bX-25, bY+20, bX-15, bY+25, bX+15, bY+25, bX+25, bY+20);
        
        noStroke();
        rect(bX-3, bY+18, 6, 3);
        stroke(50, 150, 20);
        strokeWeight(2);
        
        fill(selectColour[0], selectColour[1], selectColour[2]);
        //polygon(bX, bY+5, bX-5*cos(PI/10), bY+5*sin(PI/10), bX-5*sin(PI/5), bY-5*cos(PI/5), bX+5*sin(PI/5), bY-5*cos(PI/5), bX+5*cos(PI/10), bY+5*sin(PI/10));
        rect(bX-3, bY-3, 6, 6);
      }
      if(bNo==4){
        quad(bX+20, bY+25, bX-5, bY, bX-25, bY, bX-10, bY+25);
        triangle(bX-25, bY, bX-20, bY-25, bX-15, bY);
        triangle(bX-15, bY, bX-10, bY-25, bX-5, bY);
        quad(bX-21, bY-20, bX-25, bY, bX+25, bY-5, bX+25, bY-15);
        rect(bX-15, bY-15, 3, 3);
        point(bX+20, bY-10);
        
        noStroke();
        rect(bX-23, bY-3, 16, 4);
        stroke(50, 150, 20);
        strokeWeight(2); 
      }
      if(bNo==5){
        rect(bX-15, bY-15, 30, 30);
        quad(bX-15, bY+15, bX-25, bY+25, bX+25, bY+25, bX+15, bY+15);
        rect(bX-22, bY-21, 44, 6);
        rect(bX-22, bY-25, 4, 4);
        rect(bX-14, bY-25, 4, 4);
        rect(bX-6, bY-25, 4, 4);
        rect(bX+2, bY-25, 4, 4);
        rect(bX+10, bY-25, 4, 4);
        rect(bX+18, bY-25, 4, 4);
       
        noStroke();
        rect(bX-21, bY-23, 2, 3);
        rect(bX-13, bY-23, 2, 3);
        rect(bX-5, bY-23, 2, 3);
        rect(bX+3, bY-23, 2, 3);
        rect(bX+11, bY-23, 2, 3);
        rect(bX+19, bY-23, 2, 3);
        rect(bX-14, bY-17, 28, 40);
        stroke(50, 150, 20);
        strokeWeight(2); 
      }
      if(bNo==6){
        rect(bX-25, bY+20, 50, 5);
        triangle(bX, bY+7, bX-10, bY+20, bX+10, bY+20);
        quad(bX+20*cos(19*PI/60), bY-25, bX-20*sin(19*PI/60), bY-20*cos(19*PI/60)-25+20*sin(19*PI/60), bX-20*cos(19*PI/60), bY+20*sin(19*PI/60)-25+20*sin(19*PI/60), bX+20*sin(19*PI/60), bY+20*cos(19*PI/60)-25+20*sin(19*PI/60));
        
        noStroke();
        rect(bX-8, bY+19, 16, 3);
        stroke(50, 150, 20);
        strokeWeight(2); 
      }
    }
  }
  
  if(select[0]!=-2&&select[1]!=-2&&toSearch){
    var selNo=board[select[0]][select[1]];
    if(turn){
      if(selNo==6){
        moveCheck(0, -1);
      }
    }else{
      if(selNo==12){
        moveCheck(0, 1);
      }
    }
  }
  
  if(posMoves.length()>0){
    fill(200, 180, 0, 150);
    noStroke();
    for(int i=0;i<posMoves.length();i++){
      int pX=posMoves[i][0];
      int pY=posMoves[i][1];
      ellipse(55+70*pX, 55+70*pY, 30, 30);
      if(mousePressed&&clicked&&mouseX>20+70*pX&&mouseX<90+70*pX&&mouseY>20+70*pY&&mouseY<90+70*pY){
        clicked=false;
        board[pX][pY]=board[select[0]][select[1]];
        board[select[0]][select[1]]=0;
        select=[-2, -2];
        toSearch=true;
        posMoves=[];
        if(turn){
          turn=false;
        }else{
          turn=true;
        }
      }
    }
  }
  
  if(mouseX>20&&mouseX<580&&mouseY>20&&mouseY<580){
    hover=[floor((mouseX-20)/70), floor((mouseY-20)/70)];
    if(mousePressed&&clicked){
      clicked=false;
      toSearch=true;
      posMoves=[];
      if(select[0]==hover[0]&&select[1]==hover[1]){
        select=[-2, -2];
      }else{
        select=hover;
      }
    }
  }else{
    hover=[-2, -2];
  }
  
  if(!mousePressed){
    clicked=true;
  }
  
  //debug-------------------
  fill(255, 0, 0);
  textSize(20);
  text(turn, 200, 200);
}