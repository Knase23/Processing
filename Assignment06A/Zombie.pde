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
	public Zombie(Character hum)
	{
		speed = 25;
		this.position = hum.position;
		this.velocity = hum.velocity;
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
}