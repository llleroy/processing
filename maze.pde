var s=1;
var sr=[];
var ed=[];
var sta=[];
var anm=0;
var ann=0;
var vr=1;
var p=[0, 0];
var st=0;
var b=0;
var mx=30;
var my=30;
var mh=[[]];
var mv=[[]];
var ar=[[]];
var as=0;
ar[as+1]=[];
ar[as][0]=0;
ar[as][1]=0;
ar[as][2]=mx;
ar[as][3]=my;
as++;
for(var xm=0;xm<mx;xm++){
mh[xm+1]=[];
for(var ym=0;ym<my+1;ym++){
if(ym==0||ym==my){
mh[xm][ym]=1;
}
else{
mh[xm][ym]=0;
}
}
}

for(var ym=0;ym<my;ym++){
mv[ym+1]=[];
for(var xm=0;xm<mx+1;xm++){
if(xm==0||xm==mx){
mv[ym][xm]=1;
}
else{
mv[ym][xm]=0;
}
}
}
for(;as>0;){
var rg=round(random(0.5,5.5));
var rx=round(ar[as-1][0]+(ar[as-1][2]/2))+(floor(random(0, ar[as-1][2]/3))*(round(random(0.5, 2.5))-1.5)*2);
var ry=round(ar[as-1][1]+(ar[as-1][3]/2))+(floor(random(0, ar[as-1][3]/3))*(round(random(0.5, 2.5))-1.5)*2);
for(var ym=ar[as-1][1];ym<ar[as-1][1]+ar[as-1][3];ym++){
mv[ym][rx]=1;
}
for(var xm=ar[as-1][0];xm<ar[as-1][0]+ar[as-1][2];xm++){
mh[xm][ry]=1;
}
if(rg!=1){
if(ar[as-1][1]+0.5==ry-0.5){
mv[ry-1][rx]=0;
}
else{
mv[round(random(ar[as-1][1]+0.5, ry-0.5))][rx]=0;
}
}
if(rg!=2){
if(ar[as-1][1]+ar[as-1][3]-0.5==ry+0.5){
mv[ry][rx]=0;
}
else{
mv[round(random(ry+0.5, ar[as-1][1]+ar[as-1][3]-0.5))][rx]=0;
}
}
if(rg!=3){
if(ar[as-1][0]+0.5==rx-0.5){
mh[rx-1][ry]=0;
}
else{
mh[round(random(ar[as-1][0]+0.5, rx-0.5))][ry]=0;
}
}
if(rg!=4){
if(ar[as-1][0]+ar[as-1][2]-0.5==rx+0.5){
mh[rx][ry]=0;
}
else{
mh[round(random(rx+0.5, ar[as-1][0]+ar[as-1][2]-0.5))][ry]=0;
}
}
var x=ar[as-1][0];
var y=ar[as-1][1];
var xs=ar[as-1][2];
var ys=ar[as-1][3];
as--;
if(rx-x>=2&&ry-y>=2){
ar[as+1]=[];
ar[as][0]=x;
ar[as][1]=y;
ar[as][2]=rx-x;
ar[as][3]=ry-y;
as++;
}
if(xs+x-rx>=2&&ry-y>=2){
ar[as+1]=[];
ar[as][0]=rx;
ar[as][1]=y;
ar[as][2]=xs+x-rx;
ar[as][3]=ry-y;
as++;
}
if(rx-x>=2&&ys+y-ry>=2){
ar[as+1]=[];
ar[as][0]=x;
ar[as][1]=ry;
ar[as][2]=rx-x;
ar[as][3]=ys+y-ry;
as++;
}
if(xs+x-rx>=2&&ys+y-ry>=2){
ar[as+1]=[];
ar[as][0]=rx;
ar[as][1]=ry;
ar[as][2]=xs+x-rx;
ar[as][3]=ys+y-ry;
as++;
}
}
textAlign(CENTER, CENTER);
size(900, 900);
draw=function(){
if(st==0){
if(s<900){
s+=5;
}
background(255);
strokeWeight(55-(s/20));
stroke(0);
for(var xm=0;xm<mx+1;xm++){
for(var ym=0;ym<my+1;ym++){
if(mh[xm][ym]==1){
line(xm*(900/mx)+450-(s/2), ym*(900/my)+450-(s/2), (xm+1)*(900/mx)+450-(s/2), ym*(900/my)+450-(s/2));
line(xm*(900/mx)-450+(s/2), ym*(900/my)-450+(s/2), (xm+1)*(900/mx)-450+(s/2), ym*(900/my)-450+(s/2));
line(xm*(900/mx)+450-(s/2), ym*(900/my)-450+(s/2), (xm+1)*(900/mx)+450-(s/2), ym*(900/my)-450+(s/2));
line(xm*(900/mx)-450+(s/2), ym*(900/my)+450-(s/2), (xm+1)*(900/mx)-450+(s/2), ym*(900/my)+450-(s/2));
}
if(mv[ym][xm]==1){
line(xm*(900/mx)-450+(s/2), ym*(900/my)-450+(s/2), xm*(900/mx)-450+(s/2), (ym+1)*(900/my)-450+(s/2));
line(xm*(900/mx)+450-(s/2), ym*(900/my)+450-(s/2), xm*(900/mx)+450-(s/2), (ym+1)*(900/my)+450-(s/2));
line(xm*(900/mx)+450-(s/2), ym*(900/my)-450+(s/2), xm*(900/mx)+450-(s/2), (ym+1)*(900/my)-450+(s/2));
line(xm*(900/mx)-450+(s/2), ym*(900/my)+450-(s/2), xm*(900/mx)-450+(s/2), (ym+1)*(900/my)+450-(s/2));
}
}
}
if(s>900){
fill(200, 0, 200);
textSize(180);
text("TO BEGIN CLICK SCREEN", 0, -300, 900, 1400);
}
if(mousePressed){
st=1;
mx=my=10;
mh=[[]];
mv=[[]];
ar=[[]];
as=0;
ar[as+1]=[];
ar[as][0]=0;
ar[as][1]=0;
ar[as][2]=mx;
ar[as][3]=my;
as++;
for(var xm=0;xm<mx;xm++){
mh[xm+1]=[];
for(var ym=0;ym<my+1;ym++){
if(ym==0||ym==my){
mh[xm][ym]=1;
}
else{
mh[xm][ym]=0;
}
}
}

for(var ym=0;ym<my;ym++){
mv[ym+1]=[];
for(var xm=0;xm<mx+1;xm++){
if(xm==0||xm==mx){
mv[ym][xm]=1;
}
else{
mv[ym][xm]=0;
}
}
}
for(;as>0;){
var rg=round(random(0.5,5.5));
var rx=round(ar[as-1][0]+(ar[as-1][2]/2))+(floor(random(0, ar[as-1][2]/3))*(round(random(0.5, 2.5))-1.5)*2);
var ry=round(ar[as-1][1]+(ar[as-1][3]/2))+(floor(random(0, ar[as-1][3]/3))*(round(random(0.5, 2.5))-1.5)*2);
for(var ym=ar[as-1][1];ym<ar[as-1][1]+ar[as-1][3];ym++){
mv[ym][rx]=1;
}
for(var xm=ar[as-1][0];xm<ar[as-1][0]+ar[as-1][2];xm++){
mh[xm][ry]=1;
}
if(rg!=1){
if(ar[as-1][1]+0.5==ry-0.5){
mv[ry-1][rx]=0;
}
else{
mv[round(random(ar[as-1][1]+0.5, ry-0.5))][rx]=0;
}
}
if(rg!=2){
if(ar[as-1][1]+ar[as-1][3]-0.5==ry+0.5){
mv[ry][rx]=0;
}
else{
mv[round(random(ry+0.5, ar[as-1][1]+ar[as-1][3]-0.5))][rx]=0;
}
}
if(rg!=3){
if(ar[as-1][0]+0.5==rx-0.5){
mh[rx-1][ry]=0;
}
else{
mh[round(random(ar[as-1][0]+0.5, rx-0.5))][ry]=0;
}
}
if(rg!=4){
if(ar[as-1][0]+ar[as-1][2]-0.5==rx+0.5){
mh[rx][ry]=0;
}
else{
mh[round(random(rx+0.5, ar[as-1][0]+ar[as-1][2]-0.5))][ry]=0;
}
}
var x=ar[as-1][0];
var y=ar[as-1][1];
var xs=ar[as-1][2];
var ys=ar[as-1][3];
as--;
if(rx-x>=2&&ry-y>=2){
ar[as+1]=[];
ar[as][0]=x;
ar[as][1]=y;
ar[as][2]=rx-x;
ar[as][3]=ry-y;
as++;
}
if(xs+x-rx>=2&&ry-y>=2){
ar[as+1]=[];
ar[as][0]=rx;
ar[as][1]=y;
ar[as][2]=xs+x-rx;
ar[as][3]=ry-y;
as++;
}
if(rx-x>=2&&ys+y-ry>=2){
ar[as+1]=[];
ar[as][0]=x;
ar[as][1]=ry;
ar[as][2]=rx-x;
ar[as][3]=ys+y-ry;
as++;
}
if(xs+x-rx>=2&&ys+y-ry>=2){
ar[as+1]=[];
ar[as][0]=rx;
ar[as][1]=ry;
ar[as][2]=xs+x-rx;
ar[as][3]=ys+y-ry;
as++;
}
}
sr[0]=round(random(-0.5, mx-0.5));
sr[1]=round(random(-0.5, my-0.5));
p[0]=sr[0];
p[1]=sr[1];
ed[0]=round(random(-0.5, mx-0.5));
ed[1]=round(random(-0.5, my-0.5));
for(var dc=0;dc==0;){
if(abs(ed[0]-sr[0])+abs(ed[1]-sr[1])<mx-1){
ed[0]=round(random(-0.5, mx-0.5));
ed[1]=round(random(-0.5, my-0.5));
}
else{
dc=1;
}
}
if(random(0, vr)<1){
sta[0]=round(random(-0.5, mx-0.5));
sta[1]=round(random(-0.5, my-0.5));
}

}
}
if(st==1){
background(49);
strokeWeight(90/vr);
stroke(0);
var xx=0;
var yy=0;
if(anm==1){yy=-ann;}
if(anm==2){yy=ann;}
if(anm==3){xx=-ann;}
if(anm==4){xx=ann;}
for(var xm=p[0]-vr;xm<p[0]+2+vr;xm++){
for(var ym=p[1]-vr;ym<p[1]+2+vr;ym++){
if(sr[0]==xm&&sr[1]==ym){stroke(0, 0, 255);fill(0, 0, 255);ellipse(xx+200+500/((vr*4)-2)+(500/((2*vr)-1))*(xm-(p[0]-vr+1)), yy+200+500/((vr*4)-2)+(500/((2*vr)-1))*(ym-(p[1]-vr+1)), (500/((2*vr)-1))/2.8, (500/((2*vr)-1))/2.8);stroke(0);}
if(ed[0]==xm&&ed[1]==ym){stroke(0, 255, 0);fill(0, 255, 0);ellipse(xx+200+500/((vr*4)-2)+(500/((2*vr)-1))*(xm-(p[0]-vr+1)), yy+200+500/((vr*4)-2)+(500/((2*vr)-1))*(ym-(p[1]-vr+1)), (500/((2*vr)-1))/2.8, (500/((2*vr)-1))/2.8);stroke(0);}
if(sta[0]==xm&&sta[1]==ym){stroke(255, 255, 0);fill(255, 255, 0);ellipse(xx+200+500/((vr*4)-2)+(500/((2*vr)-1))*(xm-(p[0]-vr+1)), yy+200+500/((vr*4)-2)+(500/((2*vr)-1))*(ym-(p[1]-vr+1)), (500/((2*vr)-1))/2.8, (500/((2*vr)-1))/2.8);stroke(0);}
if(xm>=0&&ym>=0&&xm<=mx&&ym<=my){
if(mh[xm][ym]==1){
line(xx+200+(500/((2*vr)-1))*(xm-(p[0]-vr+1)), yy+200+(500/((2*vr)-1))*(ym-(p[1]-vr+1)), xx+200+(500/((2*vr)-1))*(xm+1-(p[0]-vr+1)), yy+200+(500/((2*vr)-1))*(ym-(p[1]-vr+1)));
}
if(mv[ym][xm]==1){
line(xx+200+(500/((2*vr)-1))*(xm-(p[0]-vr+1)), yy+200+(500/((2*vr)-1))*(ym-(p[1]-vr+1)), xx+200+(500/((2*vr)-1))*(xm-(p[0]-vr+1)), yy+200+(500/((2*vr)-1))*(ym+1-(p[1]-vr+1)));
}
}
else{
fill(39);
noStroke();
rect(xx+200+(500/((2*vr)-1))*(xm-(p[0]-vr+1))-1, yy+200+(500/((2*vr)-1))*(ym-(p[1]-vr+1))-1, (500/((2*vr)-1))+2, (500/((2*vr)-1))+2);
strokeWeight(90/vr);
stroke(0);
}
if((xm==mx&&ym>-2&&ym<my+1)||(ym==my&&xm>-2&&xm<mx+1)||(xm==-1&&ym>-2&&ym<my+1)||(ym==-1&&xm>-2&&xm<mx+1)){

fill(0);
noStroke();
rect(xx+200+(500/((2*vr)-1))*(xm-(p[0]-vr+1))-1, yy+200+(500/((2*vr)-1))*(ym-(p[1]-vr+1))-1, (500/((2*vr)-1))+2, (500/((2*vr)-1))+2);
strokeWeight(90/vr);
stroke(0);

}
}
}

noFill();

for(var d=0;d<20;d++){
strokeWeight((300-d*12)+random(-1, 1));
stroke(d*2+random( 1), d*2+random(1), d*2+random(1), 80);
if(sta[0]!=undefined){stroke(d*2+random(19, 20), d*2+random(19, 20), d*2+random(1), 80);}
ellipse(450, 450, 1000-d*24, 1000-d*24);
}
fill(255, 0, 0);
noStroke();
ellipse(450, 450, (500/((vr*2)-1))/3, (500/((vr*2)-1))/3);
fill(255);
rect(420, 100, 60, 60);
rect(740, 420, 60, 60);
rect(420, 740, 60, 60);
rect(100, 420, 60, 60);
textSize(30);
text("Frames per second: "+round(frameRate), 200, 50);
text("Level: "+(mx-9), 750, 50);
text("Vision: "+vr+" squares radius", 450, 870);
fill(0);
text("W", 450, 135);
text("D", 770, 455);
text("S", 450, 775);
text("A", 130, 455);

/*
if(mousePressed&&kk==0){
  if(mouseX>420&&mouseX<480&&mouseY>100&&mouseY<160){
  key='w';
  keyPressed=true;
  }
  if(mouseX>420&&mouseX<480&&mouseY>740&&mouseY<800){
  key='s';
  keyPressed=true;
  }
  if(mouseX>100&&mouseX<160&&mouseY>420&&mouseY<480){
  key='a';
  keyPressed=true;
  }
  if(mouseX>740&&mouseX<800&&mouseY>420&&mouseY<480){
  key='d';
  keyPressed=true;
  }
}
*/

if(keyPressed&&kk==0){

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
  

if(key=='w'&&mh[p[0]][p[1]]!=1){
p[1]--;
anm=1;
ann=500/((vr*2)-1);
kk=1;
}
if(key=='s'&&mh[p[0]][p[1]+1]!=1){
p[1]++;
anm=2;
ann=500/((vr*2)-1);
kk=1;
}
if(key=='a'&&mv[p[1]][p[0]]!=1){
p[0]--;
anm=3;
ann=500/((vr*2)-1);
kk=1;
}
if(key=='d'&&mv[p[1]][p[0]+1]!=1){
p[0]++;
anm=4;
ann=500/((vr*2)-1);
kk=1;
}
}
if(anm==0){
kk=0;
keyPressed=false;
keyCode=undefined;
}
if(ann>0){
ann-=(500/((vr*2)-1))/(20/sqrt(vr));
}
else{
ann=0;
anm=0;
}


if(p[0]==ed[0]&&p[1]==ed[1]&&anm==0){
mx++;
my++;
mh=[[]];
mv=[[]];
ar=[[]];
as=0;
ar[as+1]=[];
ar[as][0]=0;
ar[as][1]=0;
ar[as][2]=mx;
ar[as][3]=my;
as++;
for(var xm=0;xm<mx;xm++){
mh[xm+1]=[];
for(var ym=0;ym<my+1;ym++){
if(ym==0||ym==my){
mh[xm][ym]=1;
}
else{
mh[xm][ym]=0;
}
}
}

for(var ym=0;ym<my;ym++){
mv[ym+1]=[];
for(var xm=0;xm<mx+1;xm++){
if(xm==0||xm==mx){
mv[ym][xm]=1;
}
else{
mv[ym][xm]=0;
}
}
}
for(;as>0;){
var rg=round(random(0.5,5.5));
var rx=round(ar[as-1][0]+(ar[as-1][2]/2))+(floor(random(0, ar[as-1][2]/3))*(round(random(0.5, 2.5))-1.5)*2);
var ry=round(ar[as-1][1]+(ar[as-1][3]/2))+(floor(random(0, ar[as-1][3]/3))*(round(random(0.5, 2.5))-1.5)*2);
for(var ym=ar[as-1][1];ym<ar[as-1][1]+ar[as-1][3];ym++){
mv[ym][rx]=1;
}
for(var xm=ar[as-1][0];xm<ar[as-1][0]+ar[as-1][2];xm++){
mh[xm][ry]=1;
}
if(rg!=1){
if(ar[as-1][1]+0.5==ry-0.5){
mv[ry-1][rx]=0;
}
else{
mv[round(random(ar[as-1][1]+0.5, ry-0.5))][rx]=0;
}
}
if(rg!=2){
if(ar[as-1][1]+ar[as-1][3]-0.5==ry+0.5){
mv[ry][rx]=0;
}
else{
mv[round(random(ry+0.5, ar[as-1][1]+ar[as-1][3]-0.5))][rx]=0;
}
}
if(rg!=3){
if(ar[as-1][0]+0.5==rx-0.5){
mh[rx-1][ry]=0;
}
else{
mh[round(random(ar[as-1][0]+0.5, rx-0.5))][ry]=0;
}
}
if(rg!=4){
if(ar[as-1][0]+ar[as-1][2]-0.5==rx+0.5){
mh[rx][ry]=0;
}
else{
mh[round(random(rx+0.5, ar[as-1][0]+ar[as-1][2]-0.5))][ry]=0;
}
}
var x=ar[as-1][0];
var y=ar[as-1][1];
var xs=ar[as-1][2];
var ys=ar[as-1][3];
as--;
if(rx-x>=2&&ry-y>=2){
ar[as+1]=[];
ar[as][0]=x;
ar[as][1]=y;
ar[as][2]=rx-x;
ar[as][3]=ry-y;
as++;
}
if(xs+x-rx>=2&&ry-y>=2){
ar[as+1]=[];
ar[as][0]=rx;
ar[as][1]=y;
ar[as][2]=xs+x-rx;
ar[as][3]=ry-y;
as++;
}
if(rx-x>=2&&ys+y-ry>=2){
ar[as+1]=[];
ar[as][0]=x;
ar[as][1]=ry;
ar[as][2]=rx-x;
ar[as][3]=ys+y-ry;
as++;
}
if(xs+x-rx>=2&&ys+y-ry>=2){
ar[as+1]=[];
ar[as][0]=rx;
ar[as][1]=ry;
ar[as][2]=xs+x-rx;
ar[as][3]=ys+y-ry;
as++;
}
}
sr[0]=round(random(-0.5, mx-0.5));
sr[1]=round(random(-0.5, my-0.5));
p[0]=sr[0];
p[1]=sr[1];
ed[0]=round(random(-0.5, mx-0.5));
ed[1]=round(random(-0.5, my-0.5));
for(var dc=0;dc==0;){
if(abs(ed[0]-sr[0])+abs(ed[1]-sr[1])<mx-1){
ed[0]=round(random(-0.5, mx-0.5));
ed[1]=round(random(-0.5, my-0.5));
}
else{
dc=1;
}
}
if(random(0, vr)<1){
sta[0]=round(random(-0.5, mx-0.5));
sta[1]=round(random(-0.5, my-0.5));
}

}
if(sta[0]==p[0]&&sta[1]==p[1]&&anm==0){
vr++;
sta[0]=undefined;
sta[1]=undefined;
}
}
}







