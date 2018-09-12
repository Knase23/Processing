import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Assignment02 extends PApplet {


public void setup()
{ 
  
  background(255);
  
  
}

public void draw()
{
  ParabolicCurve myCurve = new ParabolicCurve(0,width,height,20);
  myCurve.update();
}

class ParabolicCurve {

  int position, axis1, axis2, numberOfLines;
  public ParabolicCurve (int pos,int a1,int a2,int nuOfLi) {
    position = pos;
    axis1 = a1; // height
    axis2 = a2; // width
    numberOfLines = nuOfLi;

  }
  public void update()
  {

    for(int i = 0; i < numberOfLines; i++)
    {   
      line(position, i*(axis1/numberOfLines), i*(axis2/numberOfLines),axis2);
      stroke(199);
      if( i%3 == 0)
      {
        stroke(0);
      }
    
    }
  }

}
  public void settings() {  size(640,640); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Assignment02" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
