public class Ball{

	public Ball (float x, float y) {
		position.x = x;
		position.y = y;
	}
	PVector direction = new PVector(1,1), position = new PVector(width/2,height/2);
	float speed = 1.450, aceleration = 0.20;
	int radius = 10;
	public boolean collide(Padd leftPadd, Padd rightPadd)
	{
		if(position.y < 10 || position.y > height - 10)
		{
			direction.y *= -1;
			
		}
		if(position.x <= leftPadd.sideX + 10)
		{
			println("Check leftPadd if collide");
			if (position.y > leftPadd.position && position.y < leftPadd.position + paddSize) {
				direction.x *= -1;
				speed += aceleration;
				aceleration += 0.01;
			}
		}
		if(position.x >= rightPadd.sideX)
		{
			println("Check rightPadd if collide");
			if (position.y > rightPadd.position && position.y < rightPadd.position + paddSize) {
				direction.x *= -1;	
				speed += aceleration;
				aceleration += 0.01;		
			}
		}
			

		return true;
	}
	private void CheckPaddCollide(Padd padd) {
		
	}
	void update()
	{
		position.x += direction.x * speed;
		position.y += direction.y * speed;
		ellipse(position.x, position.y, radius, radius);
	}
	void resetSpeed()
	{
		speed = 1.000;
		aceleration = 0.50;
	}

}