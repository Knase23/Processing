float deltaTime;
float time;
int numberOfPlanets = 500;
float gravityConstant =4;

Planet[] p = new Planet[numberOfPlanets];
GravityPoint g = new GravityPoint();

void setup() {
	size(1000,1000);
	for (int i = 0; i < numberOfPlanets; ++i) {
		p[i] = new Planet(25,10);
	}
}

void draw() {
	float currentTime = millis();
	deltaTime = currentTime - time;
	deltaTime *= 0.001f;
	background(255);
	for (int i = 0; i < numberOfPlanets; ++i) {
		
		for (int j = 0; j < numberOfPlanets; ++j) {
			if(i != j){
				if(p[i].mass > 0 || p[i].mass > 0 )
				accelerationBetweenPlanets(p[i], p[j]);	
				
				if(p[i].radius > 100)
				{
						p[i].radius = 100;
				}
				if(p[i].radius <= 0)
				{
						p[i].radius = 0;
				}
				if(collision(p[i].position, p[i].radius/2, 
							 p[j].position, p[j].radius/2))
				{

					if(p[i].mass >= p[j].mass)
					{
						p[i].radius += p[j].radius/2;
						p[j].radius -= p[j].radius/2;
						
						p[i].mass += p[j].mass/2;
						p[j].mass -= p[j].mass/2;
					}
									}
			}
		}
		g.setAcceleration(p[i]);
		p[i].update();
	}

	for (int i = 0; i < numberOfPlanets; ++i) {
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
		diffV.mult(gravityConstant);
		diffV.div(distance);
		diffV.div(distance);
		
		p1.acceleration.add(diffV);
		p1.acceleration.mult(0.6f);
		
		p2.acceleration.sub(diffV);
		p2.acceleration.mult(0.6f);
}
public boolean collision(PVector p1, float mass1 ,PVector p2, float mass2)
{

	if(mass1 < 0 || mass2 < 0)
		return false;

	float maxDistance  = mass1 + mass2;

	if(abs(p1.x - p2.x) > maxDistance || abs(p1.y - p2.y) > maxDistance)
	{
		return false;
	} 
	else if (dist(p1.x,p1.y,p2.x,p2.y) > maxDistance) {
		return false;	
	}
	else 
	{
		return true;
	}
}
void mousePressed() {
	g.mass = 1000;
}
void mouseReleased() {
	g.mass = 0;
}
