float multiplier = 0.0010;
float multiplier2 = 0.0010;
void setup() {
	size(640,480);
	strokeWeight(5);
}

void draw() {
	background(255);
	//For tweaking
	float offsetX = 320;
	float offsetY = 240;
	int numberOfPoints = 60;
	multiplier = 0.010;
	

	pointsEvenCircle(offsetX,offsetY,numberOfPoints);
}
void pointsEvenCircle(float offX, float offY,int numberOfPoints)
{
	for (int i = 0; i < numberOfPoints; ++i) {
		
		float animate = frameCount * multiplier;
		float distance = TWO_PI * i /numberOfPoints;
		
		float x = (cos(distance + animate)*(100-(10*multiplier2 % 200)) + offX) ;
		float y = (sin(distance + animate)*(100-(10*multiplier2 % 200)) + offY);
		point(x, y);
		
		multiplier2+=0.0001;
		float colorAnimate = frameCount * multiplier2;
		float red =(cos(distance + colorAnimate)*255);
		float green = (sin(distance + colorAnimate)*255);
		float blue = (-cos(distance + colorAnimate)*255);
		stroke(red, green,blue);
	}
}
