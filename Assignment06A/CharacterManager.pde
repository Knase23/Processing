public class CharacterManager {
	Character[] characters;
	int numberOfCharacters;
	int numberOfHumans;
	int numberOfZombies;
	float timeItTook;
	public CharacterManager(int size) {
		numberOfCharacters = size;
		characters = new Character[numberOfCharacters];
		numberOfHumans = size - 1;
		numberOfZombies = size - numberOfHumans;
		characters[0] = new Zombie();
		for (int i = 1; i < numberOfCharacters; ++i) 
		{
		
				characters[i] = new Human();
		}

	}
	
	void update()
	{
		for (int i = 0; i < numberOfCharacters; ++i) {	
			if(characters[i] instanceof Zombie)
			{
				for (int j = 0; j < numberOfCharacters; ++j) {
					if(j !=i && 
						collision(characters[i].position,characters[i].radius/2,characters[j].position,characters[j].radius/2) 
						&& characters[j] instanceof Human)
					{
						characters[j] = new Zombie(characters[j]);
						numberOfHumans--;
						numberOfZombies++;
					}
				}

				characters[i].changeVelocity(PVector.sub(findNearestHuman(i),characters[i].position));
			}
			characters[i].update();	
		}
	}
	void draw()
	{
		for (int i = 0; i < numberOfCharacters; ++i) {
			characters[i].draw();
		}
	}
	public boolean gameOver()
	{
		if(numberOfZombies == numberOfCharacters)
		{
			return true;
		}
		timeItTook = millis() / 1000;
		return false;
	}
	public void displayScore() {
		fill(0);
		textSize(32);
		textAlign(CENTER);
		text("Game Over", width/2, height/2-100);
		text("Time it Took "+ round(timeItTook)+"s", width/2, height/2);
	}
	public PVector findNearestHuman(int indexOfZombie) {
		
		int indexOfNearest = indexOfZombie;
		float nearestDistance = 10000000 ;
		float distance = 0;
		for (int i = 0; i < numberOfCharacters; ++i) {
			if(characters[i] instanceof Human)
			{
				distance = dist(characters[i].position.x, characters[i].position.y, 
									 characters[indexOfZombie].position.x, characters[indexOfZombie].position.y);
				if(distance< nearestDistance)
				{
					nearestDistance = distance;
					indexOfNearest = i;
				}
			}
			
		}
		return characters[indexOfNearest].position;
		
	}
}
boolean collision(PVector p1,float radius1, PVector p2,float radius2)
{
	float maxDistance  = radius1 + radius2;
	if(abs(p1.x - p2.x) > maxDistance || abs(p1.y - p2.y) > maxDistance)
	{
		return false;
	} 
	else if (dist(p1.x,p1.y,p2.x,p2.y) > maxDistance) {
	return false;	
	}
	else 
	{
		return true;
	}
}