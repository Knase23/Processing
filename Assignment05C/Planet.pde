public class Planet {
	PVector position, acceleration, velocity;
	float mass;
	int radius;
	float startMass;
	color c;
	public Planet (float planetMass, int startRadius) {
		position = new PVector();
		position.x = random(10, width-10);
		position.y = random(10,height-10);

		velocity = new PVector(0,0);
		acceleration = new PVector(0,0);
		mass = planetMass;
		radius = startRadius;
		startMass = planetMass;
		
		c = color(random(0,255),random(0,255),random(0,255));
	}
	public Planet (float planetMass, int startRadius,float x, float y) {
		position = new PVector(x,y);
		velocity = new PVector(0,0);
		acceleration = new PVector(0,0);
		mass = 10;
		radius = 10;
		c = color(random(0,255),random(0,255),random(0,255));
	}
	public void update()
	{
		velocity.add(acceleration);
		move();
		moveIfOusideOfScreen();
	}

	public void draw() {
		fill(c);
		ellipse(position.x, position.y, radius, radius);
		fill(255);
		text(""+round(mass/startMass), position.x, position.y, (float)radius, (float)radius);
	}
	private void move() {
		if(velocity.mag() > 100)
			velocity.setMag(100);

		position.x += (velocity.x * deltaTime);
		position.y += (velocity.y * deltaTime);	
	}
	private void moveIfOusideOfScreen()
	{
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

}