public boolean collision(PVector p1, float mass1 ,PVector p2, float mass2)
{

	if(mass1 < 0 || mass2 < 0)
		return false;

	float maxDistance  = mass1 + mass2;

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