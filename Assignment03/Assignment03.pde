float multiplier = 0.04;
int numberOfPoints = 100;


void setup() {
	size(640,480);
	strokeWeight(5);
}

void draw() {
	background(255);
	//For tweaking
	int frequency = 95;
	int amplitude = 95;
	int offsetX = 20;
	int offsetY = 240;
	multiplier = 0.02;

	for (int i = 0; i < numberOfPoints; ++i) {
		float x = TWO_PI * i / numberOfPoints *frequency;
		float y = sin(TWO_PI * i / numberOfPoints + (frameCount*multiplier)) *amplitude;
		stroke(210, 100, 11);
		point(x + offsetX , y + offsetY);
		

	}
	offsetX= 20;
	offsetY= 240;
	
	for (int i = 0; i < numberOfPoints; ++i) {
		float x = TWO_PI * i / numberOfPoints *frequency;
		float y = cos(TWO_PI * i / numberOfPoints + (frameCount*multiplier)) * amplitude;
		
		stroke(0);
		point(x + offsetX , y + offsetY);

	}
}
