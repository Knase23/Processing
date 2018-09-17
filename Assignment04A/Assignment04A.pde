
void setup() {
	size(640,640);
	background(255);	
}
PVector circle = new PVector(320, 320);
PVector diri = new PVector(0,0);
PVector speed = new PVector(1,1);
void draw() {
	background(255);
	
	if(focused)
	{
		
		float procentOfMagnitude = 0.05;
		diri.x = mouseX - circle.x;
		diri.y = mouseY - circle.y;

		float magnitude = diri.mag();
		diri.normalize();
		
		//println("magnitude: "+  magnitude);
		if(magnitude > 1)
		{	
			speed.x = 1 * magnitude * procentOfMagnitude;
			speed.y = 1 * magnitude * procentOfMagnitude;
		}
		else {
			speed.x = 0;
			speed.y = 0;
		}

	}	

	circle.x += (diri.x * speed.x);
	circle.y += (diri.y * speed.y);
	ellipse(circle.x, circle.y, 50, 50);

}