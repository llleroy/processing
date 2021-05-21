size(600, 600);
textAlign(CENTER, CENTER);
//vars
int t=160;
int tp=0;
bool td=false;
bool tt=true;
bool kc=true;
//functions
var shift=function(s, f, ts, tf){
  return s-((s-f)*ts/tf);
}
var piece=function(x, y, a){
  var r1=sqrt(28800);
  var r2=sqrt(20800);
  var r3=sqrt(33800);
  var r4=sqrt(46800);
  
  var t=(a-225)*PI/180;
  
  quad(x+r1*cos(t), y+r1*sin(t), x+r2*cos(t-atan(1.5)+3*PI/4), y+r2*sin(t-atan(1.5)+3*PI/4), x+r3*cos(t+PI), y+r3*sin(t+PI), x+r4*cos(t-atan(1.5)-PI/4), y+r4*sin(t-atan(1.5)-PI/4));
}


//loop
draw = function () {
  background(0);
  //shapes
  strokeWeight(5);
  stroke(255, 0, 0);
  fill(255, 255, 0);
  
  var fx=sqrt(33800)*sin(PI/4-atan(1/5))+297;
  var fy=sqrt(33800)*sin(PI/4+atan(1/5))-3;
  var ft=atan(1/5)*180/PI;

  if(t<=50){
    piece(170, 430, 0);
    piece(170, 170, 90);
    piece(430, 170, 180);
    piece(430, 430, -90);
  }else
  if(t<150&&t>50){
    piece(shift(170, fx, t-50, 100), shift(430, fy, t-50, 100), shift(0, ft, t-50, 100));
    piece(shift(170, 600-fy, t-50, 100), shift(170, fx, t-50, 100), shift(90, ft+90, t-50, 100));
    piece(shift(430, 600-fx, t-50, 100), shift(170, 600-fy, t-50, 100), shift(180, ft+180, t-50, 100));
    piece(shift(430, fy, t-50, 100), shift(430, 600-fx, t-50, 100), shift(-90, ft-90, t-50, 100));
  }else{
    piece(fx, fy, ft);
    piece(600-fx, 600-fy, ft+180);
    piece(600-fy, fx, ft+90);
    piece(fy, 600-fx, ft-90);
    //blocks
    fill(0);
    noStroke();
    
    var l=86;
    var w=7;
    var dx=266.75;
    var dy=242;
    
    quad(dx, dy, dx+l, dy+l/5, dx+l-w/5, dy+l/5+w, dx-w/5, dy+w);
    dx+=-18.5;
    dy+=92;
    quad(dx, dy, dx+l, dy+l/5, dx+l-w/5, dy+l/5+w, dx-w/5, dy+w);
    dx+=20.1;
    dy+=-94.3;
    strokeWeight(5);
    stroke(255, 0, 0);
    line(dx, dy, dx+l, dy+l/5);
    dx+=-21;
    dy+=103;
    line(dx, dy, dx+l, dy+l/5);
    
  }
  
  t+=tp;
  constrain(t, 0, 200);
  if(tt){
    if(t>=200){
      td=true;
    }
    if(t<=0){
      td=false;
    }
    if(td){
      t--;
    }else{
      t++;
    }
  }else{
    if(key=='a'&&kc){
      kc=false;
      key=null;
      tp=0.5;
    }
    if(key=='d'&&kc){
      kc=false;
      key=null;
      tp=-0.5;
    }
  }
  if(key=='p'&&kc){
    kc=false;
    key=null;
    if(tt){
      tt=false;
    }else{
      tt=true;
    }
  }
  if(!keyPressed){
    kc=true;
    key=null;
    tp=0;
  }else{
    kc=false;
  }
  //debug
  textSize(20);
  fill(0);
  //text(t, 200, 200);
  
}

/*
-2/3x+2=x
120

*/