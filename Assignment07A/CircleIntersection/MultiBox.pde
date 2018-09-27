public class MultiBox extends Shape{
  public Box center;
  public Box inLeft, inRight, inTop, inBot;
  public Box onLeft, onRight, onTop, onBot;
  public PVector velocity, acceleration;
  public boolean inGround,onGround,inTopG,onTopG;
  public float weig, heig;
  
  public MultiBox(float x, float y, float w, float h){
    super(x, y);
    center = new Box(pos.x, pos.y, w, h);
    
    weig = w;
    heig = h;

    inLeft = new Box(pos.x - w * 0.5 + 2, pos.y, 2, 10);
    inRight = new Box(pos.x + w * 0.5 - 2, pos.y, 2, 10);
    inTop = new Box(pos.x, pos.y - h * 0.5 + 2, 10, 2);
    inBot = new Box(pos.x, pos.y + h * 0.5 - 2, 10, 2);
    
    onLeft = new Box(pos.x - w * 0.5 - 1, pos.y, 2, 10);
    onRight = new Box(pos.x + w * 0.5 + 1, pos.y, 2, 10);
    onTop = new Box(pos.x, pos.y - h * 0.5 - 1, 10, 2);
    onBot = new Box(pos.x, pos.y + h * 0.5 + 1, 10, 2);

    velocity = new PVector();
    acceleration = new PVector();
    acceleration.limit(9);
  }
  
  public void update(float dt){
    super.update(dt);
    updateAllBoxesPosition();
    falling();
    rectMode(CENTER);
    rect(pos.x, pos.y, center.size.x, center.size.y);
  }
  
  public boolean inGround(Box other){
    inGround = inBot.intersectsBox(other);
    return inGround;
  }
  
  public boolean onGround(Box other){
    onGround = onBot.intersectsBox(other);
    return onGround;
  }

  public void falling()
  {
    if(!onGround)
    { 
      acceleration.add(new PVector(0,1,0));
      velocity.add(acceleration);
      velocity.mult(0.01f);
      pos.add(velocity);
    } 
  }
  public void updateAllBoxesPosition()
  {
    center.pos = pos;
    
    inLeft.pos.x = pos.x - weig * 0.5 + 2;
    inLeft.pos.y = pos.y;

    inRight.pos.x = pos.x + weig * 0.5 - 2;
    inRight.pos.y = pos.y;
    
    inTop.pos.x = pos.x; 
    inTop.pos.y = pos.y - heig * 0.5 + 2;

 
    inBot.pos.x = pos.x;
    inBot.pos.y = pos.y + heig * 0.5 - 2;
    
    onLeft.pos.x = pos.x - weig * 0.5 - 1;
    onLeft.pos.y =pos.y;
    
    onRight.pos.x = pos.x + weig * 0.5 + 1;
    onRight.pos.y = pos.y;
    
    onTop.pos.x = pos.x;
    onTop.pos.y = pos.y - heig * 0.5 - 1;
    
    onBot.pos.x = pos.x;
    onBot.pos.y = pos.y + heig * 0.5 + 1;
  }
}