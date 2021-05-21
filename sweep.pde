size(700, 600);
var poi=-1;
var hrn=1;
var msn=1;
var mx=1;
var ms=20;
var cn=0;
var sho=0;
var cc=0;
var ccm=[[]];
var ch=0;
var hm=2;
var hr=100;
var hc=0;
var hp=2;
var d=0;
var kk=0;
var grid=[[]];
var gc=[[]];
var pos=[1, 1];
var pp=[8, 8];
var xs=17;
var ys=17;
var ct=0;
var dir=-1;
var xp=0;
var yp=0;
for(var xx=0;xx<xs;xx++){
for(var yy=0;yy<ys;yy++){
grid[xx+1]=[];
grid[xx][yy]=floor(random(0.8, 1.8));
gc[xx+1]=[];
gc[xx][yy]=0;
}
}
grid[7][7]=1;
grid[8][7]=1;
grid[9][7]=1;
grid[7][8]=1;
grid[8][8]=1;
grid[9][8]=1;
grid[7][9]=1;
grid[8][9]=1;
grid[9][9]=1;

draw=function(){
background(255);


if(ct>0){
  ct--;
}

if(ct==0){
  dir=-1;
}


if(dir==0){
  yp=-8*ct;
}
if(dir==1){
  xp=8*ct;
}
if(dir==2){
  yp=8*ct;
}
if(dir==3){
  xp=-8*ct;
}
if(dir==-1){
  xp=0;
  yp=0;
}

for(var xx=pos[0];xx<pos[0]+15;xx++){
for(var yy=pos[1];yy<pos[1]+15;yy++){
stroke(0);
if(grid[xx][yy]<=0){
fill(50);
}
else{
fill(255);
}
rect((xx-pos[0])*40+xp, (yy-pos[1])*40+yp, 40, 40);
if(grid[xx][yy]>1){
textSize(30);
fill(0);
textAlign(CENTER, CENTER);
text(grid[xx][yy]-1, (xx-pos[0])*40+20+xp, (yy-pos[1])*40+25+yp);
}

if(grid[xx][yy]<=0){
fill(50, 10, 10);
stroke(50, 10, 10);
strokeWeight(2);
ellipse((xx-pos[0])*40+20+xp, (yy-pos[1])*40+20+yp, 20, 20);
line((xx-pos[0])*40+5+xp, (yy-pos[1])*40+20+yp, (xx-pos[0])*40+35+xp, (yy-pos[1])*40+20+yp);
line((xx-pos[0])*40+20+xp, (yy-pos[1])*40+5+yp, (xx-pos[0])*40+20+xp, (yy-pos[1])*40+35+yp);
line((xx-pos[0])*40+10+xp, (yy-pos[1])*40+10+yp, (xx-pos[0])*40+30+xp, (yy-pos[1])*40+30+yp);
line((xx-pos[0])*40+30+xp, (yy-pos[1])*40+10+yp, (xx-pos[0])*40+10+xp, (yy-pos[1])*40+30+yp);
}

}
}
for(var xx=pos[0];xx<pos[0]+15;xx++){
for(var yy=pos[1];yy<pos[1]+15;yy++){
if(gc[xx][yy]==0){
fill(200);
stroke(0);
rect((xx-pos[0])*40+xp, (yy-pos[1])*40+yp, 40, 40);
}
}
}
fill(0, 0, 255, 100);
stroke(0, 0, 255, 100);
triangle(pp[0]*40-20, pp[1]*40-((40-sqrt(675))/2), pp[0]*40-5, (pp[1]-1)*40+((40-sqrt(675))/2), pp[0]*40-35, (pp[1]-1)*40+((40-sqrt(675))/2));
fill(0);
noStroke();
rect(pp[0]*40-35, pp[1]*40-42+((40-sqrt(675))/2), 30*(hp/hm), 4);
noFill();
strokeWeight(0.2);
stroke(0);
rect(pp[0]*40-35, pp[1]*40-5, 30, 3);
fill(0, 255, 0, 100);
stroke(0, 255, 0, 100);
if(hr==hc){
hc=hr-1;
if(hp<hm){
hc=0;
hp++;
}
}
rect(pp[0]*40-35, pp[1]*40-5, ((30/hr)*hc), 3);
fill(255);
textSize(15);
if(grid[pos[0]+pp[0]-1][pos[1]+pp[1]-1]==1){
text(hp, pp[0]*40-20, pp[1]*40-23);
}
if(grid[pos[0]+pp[0]-1][pos[1]+pp[1]-1]==0){
hp-=1;
grid[pos[0]+pp[0]-1][pos[1]+pp[1]-1]=-1;
if(hp==0){
d=1;
}
}
if(sho==0){
if(mousePressed&&kk==0&&mouseX>610&&mouseX<690&&mouseY>100&&mouseY<180){
key='w';
}
if(mousePressed&&kk==0&&mouseX>610&&mouseX<690&&mouseY>200&&mouseY<280){
key='s';
}
if(mousePressed&&kk==0&&mouseX>610&&mouseX<690&&mouseY>300&&mouseY<380){
key='a';
}
if(mousePressed&&kk==0&&mouseX>610&&mouseX<690&&mouseY>400&&mouseY<480){
key='d';
}
if(kk==0){
  if(keyCode==37){
    key='a';
  }
  if(keyCode==38){
    key='w';
  }
  if(keyCode==39){
    key='d';
  }
  if(keyCode==40){
    key='s';
  }
}
if(key=='s'&&kk==0){
pp[1]++;
pos[1]++;
pp[1]--;
if(pos[1]+17>ys){
ys++;
for(var xx=0;xx<xs;xx++){
gc[xx][ys-1]=0;
grid[xx][ys-1]=floor(random(1-(ms/100), 2-(ms/100)));
}
}
kk=1;
ct=5;
dir=2;
}

if(key=='w'&&kk==0){
pp[1]--;
pos[1]--;
pp[1]++;
if(pos[1]==0){
pos[1]++;
ys++;
for(var xx=0;xx<xs;xx++){
for(var yy=ys-1;yy>0;yy--){
grid[xx][yy]=grid[xx][yy-1];
gc[xx][yy]=gc[xx][yy-1];
}
gc[xx][0]=0;
grid[xx][0]=floor(random(1-(ms/100), 2-(ms/100)));

}
}
kk=1;
ct=5;
dir=0;
}
if(key=='d'&&kk==0){
pp[0]++;
pos[0]++;
pp[0]--;
if(pos[0]+17>xs){
xs++;
for(var yy=0;yy<ys;yy++){
grid[xs]=[];
grid[xs-1][yy]=floor(random(1-(ms/100), 2-(ms/100)));
gc[xs]=[];
gc[xs-1][yy]=0;
}
}
kk=1;
ct=5;
dir=1;
}

if(key=='a'&&kk==0){
pp[0]--;
pos[0]--;
pp[0]++;
if(pos[0]==0){
pos[0]++;
xs++;
grid[xs]=[];
gc[xs]=[];
for(var xx=xs-1;xx>0;xx--){
for(var yy=0;yy<ys;yy++){

grid[xx][yy]=grid[xx-1][yy];
gc[xx][yy]=gc[xx-1][yy];

}
for(var yy=ys-1;yy>-1;yy--){
grid[0][yy]=floor(random(1-(ms/100), 2-(ms/100)));
gc[0][yy]=0;
}

}
}
kk=1;
ct=5;
dir=3;
}
}
fill(0);
textSize(20);
text("Keys for device users:", 610, -10, 80, 100);
stroke(0);
fill(230);
for(var sq=1;sq<6;sq++){
rect(610, 100*sq, 80, 80);
}
textSize(22);
fill(0);
text("W (up)", 620, 80, 60, 100);
text("S (down)", 615, 180, 70, 100);
text("A (left)", 620, 280, 60, 100);
text("D (right)", 615, 380, 70, 100);
text("E (shop)", 615, 480, 70, 100);
if(mousePressed&&kk==0&&mouseX>50&&mouseX<550&&mouseY>120&&mouseY<170){
kk=1;
ct=5;
if(ch-round((12.5*hm*hm)-(12.5*hm)+75)>=0){
ch-=round((12.5*hm*hm)-(12.5*hm)+75);
hm++;
hp++;
}
}
if(mousePressed&&kk==0&&mouseX>50&&mouseX<550&&mouseY>220&&mouseY<270&&hr!=30){
kk=1;
ct=5;
if(ch-round(((hrn+1)*10)*((hrn+1)*10)/4)>=0){
ch-=round(((hrn+1)*10)*((hrn+1)*10)/4);
hr=round((hr-20)*0.95+20);
hrn++;
}
}
if(mousePressed&&kk==0&&mouseX>50&&mouseX<550&&mouseY>320&&mouseY<370){
kk=1;
ct=5;
if(ch-round((7.5*((mx-0.8)*10)*((mx-0.8)*10))-(7.5*((mx-0.8)*10))+85)>=0){
ch-=round((7.5*((mx-0.8)*10)*((mx-0.8)*10))-(7.5*((mx-0.8)*10))+85);
mx+=0.1;
mx=round(mx*10)/10;
}
}
if(mousePressed&&kk==0&&mouseX>50&&mouseX<550&&mouseY>420&&mouseY<470&&ms!=50){
kk=1;
ct=5;
if(ch-round(60+msn*40)>=0){
ch-=round(60+msn*40);
msn++;
ms=round((100-((100-(ms+42))*0.98)-42)*10)/10;
}
}
if(mousePressed&&kk==0&&mouseX>610&&mouseX<690&&mouseY>500&&mouseY<580){
key='e';
}
if(key=='e'&&kk==0){
if(sho==0){
sho=1;
}
else{
sho=0;
}
kk=1;

}
if(mousePressed){
  kk=1;
}

if(keyPressed==false&&mousePressed==false&&ct==0){
  kk=0;
  key=undefined;
  keyCode=undefined;
}

for(var xx=0;xx<xs;xx++){
for(var yy=0;yy<ys;yy++){
if(grid[xx][yy]>0){
grid[xx][yy]=1;
if(xx>0){
if(grid[xx-1][yy]==0){
grid[xx][yy]++;
}
}
if(xx>0&&yy>0){
if(grid[xx-1][yy-1]==0){
grid[xx][yy]++;
}
}
if(yy>0){
if(grid[xx][yy-1]==0){
grid[xx][yy]++;
}
}
if(xx<xs-1&&yy>0){
if(grid[xx+1][yy-1]==0){
grid[xx][yy]++;
}
}
if(xx<xs-1){
if(grid[xx+1][yy]==0){
grid[xx][yy]++;
}
}
if(xx<xs-1&&yy<ys-1){
if(grid[xx+1][yy+1]==0){
grid[xx][yy]++;
}
}
if(yy<ys-1){
if(grid[xx][yy+1]==0){
grid[xx][yy]++;
}
}
if(yy<ys-1&&xx>0){
if(grid[xx-1][yy+1]==0){
grid[xx][yy]++;
}
}

}
}
}
for(var cnn=0;cnn<cn;cnn++){
fill(0, 0, 0, 255-(ccm[cnn][1]*8));
textSize(15);
text("+$"+ccm[cnn][0], pp[0]*40-ccm[cnn][2], pp[1]*40-40-(ccm[cnn][1]/5));
ccm[cnn][1]++;
if(ccm[cnn][1]==30){
for(var cnf=0;cnf<cn;cnf++){
ccm[cnf][0]=ccm[cnf+1][0];
ccm[cnf][1]=ccm[cnf+1][1];
ccm[cnf][2]=ccm[cnf+1][2];
}
cn--;
}
}
if(cc<ch){
ccm[cn+1]=[];
ccm[cn][0]=ch-cc;
ccm[cn][1]=0;
ccm[cn][2]=random(0, 40);
cn++;
}
cc=ch;
if(gc[pos[0]+pp[0]-1][pos[1]+pp[1]-1]==0){
hc++;
poi++;
ch+=round(mx*(grid[pos[0]+pp[0]-1][pos[1]+pp[1]-1]-1));
}
gc[pos[0]+pp[0]-1][pos[1]+pp[1]-1]=1;
if(d==1){
fill(255, 0, 0);
textSize(80);
text("POINTS: "+poi, 300, 300);

noLoop();
}
fill(0);
if(sho==1){
fill(230, 230, 255, 220);
noStroke();
rect(20, 20, 560, 560); 
fill(0, 0, 180);
textSize(40);
text("$"+ch, 300, 530);
textSize(20);
text("Maximum Tenacity: "+hm+" mines triggered", 300, 100);
text("Regeneration Speed: Every "+hr+" tiles revealed", 300, 200);
text("Money Gains: "+mx+"x tile value", 300, 300);
text("Mine Spawn Rate: "+ms+"% of tiles", 300, 400);
textSize(30);
text("-> "+(hm+1)+" Max Tenacity for: $"+round((12.5*hm*hm)-(12.5*hm)+75), 300, 150);
if(hr!=30){
text("-> "+round((hr-20)*0.95+20)+" Regen Speed for: $"+round(((hrn+1)*10)*((hrn+1)*10)/4), 300, 250);
}
else{
text("MAXIMUM IS EVERY 30 TILES", 300, 250);
}
text("-> "+(round((mx+0.1)*10)/10)+"x Money Gain for: $"+round((7.5*((mx-0.8)*10)*((mx-0.8)*10))-(7.5*((mx-0.8)*10))+85), 300, 350);
if(ms!=50){
text("-> "+(round((100-((100-(ms+42))*0.98)-42)*10)/10)+"% Spawn Rate for: $"+round(60+msn*40), 300, 450);
}
else{
text("MAXIMUM IS 50% SPAWN RATE", 300, 450);
}
fill(255, 0, 0);
textSize(40);
text("POINTS: "+poi, 300, 60);
noFill();
stroke(0);
strokeWeight(3);
rect(50, 120, 500, 50);
rect(50, 220, 500, 50);
rect(50, 320, 500, 50);
rect(50, 420, 500, 50);
}

stroke(0);
strokeWeight(31);
line(15, 15, 580, 15);
line(15, 585, 580, 585);
line(15, 0, 15, 600);
line(585, 0, 585, 600);

}









