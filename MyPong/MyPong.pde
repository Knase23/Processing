Padd player1 = new Padd(height/2,20 );
Padd player2 = new Padd(height/2,620);
Ball ball = new Ball(width/2,height/2);
Controller contr = new Controller();
ScoreSystem scores = new ScoreSystem();
int paddSize = 100;

void setup()
{
	size(640, 480);
	background(0);
}

void draw()
{
	background(0);
	if(focused)
	{
	player1.update();
	player2.update();
	ball.update();
	ball.collide(player1,player2);
	scores.update(ball);
	contr.update(player1,player2);
	}
}
