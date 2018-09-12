void setup()
{ 
  size(640,640);
  background(255);
  
  
}

void draw()
{

  for(int i = 0; i < height; i++)
  {
    int position = 10 * i;
    
    line(0,position,position,height);
    stroke(200);
    if( i%3 == 0)
    {
      stroke(0);
    }
    
  }
}
