public class ScoreSystem  {
	int player1Score = 0, player2Score = 0, transparent = 255;
	PVector textPosition = new PVector(width,50);
	public ScoreSystem () {
	}
	public void update(Ball ball)
	{

		if(transparent > 0 && frameCount % 1 == 0)
		{
			transparent -= 1;
			println("Reduce transparent");
		}
		
		textSize(32);
		fill(255, transparent);
		text("Player1: "+ player1Score, textPosition.x,textPosition.y);
		fill(255, transparent);
		text("Player2: "+ player2Score, textPosition.x + 200,textPosition.y);

		if(ball.position.x < 5)
		{
			player2Score += 1;
			ball.position = new PVector(width/2,height/2);
			ball.resetSpeed();
			println("Player1: "+ player1Score);
			println("Player2: "+ player2Score);
			transparent = 255;

		}
		if(ball.position.x > width - 5)
		{
			player1Score += 1;
			ball.position = new PVector(width/2,height/2);
			ball.resetSpeed();
			println("Player1: "+ player1Score);
			println("Player2: "+ player2Score);
			transparent = 255;
			ball.resetSpeed();

		}
	}

}