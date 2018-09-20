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
	}
	public void draw() {
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