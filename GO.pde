size(600, 600);
textAlign(CENTER, CENTER);
//vars
int wc=0;
int bc=0;
int dim=13;
int hand=10;
bool turn=false;
//the whole grid
var grid=[];
for(int i=0;i<dim;i++){
    grid[i]=[];
    for(int j=0;j<dim;j++){
        grid[i][j]=[0];
    }
}
int bn=0;
int wn=0;
//all arrived tiles
var store=[];
bool click=false;
//functions
var kills=function(){
    for(int i=0;i<dim;i++){
        for(int j=0;j<dim;j++){
            store=[];
            if((grid[i][j]==2&&turn)||(grid[i][j]==1&&!turn)){
                if(bounds(i, j)){
                    for(int k=0;k<store.length;k++){
                        for(int l=0;l<dim;l++){
                            for(int m=0;m<dim;m++){
                            if(l==store[k][0]&&m==store[k][1]){
                                grid[l][m]=0;
                                if(turn){
                                  bc++;
                                }else{
                                  wc++;
                                }                    
                                }
                            }
                        }
                    }
                }if(key=='p'){
                fill(0);
                    text(store, 200, 200);
                    //debug
                    }
            }
        }
    }
}
//recursive
var bounds=function(int x, int y){
    int not = 1;
    if(turn){
        not=2;
    }
    int yet = 2;
    if(turn){
        yet=1;
    }
    bool pass=[false, false, false, false];
    int counts=0;
    store[store.length]=[x, y];
    for(int i=0;i<store.length;i++){
        if(x-1==store[i][0]&&y==store[i][1]){
            pass[0]=true;
        }
        if(x==store[i][0]&&y-1==store[i][1]){
            pass[1]=true;
        }
        if(x+1==store[i][0]&&y==store[i][1]){
            pass[2]=true;
        }
        if(x==store[i][0]&&y+1==store[i][1]){
            pass[3]=true;
        }
    }
    if(x-1<0){
        pass[0]=true;        
    }
    if(y-1<0){
        pass[1]=true;        
    }
    if(x+1>=dim){
        pass[2]=true;
    }
    if(y+1>=dim){
        pass[3]=true;
    }
    if(!pass[0]){
        if(grid[x-1][y]==yet||(grid[x-1][y]==not&&bounds(x-1, y))){
            counts++;
        }
    }else{
        counts++;
    }
    if(!pass[1]){
        if(grid[x][y-1]==yet||(grid[x][y-1]==not&&bounds(x, y-1))){
            counts++;
        }
    }else{
        counts++;
    }
    if(!pass[2]){
        if(grid[x+1][y]==yet||(grid[x+1][y]==not&&bounds(x+1, y))){
            counts++;
        }
    }else{
        counts++;
    }
    if(!pass[3]){
        if(grid[x][y+1]==yet||(grid[x][y+1]==not&&bounds(x, y+1))){
            counts++;
        }
    }else{
        counts++;
    }
    if(counts>=4){
        return true;
    }else{
        return false;
    }
}
var count=function(){
    wn=0;
    bn=0;
    for(int i=0;i<dim;i++){
        for(int j=0;j<dim;j++){
            if(grid[i][j]==1){
                wn++;
            } 
            if(grid[i][j]==2){
                bn++;
            }
        }
    }
}
//loop
draw=function(){
    if(turn){
        background(200, 200, 255);
    }else{
        background(100, 100, 255);
    }
    //buttons 
    
    if(wn+bn==0){
      fill(0, 0, 0, 100);
      textSize(200);
      text(dim, 300, 300);
      noStroke();
      var gSize=600/(dim+1);
      textSize(200/(dim+1));
      if(dim>9){
        fill(180);
        rect(120-(gSize*1.5), gSize/5, gSize*3, gSize*3/5, 5);
        fill(0);
        text("(-) BOARD SIZE", 120, gSize/2);
      }
      if(dim<21){
        fill(180);
        rect(480-(gSize*1.5), gSize-gSize*4/5, gSize*3, gSize*3/5, 5);
        fill(0);
        text("(+) BOARD SIZE", 480, gSize/2);
      }
      if(click){
        click=false;
        if(mouseX>120-(gSize*1.5)&&mouseX<120+(gSize*1.5)&&mouseY>gSize/5&&mouseY<gSize*4/5&&dim>9){
          dim--;
          grid=[];
          for(int i=0;i<dim;i++){
              grid[i]=[];
              for(int j=0;j<dim;j++){
                  grid[i][j]=[0];
              }
          }
        }else
        if(mouseX>480-(gSize*1.5)&&mouseX<480+(gSize*1.5)&&mouseY>gSize/5&&mouseY<gSize*4/5&&dim<21){
          dim++;
          grid=[];
          for(int i=0;i<dim;i++){
              grid[i]=[];
              for(int j=0;j<dim;j++){
                  grid[i][j]=[0];
              }
          }
        } else {
         click=true;
        }
      }
    }
    //turn text
    fill(0);
    textSize(200/(dim+1));
    String turnt="WHITE";
    if(!turn){
        turnt="BLACK";
    }
    text(turnt+" TO PLAY", 300, 300/(dim+1));
    //pieces count
    text(wn+" white pieces on board; "+bn+" black pieces on board", 300, 600-400/(dim+1));
    text(wc+" white pieces taken; "+bc+" black pieces taken", 300, 600-200/(dim+1));
    //lines
    stroke(0);
    strokeWeight(2);
    for(int i=0;i<dim;i++){
        line(600/(dim+1), (600/(dim+1))+(i*((600/(dim+1)*(dim))/(dim))), 600/(dim+1)*(dim), (600/(dim+1))+(i*((600/(dim+1)*(dim))/(dim))));
        line((600/(dim+1))+(i*((600/(dim+1)*(dim))/(dim))), 600/(dim+1), (600/(dim+1))+(i*((600/(dim+1)*(dim))/(dim))), 600/(dim+1)*(dim));
    }
    //mouse checks
    for(int i=0;i<dim;i++){
        for(int j=0;j<dim;j++){
            if(sqrt(sq(((i+1)*(600/(dim+1)))-mouseX, 2)+sq(((j+1)*(600/(dim+1)))-mouseY, 2))<270/(dim+1)){
                //place
                if(click){
                    click=false;
                    if(grid[i][j]==0){
                        if(turn){
                            grid[i][j]=[1];
                        }else{
                            grid[i][j]=[2];
                        }
                        kills();
                        if(hand==0){                            
                          if(turn){
                              turn=false;
                          }else{
                              turn=true;
                          }
                        }else{
                          hand--;
                        }
                        kills();
                        count();
                    }
                    
                }
                if(turn){
                  fill(255, 255, 255, 100);
                }else{
                  fill(0, 0, 0, 100);
                }
                noStroke();
                ellipse(((i+1)*(600/(dim+1))), ((j+1)*(600/(dim+1))), 540/(dim+1), 540/(dim+1));
                
            }
            //tile checks
            if(grid[i][j]==1){
                fill(255);
                noStroke();
                ellipse(((i+1)*(600/(dim+1))), ((j+1)*(600/(dim+1))), 540/(dim+1), 540/(dim+1));
            }
            if(grid[i][j]==2){
                fill(0);
                noStroke();
                ellipse(((i+1)*(600/(dim+1))), ((j+1)*(600/(dim+1))), 540/(dim+1), 540/(dim+1));
            }
        }
    }
    //click check
    if(click){
        click=false;
    }
    if(mousePressed){
        if(check){
            check=false;
            click=true;
        }
    }else{
        check=true;
        click=false;
    }
    //wipe screen
    if(key=='r'){
        key=undefined;
        for(int i=0;i<dim;i++){
            for(int j=0;j<dim;j++){
                grid[i][j]=0;
            }
        }
        turn=false;
        wn=0;
        bn=0;
        
    }
    //debug
    if(key=='q'){
        textSize(150);
        fill(0);
        text("END", 300, 300);
        crash
    }
    fill(0);
    //text(store, 200, 200, 200, 200);
}