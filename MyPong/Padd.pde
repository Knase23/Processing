public class Padd  {

	public Padd (float startPos, float side) {
		sideX = side;
		position = startPos;
	}
	public float sideX;
	public float position;
	void update()
	{
		fill(255);
		rect(sideX, position, 5, paddSize);
		stroke(255, 255, 255);

	}
	void up()
	{
		if(position>10)
		position -=(frameRate/10);
	}
	void down()
	{
		if(position<370)
		position +=(frameRate/10);
	}

}