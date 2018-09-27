float deltaTime;
float time;

CharacterManager cm;
void setup() {
	size(640,640);
	cm = new CharacterManager(100);
}

void draw() {
	float currentTime = millis();
	deltaTime = currentTime - time;
	deltaTime *= 0.001f;
	if(!cm.gameOver())
	{
		background(255, 255, 255);
		cm.update();
		cm.draw();
	} else {
		background(255, 255, 255);
		cm.displayScore();
	}
	time = currentTime;
}

