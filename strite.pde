//startup-------
size(500, 500);
textAlign(CENTER, CENTER);
//startup-------
//vars-------
boolean start=false;
//vars-------
var shape=[5, 1, 0];
int moveTime=0;
boolean Pk=true;
int count=0;
int down=1;
int nLine=230;
boolean quick=false;
boolean doLine=false;
int dots=0;
int flat=0;
int edges=0;
int follow=floor(random(0, 7));
int tall=0;
int reLu=1;
//big arrays-------
var grid=[];
for(int i=0;i<10;i++){
  grid[i]=[];
  for(int j=0;j<19;j++){
    grid[i][j]=0;
  }
}
var type=[
  [[-2, 0],[-1, 0],[1, 0]],
  [[-1, 0],[1, 0],[0, 1]],
  [[-1, 0],[1, 0],[1, 1]],
  [[-1, 0],[1, 0],[-1, 1]],
  [[1, 0],[0, 1],[-1, 1]],
  [[-1, 0],[0, 1],[1, 1]],
  [[-1, 0],[0, 1],[-1, 1]]
  ,
  [[0, -1],[0, 1],[0, 2]],
  [[-1, 0],[0, -1],[0, 1]],
  [[-1, 1],[0, 1],[0, -1]],
  [[-1, -1],[0, -1],[0, 1]],
  [[-1, 0],[-1, -1],[0, 1]],
  [[0, 1],[1, 0],[1, -1]],
  [[-1, 0],[0, 1],[-1, 1]]
  ,
  [[-2, 0],[-1, 0],[1, 0]],
  [[-1, 0],[1, 0],[0, -1]],
  [[-1, 0],[1, 0],[-1, -1]],
  [[-1, 0],[1, 0],[1, -1]],
  [[1, 0],[0, 1],[-1, 1]],
  [[-1, 0],[0, 1],[1, 1]],
  [[-1, 0],[0, 1],[-1, 1]]
  ,
  [[0, -1],[0, 1],[0, 2]],
  [[1, 0],[0, -1],[0, 1]],
  [[0, 1],[0, -1],[1, -1]],
  [[0, -1],[0, 1],[1, 1]],
  [[-1, 0],[-1, -1],[0, 1]],
  [[0, 1],[1, 0],[1, -1]],
  [[-1, 0],[0, 1],[-1, 1]]
];
//arrays-------
//methods-------
var place=function(n){
  int tX=shape[0];
  int tY=shape[1];
  int t=shape[2];
  grid[tX][tY]=n;
  for(int i=0;i<3;i++){
    grid[tX+type[t][i][0]][tY+type[t][i][1]]=n;
  }
}
var checks=function(no){
  int sX=shape[0];
  int sY=shape[1];
  int s=shape[2];
  int nX;
  int nY;
  if(sX<0||sX>9||sY>18){
    return true;
  }
  if(grid[sX][sY]>0){
    return true;
  }
  for(int i=0;i<3;i++){
    nX=sX+type[s][i][0];
    nY=sY+type[s][i][1];
    if(nX<0||nX>9||nY>18){
      return true;
    }
    if(grid[nX][nY]>0){
      return true;
    }
  }
  return false;
}
//methods-------
//loop-------
draw=function(){
  //loop sets-----
  int mX=mouseX;
  int mY=mouseY;
  //loop sets-----
  //shapes-----
  if(start){
    if((moveTime<frameRate*((11-flat)*0.05)/down&&flat<=10)||(moveTime<frameRate*((21-flat)*0.005)/down&&flat>10)){
      moveTime++;
    }else{
      moveTime=0;
      doLine=false;
      place(0);
      shape[1]++; 
      if(checks()){
        //old shape
        shape[1]--; 
        int pX=shape[0];
        int pY=shape[1];
        place(shape[2]+1);
        //check shape
        boolean end=false;
        if(grid[5][1]>0){
          end=true;
        }else{
          for(int i=0;i<3;i++){
            if(grid[5+type[shape[2]][i][0]][1+type[shape[2]][i][1]]>0){
              end=true;
            }
          }
        }
        if(!end){
        //new shape
          shape=[5, 1, follow];
          follow=floor(random(0, 7));
          dots+=floor(random(16, 19));
        }
      }
      
      //line check---
      for(int i=1;i<19;i++){
        boolean lTest=true;
        for(int j=0;j<10;j++){
          if(grid[j][i]<=0){
            lTest=false;
          }
        }
        if(lTest){
          for(int j=0;j<10;j++){
            grid[j][i]=-1;
          }
          moveTime=0;
          doLine=true;
          nLine=230;
        }
      }
      //line check---
      
    }
    place(shape[2]+1);
  }
  //shapes-----
  //do line-----
  if(doLine){
    place(0);
    if(flat<=10){
      nLine-=(30/(frameRate*((11-flat)*0.05)/down));
    }else{
      nLine-=(30/(frameRate*((21-flat)*0.005)/down));
    }
    if(nLine<205){
      boolean reLine=true;
      int totLine=0;
      while(reLine){
        reLine=false;      
        for(int j=18;j>0;j--){
          if(grid[0][j]==-1){
            reLine=true;
            for(int i=0;i<10;i++){
              grid[i][0]=0;
              grid[i][j]=grid[i][j-1];
              grid[i][j-1]=-1;
            }
          }
        }
        if(reLine){
          totLine++;
        }
      }
      if(totLine==1){
        dots+=40*flat;
      }
      if(totLine==2){
        dots+=100*flat;
      }
      if(totLine==3){
        dots+=300*flat;
      }
      if(totLine==4){
        dots+=1200*flat;
      }
      edges+=totLine;
      flat=floor(edges/10)+reLu;
      doLine=false;
    }
  }
  //do line-----
  //canvas-----
  background(200);
  //canvas-----
  //grid-----
  for(int i=0;i<10;i++){
    for(int j=1;j<19;j++){
      int g=grid[i][j]%7;
      if(g==1){
        fill(255, 150, 0);
        stroke(200, 100, 0);
      }
      if(g==2){
        fill(255, 255, 0);
        stroke(200, 200, 0);
      }
      if(g==3){
        fill(255, 30, 255);
        stroke(150, 0, 255);
      }
      if(g==4){
        fill(30, 30, 255);
        stroke(0, 0, 200);
      }
      if(g==5){
        fill(0, 255, 255);
        stroke(0, 200, 200);
      }
      if(g==6){
        fill(0, 255, 0);
        stroke(0, 200, 0);
      }
      if(g==0){
        fill(255, 10, 10);
        stroke(200, 0, 0);
      }
      if(grid[i][j]==-1){
        fill(nLine);
        stroke(nLine);
      }
      if(grid[i][j]!=0){
        strokeWeight(3);
        rect(i*25+127, (j-1)*25+27, 21, 21);
      }
    }
  }
  //grid-----
  //screen-----
  noFill();
  if(!start){
    fill(120);
  }
  stroke(0);
  strokeWeight(10);
  rect(120, 20, 260, 461);
  if(!start){
    fill(220);
    stroke(0);
    strokeWeight(5);
    rect(160, 210, 180, 80);
    fill(0);
    textSize(70);
    text("Start", 250, 250);
    if(mousePressed&&mX>160&&mX<340&&mY>210&&mY<290){
      start=true;
      shape[2]=follow;
      follow=floor(random(0, 7));
      flat=reLu;
    }
  }
  fill(0);
  textSize(25);
  text("Points", 442.5, 150);
  text(dots, 442.5, 175);
  text("Lines", 442.5, 200);
  text(edges, 442.5, 225);
  text("Level", 442.5, 250);
  text(flat, 442.5, 275);
  text("High-", 442.5, 325);
  text("score", 442.5, 350);
  text(tall, 442.5, 375);
  text("Starts at", 442.5, 450);
  text("Level "+reLu, 442.5, 475);
  //preshow---
  fill(220);
  stroke(0);
  strokeWeight(4);
  rect(391.5, 17, 100, 100);
  if(follow==0){
    fill(255, 150, 0);
    stroke(200, 100, 0);
  }
  if(follow==1){
    fill(255, 255, 0);
    stroke(200, 200, 0);
  }
  if(follow==2){
    fill(255, 30, 255);
    stroke(150, 0, 255);
  }
  if(follow==3){
    fill(30, 30, 255);
    stroke(0, 0, 200);
  }
  if(follow==4){
    fill(0, 255, 255);
    stroke(0, 200, 200);
  }
  if(follow==5){
    fill(0, 255, 0);
    stroke(0, 200, 0);
  }
  if(follow==6){
    fill(255, 10, 10);
    stroke(200, 0, 0);
  }
  strokeWeight(3);
  rect(441, 46, 21, 21);
  for(int i=0;i<3;i++){
    rect(441+(21*type[follow][i][0]), 46+(21*type[follow][i][1]), 21, 21);
  }
  //preshow---
  //screen-----
  //keys-----
  if(start){
    place(0);
    if((key=='w'||keyCode==38)&&Pk){
      if(shape[2]<=20){
        shape[2]+=7;
      }else{
        shape[2]-=21;
      }
      if(checks()){
        if(shape[2]>=7){
          shape[2]-=7;
        }else{
          shape[2]+=21;
        }
      }
    }
    if((key=='a'||keyCode==37)&&Pk){
      shape[0]--;
      if(checks()){
        shape[0]++;
      }
    }
    if((key=='d'||keyCode==39)&&Pk){
      shape[0]++;
      if(checks()){
        shape[0]--;
      }
    }
    if((key=='s'||keyCode==40)&&Pk){
      shape[1]++;
      if(checks()){
        shape[1]--;
      }else{
        moveTime=0;
      }
      down=10;
      count=5;
    }
    if(key==' '&&Pk){
      quick=true;
      while(quick){
        shape[1]++;
        if(checks()){
          shape[1]--;
          moveTime=50;
          quick=false;
        }
      }
    }
    if(keyPressed){
      Pk=false;
    }else{
      Pk=true;
      key='';
      keyCode=0;
      down=1;
    }
    place(shape[2]+1);
  }else if(key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6'||key=='7'||key=='8'||key=='9'){
    reLu=key-48;
  }
  //key-----
  //reset---
  if(end){
    start=false;
    if(tall<dots){
      tall=dots;  
    }
    dots=0;
    edges=0;
    flat=reLu;
    for(int i=0;i<10;i++){
      for(int j=0;j<19;j++){
        grid[i][j]=0;
      }
    }
  }
  //reset---
  //test-----
  /*
  fill(0, 255, 0);
  stroke(0, 205, 0);
  strokeWeight(3);
  for(int i=0;i<18;i++){
    rect(127, i*25+27, 21, 21);
  }
  */
  textSize(15);
  fill(0);
  
  text("Frames: "+round(frameRate), 57.5, 470);
  //test-----
}
//loop-------