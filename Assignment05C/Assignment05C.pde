float deltaTime;
float time;
int numberOfPlanets = 3;
float gravityConstant =1;

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
		/*
		for (int j = 0; j < numberOfPlanets; ++j) {
			if(i != j){
				
				if(p[i].mass > 0 || p[i].mass > 0 ){
					accelerationBetweenPlanets(p[i], p[j]);	
				}
				
				
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
		}*/
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


void mousePressed() {
	g.mass = 100;
}
void mouseReleased() {
	g.mass = 0;
}
