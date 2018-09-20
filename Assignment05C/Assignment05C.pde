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
		p[i].draw();
	}
	g.update();
	g.draw();


	time = currentTime;
	
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