
void setup()
{ 
  size(640,640);
  background(255);
  
  
}
void draw()
{
  ParabolicCurve myCurve = new ParabolicCurve(0,width,height,20);
  myCurve.update();
  //positionParabolicCurve(100,450,10);
  //startEndParabolicCurve(100,100,450,450,10);
}

class ParabolicCurve {

  float position, axis1, axis2, numberOfLines;

  public ParabolicCurve (float pos,float a1,float a2,float nuOfLi) {
    position = pos;
    axis1 = a1; // height
    axis2 = a2; // width
    numberOfLines = nuOfLi;
  }
  public void update()
  {

    for(int i = 0; i < numberOfLines; i++)
    {   
      line(position, i * axis1/numberOfLines, i * axis2/numberOfLines ,axis2);
      stroke(199);
      if( i%3 == 0)
      {
        stroke(0);
      }
    
    }
  }
}

void positionParabolicCurve(int xpos, int ypos, int distanceBetween)
{
  for (int i = 0; i < ypos/distanceBetween; ++i) {
    line(xpos, i * distanceBetween, xpos+(i * distanceBetween),ypos);
    stroke(100,255,0);
  }    
}
void startEndParabolicCurve(int startX,int startY,int endX,int endY,int distance)
{

  for (int i = 0; i < endY/distance; ++i) {
    line(startX,(startX +(i * distance))%endX, startX + (i * distance),endY);
    stroke(100,255,0);
  }    
}
int passessEnd(int xpos,int endX)
{
  if (xpos > endX) {
    return endX; 
  }

  return xpos;
}