int frame = 0;
float multiplier = 0.04;
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
	frame++;
}
void pointsEvenCircle(float offX, float offY,int numberOfPoints)
{
	for (int i = 0; i < numberOfPoints; ++i) {
		float animate = frame * multiplier;
		float distance = TWO_PI * i /numberOfPoints;
		float x = (cos(distance + animate)*100) + offX;
		float y = (sin(distance + animate)*100) + offY;
		point(x, y);
		stroke((sin(distance +animate)*255) %256, (cos(distance +animate)*255)%256, (-sin(distance +animate)*255)%256);
	}
}
