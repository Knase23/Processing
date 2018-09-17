Padd player1 = new Padd(height/2,20 );
Padd player2 = new Padd(height/2,620);
Ball ball = new Ball(width/2,height/2);
ScoreSystem scores = new ScoreSystem();
int paddSize = 100;
boolean isW,isS,isI,isK;

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
	}

	if (isW) 
		player1.up();

	if (isS)
		player1.down();
	
	if (isI) 
		player2.up();
	
	if (isK)
		player2.down();
}
void keyPressed()
{
	setMove(keyCode,true);
}
void keyReleased()
{
	setMove(keyCode,false);
}
boolean setMove(int k, boolean b)
{
	switch (k) {
		case 87:
			return isW = b;
		case 83:
			return isS = b;
		case 73:
			return isI = b;
		case 75:
			return isK = b;
		default :
			return b;		
	}
}
