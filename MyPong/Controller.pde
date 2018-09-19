public class Controller {
	boolean isW,isS,isI,isK;
	public Controller () {
		this.isW = false;
		this.isS = false;
		this.isI = false;
		this.isK = false;

		
	}
	public void update(Padd player1, Padd player2) {
		if (isW) 
			player1.up();

		if (isS)
			player1.down();
	
		if (isI) 
			player2.up();
	
		if (isK)
			player2.down();
	}
	public boolean setMove(int k, boolean b)
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
	

}
void keyPressed()
{
	contr.setMove(keyCode,true);
}
void keyReleased()
{
	contr.setMove(keyCode,false);
}
