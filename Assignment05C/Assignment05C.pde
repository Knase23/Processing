float deltaTime;
float time;
Planet p = new Planet();
GravityPoint g = new GravityPoint();

void setup() {
	size(600,600);
}

void draw() {
	float currentTime = millis();
	deltaTime = currentTime - time;
	deltaTime *= 0.001f;
	background(255);

	p.update(g);
	g.update();


	time = currentTime;
	
}
public class Planet {
	PVector position, acceleration, velocity;
	float mass;
	color c;
	public Planet () {
		velocity = new PVector(1,10);
		acceleration = new PVector(0,0);
		c = color(random(255),random(255),random(255));
		position = new PVector(200,250);
		mass = 10;
	}
	public void update(GravityPoint gravPull)
	{
		float distance = position.dist(gravPull.position);
		PVector diffV = PVector.sub(gravPull.position,position);

		diffV.div(distance);
		diffV.mult(mass);
		diffV.mult(gravPull.mass);
		diffV.div(distance);
		diffV.div(distance);
		acceleration.add(diffV);
		acceleration.mult(0.6f);

		velocity.add(acceleration);
		move();
		ellipse(position.x, position.y, 10, 10);

		if(position.x > width)
		{
			position.x -= width;
			velocity.mult(0.8f);

		}
		if(position.x < 0){
			position.x += width;
			velocity.mult(0.8f);

		}
		if(position.y > height){
			position.y -= height;
			velocity.mult(0.8f);

		}
		if(position.y < 0){
			position.y += height;
			velocity.mult(0.8f);

		}


	}
	private void move() {
		position.x += (velocity.x * deltaTime);
		position.y += (velocity.y * deltaTime);	
	}

}

public class GravityPoint {
	PVector position;
	float gravitationalPull, mass;
	color c;
	public GravityPoint () {
		position = new PVector(300,300);
		gravitationalPull = 1.5;
		mass = 100;
		c = color(0,0,0);
	}
	public float gravFalloff(PVector affectedObject, float mass) {
		
		float distance = position.dist(affectedObject);
		float r2 = pow(distance, 2);
		return gravitationalPull * ((this.mass * mass)/r2);
	}
	public void update() {
		position.x = mouseX;
		position.y = mouseY;

		stroke(c);
		ellipse(position.x, position.y, 10, 10);
	}

}