int frame = 0;
float multiplier = 0.04;
int numberOfPoints = 100;


void setup() {
	size(640,480);
	strokeWeight(5);
}

void draw() {
	background(255);
	//For tweaking
	int distanceBetweenPointsX = 6;
	int distanceBetweenPointsY = 10;
	int offsetX = 20;
	int offsetY = 240;

	for (int i = 0; i < numberOfPoints; ++i) {
		float x = TWO_PI * i / numberOfPoints *100;
		float y = sin(TWO_PI * i / numberOfPoints + (frame*multiplier)) *100;
		
		point(x + offsetX , y + offsetY);

	}

	offsetY= 190;
	offsetX= 20;
	for (int i = 0; i < numberOfPoints; ++i) {
		float x = i * distanceBetweenPointsX;
		float y = cos(i + (frame*multiplier)) * distanceBetweenPointsY;
		
		point(x + offsetX , y + offsetY);

	}
	frame++;
}
