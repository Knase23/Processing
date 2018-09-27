
void setup()
{
  size(768,432);
  background(0,100,182);
  
}
void drawFirstName(int xInc,int yInc)
{
  // Jesper
  // J
  arc(102 + xInc,156 + yInc,88,156,0.3,2.5);
  line(141 + xInc,18 + yInc,141 + xInc,190 + yInc);
  
  // e
  arc(198 + xInc,156+ yInc,88,156,0.3,6.0);
  line(157+ xInc,135+ yInc,239+ xInc,136+ yInc);  
  
  // s
  arc(301+ xInc,119+ yInc,79,70,1.4,5.0);
  arc(295+ xInc,190+ yInc,82,76,5.0,8.0);
  // p
  line(357+ xInc,93+ yInc,375+ xInc,247+ yInc);
  arc(370 + xInc,133+ yInc,85,85,4.5,8.0);
  
  // e
  arc(469+ xInc,156+ yInc,88,156,0.3,6.0);
  line(429+ xInc,135+ yInc,511+ xInc,136+ yInc);
 
  //r
  arc(579+ xInc,188+ yInc,87,155,4.0,5.5);
  line(547+ xInc,109+ yInc,548+ xInc,247+ yInc);
  
  noFill();
}

void drawLastName(int xInc ,int yInc)
{
  //Uddefors
  
  //U 
  arc(100,318,76,146,-0.4,3.5);
  
  //d
  arc(190,340,49,65,1.5,4.8);
  line(196,255,195,371);
 
  //d
  arc(234,340,49,65,1.5,4.8);
  line(241,256,238,371);
  
  //e
  arc(281,340,49,65,1.1,6.1);
  line(261,330,306,334);
   
  //f
  arc(333,305,23,40,3.1,6.1);
  line(321,303,321,374);
  line(340,326,313,324);
  
  //o
  ellipse(368,347,38,39);
  
  //r
  arc(417,332,28,40,3.1,6.1);
  line(402,305,401,374);
  
  //s
  arc(458,322,29,33,1.6,5.7);
  arc(456,355,23,32,4.7,9.3);
  noFill();
}

void drawStar()
{

}
float weight = 1;
float weightInc = 0.1;
int slide = 1;
int slideInc = 3;
void draw() 
{
  background(0,100,182);
  stroke(255,255,255);
  strokeWeight(weight);
  
  if(weight < 8 && weight > 0.3)
  {
    weight += weightInc;
  }
  else
  {
    weightInc = -weightInc;
      
    weight += weightInc;
  }
  if( slide < 100 && slide > 0)
  {
    slide += slideInc;
  }
  else
  {
    slideInc = -slideInc;
    slide += slideInc;
  }
    
    
    
  drawFirstName(slide,slide);
  drawLastName(slide,slide);  
  
  
}
