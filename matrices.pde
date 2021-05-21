//setup
size(600, 600);
textAlign(CENTER, CENTER);

//vars
matrix = [[2, -4, -4], [-2, 7, 7], [1, -5, -4]];
inverse = [[0, 0, 0], [0, 0, 0], [0, 0, 0]];
kPressed = false;
toggle=true;
undef=true;
det=0;
//functions
var inverseSolve=function(){
	/*
			a  b  c
			d  e  f
			g  h  i

			Transposed:

			a  d  g
			b  e  h
			c  f  i
	*/
	var a = matrix[0][0];
	var b = matrix[1][0];
	var c = matrix[2][0];
	var d = matrix[0][1];
	var e = matrix[1][1];
	var f = matrix[2][1];
	var g = matrix[0][2];
	var h = matrix[1][2];
	var i = matrix[2][2];



	det = a*(e*i-h*f)-b*(d*i-g*f)+c*(d*h-g*e);
	fill(255, 0, 0);
	if(det==0){
		undef=true;
	}else{
		undef=false;
		inverse[0][0]=(e*i-f*h);
		inverse[1][0]=-(b*i-c*h);
		inverse[2][0]=(b*f-c*e);
		inverse[0][1]=-(d*i-f*g);
		inverse[1][1]=(a*i-c*g);
		inverse[2][1]=-(a*f-c*d);
		inverse[0][2]=(d*h-e*g);
		inverse[1][2]=-(a*h-b*g);
		inverse[2][2]=(a*e-b*d);			
	}
}
inverseSolve();
//loop
draw = function(){
	if(toggle){
		background(120);
	}else{
		background(180);
	}
	//brackets
	fill(0);
	noStroke();
	rect(60, 100, 40, 400);
	rect(500, 100, 40, 400);
	quad(60, 100, 120, 60, 160, 60, 100, 100);
	quad(60, 500, 120, 540, 160, 540, 100, 500);
	quad(540, 100, 480, 60, 440, 60, 500, 100);
	quad(540, 500, 480, 540, 440, 540, 500, 500);
	//numbers
	fill(50, 170, 255);
	noStroke();
	for(i=0;i<3;i++){
		for(j=0;j<3;j++){
			textSize(80);
			if(toggle){				
				text(matrix[i][j], i*120+180, j*120+180);
			}else{
				if(undef){
					text("No inverse", 300, 300);
					i=3;
					j=3;
				}else{
					textSize(40);
					text(inverse[i][j], i*120+180, j*120+155);
					text(det, i*120+180, j*120+205)
					rect(i*120+140, j*120+178, 80, 4);
				}
			}
		}
	}
	if(keyPressed&&!kPressed&&(key=='r'||key=='R')){
		kPressed=true;
		key=undefined;
		for(i=0;i<3;i++){
			for(j=0;j<3;j++){
				matrix[i][j]=round(random(-0.5, 9.5));
			}
		}
		inverseSolve();
		
	}
	if(keyPressed&&!kPressed&&(key=='i'||key=='I')){
		kPressed=true;
		key=undefined;
		if(toggle){
			toggle=false;
		}else{
			toggle=true;
		}
	}
	if(!keyPressed){
		kPressed=false;
	}
}