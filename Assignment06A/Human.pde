public class Human extends Character {
	PVector travelVector;
	float distanceTravel;
	public Human () {
		super();
		position = new PVector();
		position.x = random(11, width-11);
		position.y = random(11, height-11);
		
		travelVector = new PVector();
		travelVector.x = 0;
		travelVector.y = 0;
		speed =50;

		velocity = new PVector();
		velocity.x = random(-1, 1);
		velocity.y = random(-1, 1);
		velocity.setMag(speed);
		
		c = color(128 + random(100), 0+ random(25), 128 + random(50));
		radius = 10 + random(5, 10);
	}
	void move()
	{
		if(distanceTravel > 20*speed)
		{
			println("Rotate");
			println(distanceTravel);
			//change direction to head in
			//Can only rotate up to 90 degrees 7 HALF_PI
			velocity.rotate(random(-HALF_PI,HALF_PI));
			//velocity.
			travelVector.x = 0;
			travelVector.y = 0;

		}
		travelVector.add(velocity);
		distanceTravel = travelVector.mag();
		super.move();
	}

}