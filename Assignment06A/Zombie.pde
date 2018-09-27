public class Zombie extends Character {

	public Zombie () {
		super();
		position = new PVector();
		position.x = random(11, width-11);
		position.y = random(11, height-11);

		speed = 25;

		velocity = new PVector();
		velocity.x = random(-1, 1);
		velocity.y = random(-1, 1);
		velocity.setMag(speed);
		radius = 10;
		
		c = color(0, 128, 0);	
	}
	public Zombie(Character human)
	{
		speed = 25;
		this.position = human.position;
		this.velocity = human.velocity;
		this.velocity.setMag(speed);
		c = color(0, 128, 0);
		radius = 10;
	}
	public void update()
	{
		super.update();
	}
	public void move(PVector target) {
		super.move();
	}
	public void draw() {
		super.draw();

		createArm("Left");
		createArm("Right");
		
		
	}
	private void createArm(String leftOrRight) {
		
		PVector arm = new PVector();
		arm.x = velocity.x;
		arm.y = velocity.y;
		

		if(leftOrRight == "Left")
			arm.rotate(HALF_PI);
		
		if(leftOrRight == "Right")
			arm.rotate(-HALF_PI);
		
		arm.setMag(radius/2);
		//
		PVector hand = new PVector();
		hand.x = velocity.x;
		hand.y = velocity.y;
		hand.setMag(radius);
		hand.add(arm);

		line(position.x + arm.x, position.y + arm.y, position.x + hand.x, position.y + hand.y );


		
	}
}