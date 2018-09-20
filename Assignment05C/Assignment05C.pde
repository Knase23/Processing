float deltaTime;
float time;
int numberOfPlanets = 10;

Planet[] p = new Planet[numberOfPlanets];
GravityPoint g = new GravityPoint();

void setup() {
	size(600,600);
	for (int i = 0; i < numberOfPlanets; ++i) {
		p[i] = new Planet();
	}
}

void draw() {
	float currentTime = millis();
	deltaTime = currentTime - time;
	deltaTime *= 0.001f;
	background(255);
	for (int i = 0; i < numberOfPlanets; ++i) {
		
		for (int j = 0; j < numberOfPlanets; ++j) {
			if(i != j)
				accelerationBetweenPlanets(p[i], p[j]);	
		}
		g.setAcceleration(p[i]);
		p[i].update();

	}
	g.update();


	time = currentTime;
	
}
public class Planet {
	PVector position, acceleration, velocity;
	float mass;
	color c;
	public Planet () {
		velocity = new PVector(0,0);
		acceleration = new PVector(0,0);
		c = color(random(0,255),random(0,255),random(0,255));
		position = new PVector(random(10, width-10),random(10,height-10));
		mass = 100;
	}
	public void update()
	{
		velocity.add(acceleration);
		move();
		fill(c);
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
		c = color(255,255,255);
	}
	public void update() {
		position.x = mouseX;
		position.y = mouseY;

		
		fill(c);
		ellipse(position.x, position.y, 10, 10);
	}
	public void setAcceleration(Planet planet)
	{
		float distance = planet.position.dist(position);
		PVector diffV = PVector.sub(position,planet.position);

		diffV.div(distance);
		diffV.mult(planet.mass);
		diffV.mult(mass);
		diffV.mult(gravitationalPull);
		diffV.div(distance);
		diffV.div(distance);
		
		planet.acceleration.add(diffV);
		planet.acceleration.mult(0.6f);
	}

}
public void accelerationBetweenPlanets(Planet p1, Planet p2) {
		
		float distance = p1.position.dist(p2.position);
		PVector diffV = PVector.sub(p2.position,p1.position);

		diffV.div(distance);
		diffV.mult(p1.mass);
		diffV.mult(p2.mass);
		diffV.div(distance);
		diffV.div(distance);
		
		p1.acceleration.add(diffV);
		p1.acceleration.mult(0.6f);
		
		p2.acceleration.sub(diffV);
		p2.acceleration.mult(0.6f);
}