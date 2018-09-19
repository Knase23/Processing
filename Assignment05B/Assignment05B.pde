float deltaTime;
float time;
int numberOfBalls = 1000;
Ball[] balls = new Ball[numberOfBalls];
void setup() {
	size(512, 512);
	frameRate(60);
	for (int i = 0; i < numberOfBalls; ++i) {
		balls[i] = new Ball();
	}
}

void draw() {
	int currentTime = millis();
	deltaTime = currentTime - time;
	deltaTime *= 0.001f;
	
	if (focused) {
		background(255);
		for (int i = 0; i < numberOfBalls; ++i) {
		balls[i].update();
		}	
	}
	

	time = currentTime;
}

public class Ball {
	PVector position, direction;
	float velocity, acceleration;
	color c;
	public Ball () {
		position = new PVector(width/2,height/2);
		c = color(random(0, 255), random(0, 255), random(0, 255));
		direction = new PVector(random(-1.0, 1.0),random(-1.0, 1.0));
		//direction.normalize();
		velocity = 5;
		acceleration = 1.0;
	}

	public void update() {
		this.move();
		velocity += acceleration;
		
		fill(c);
		ellipse(position.x, position.y, 10, 10);		
		
		if(position.dist(new PVector(width/2,height/2)) > 200)
		{
			this.changeDirection();
			this.move();
			velocity *= 0.76f;
		}

	}
	private void changeDirection() {
	 	direction.x = -direction.x;
	 	direction.y = -direction.y;
	}
	private void move() {
		position.x += direction.x*(velocity * deltaTime);
		position.y += direction.y*(velocity * deltaTime);
		
	}
}

