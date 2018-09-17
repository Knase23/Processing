
void setup()
{ 
  size(640,640);
  background(255);
  
  
}

void draw()
{
  background(255);
  ParabolicCurve myCurve = new ParabolicCurve(
    0,
    new LineCord(10 ,10,10,420),
    new LineCord(10,420,420,420),
    20,
    new Color(0),
    new Color(128));
  myCurve.update();
  //line(10,10,10,420);
  //line(10,420,420,420);
  //positionParabolicCurve(100,450,10);
  //startEndParabolicCurve(100,100,450,450,10);
}

//Functions
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

//Classes
public class ParabolicCurve {

  float position, numberOfLines;
  LineCord axis1, axis2;
  Color color1, color2;
  public ParabolicCurve (float position,LineCord axis1,LineCord axis2,float numberOfLines, Color color1, Color color2) {
    this.position = position;
    this.axis1 = axis1;
    this.axis2 = axis2; 
    this.numberOfLines = numberOfLines;
    this.color1 = color1;
    this.color2 = color2;
  }
  public void update()
  {
    for(int i = 0; i < numberOfLines; i++)
    {   
      float y1 = 0;
      float x2 = 0;
      line(
        i * ((axis1.x2 - axis1.x1) /numberOfLines) + axis1.x1, 
        i * ((axis1.y2 - axis1.y1) /numberOfLines) + axis1.y1,
        i * ((axis2.x2 - axis2.x1) / numberOfLines) + axis2.x1,
        i * ((axis2.y2 - axis2.y1)/numberOfLines) +axis2.y2);
     
      if( i%3 == 0)
      {
        // stroke(0);
        color1.paint();
      }
      else 
      {
        color2.paint();
      }
    
    }
    line(axis1.x1, axis1.y1,axis1.x2, axis1.y2);
    line(axis2.x1, axis2.y1,axis2.x2, axis2.y2);

  }
  float calculatePos()
  {

    //i * (axis1.y2 - axis1.y1)/numberOfLines;
    //axis1.x1 - axis1.x2
    return 1.0;
  }
}
public class Color {

  int red,green,blue;
  public Color (int red,int green,int blue) {
    this.red = red;
    this.green = green;
    this.blue = blue;
  }
  public Color(int grey)
  { 
    this.red = grey;
    this.green = grey;
    this.blue = grey;
  } 
  void paint()
  {
    stroke(this.red, this.green, this.blue);
  }

}
public class LineCord {
  float x1,y1,x2,y2;
  public LineCord (float x1, float y1, float x2, float y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }

}
