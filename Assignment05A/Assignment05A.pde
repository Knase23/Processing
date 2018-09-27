
float posY, posX;
float vY = 10, vX = 20, a = 1, tpf, frameTime, time;
PVector sideBall;
void setup() {
	size(512, 512);
	posX = width/2;
	posY = height/2;
	sideBall = new PVector(width/2, height/2);
	frameRate(60);
}

void draw() {
	int currentTime = millis();
	frameTime = currentTime - time;
	frameTime = frameTime * 0.001f;
	

	background(255);

	posY = posY +  (vY * frameTime);
	fill((posY - height/2) %256, 0, 0);
	ellipse(width/2,posY , 10, 10);
	
	
	sideBall.x += (vX * frameTime);

	fill(sideBall.x %256, 0, 0);
	ellipse(sideBall.x, width/2, 10, 10);
	
	
	vY = vY + a;
	vX = vX + a;

	if(posY > height)
	{
		vY = -vY;
		posY = height - 1;
		vY = (vY * 0.98f);
		//println("vY: "+vY);

	}
	if(sideBall.x > width)
	{
		sideBall.x = -10;
		vX = (vX * 0.90f);
		//println("vX: "+vX);

	}
	time = currentTime;
}
