public class Character{
	color c;
	PVector position, velocity;
	int speed;
	float radius = 10;
	public Character()
	{

	}
	public Character (PVector pos, PVector velo) {
		position = pos;
		velocity = velo;

	}
	public void update()
	{
		move();
	}
	public void draw()
	{	fill(c);
		ellipse(position.x, position.y, radius,radius);
	}
	public void move()
	{
		onHitWall();
		position.x += velocity.x * deltaTime;
		position.y += velocity.y * deltaTime;
	}
	private void onHitWall() {
		
		if(position.x > width)
		{
			position.x -= width;
			//velocity.mult(0.8f);

		}
		if(position.x < 0){
			position.x += width;
			//velocity.mult(0.8f);

		}
		if(position.y > height){
			position.y -= height;
			//velocity.mult(0.8f);

		}
		if(position.y < 0){
			position.y += height;
			//velocity.mult(0.8f);

		}
		/*
		if(position.x > width-10 || position.x < 10)
			velocity.x = -velocity.x;
		if(position.y > height-10 || position.x < 10)
			velocity.y = -velocity.y;
		*/
	}
	public void changeVelocity(PVector v)
	{
		velocity = v;
		velocity.setMag(speed);
	}

}