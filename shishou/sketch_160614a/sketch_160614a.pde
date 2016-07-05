Treasure[] treasures;
Explorer explorer;
static float SPEED = 0.5;

class Chara{
  private float width;
  private float height;
  private boolean isActive;

  public Chara(float width, float height, boolean isActive){
    this.width = width;
    this.height = height;
    this.isActive = isActive;
  }

  public void setWidth(float width){
    this.width = width;
  }
  public void setHeight(float height){
    this.height = height;
  }
  public void setActive(boolean isActive){
    this.isActive = isActive;
  }

  public float getWidth(){
    return this.width;
  }
  public float getHeight(){
    return this.height;
  }
  
  public boolean isActive(){
    return this.isActive;
  }

}

class Treasure extends Chara{
  public Treasure(float width, float height){
    super(width, height, true);
  }
}

class Explorer extends Chara{
  public Explorer(float width, float height){
    super(width, height, true);
  }
  
  public void exploration(Treasure[] treasures){
    Treasure near = null;
    for(int i=0;i<treasures.length;i++){
      if(treasures[i].isActive()){
        near = treasures[i];
        break;
      }
    }
    
    float nearRangeWidth;
    float nearRangeHeight;    
    float rangeWidth;
    float rangeHeight;
    for(int j=1;j<treasures.length;j++){
      if(treasures[j].isActive()){
        nearRangeWidth = abs(getWidth() - near.getWidth());
        nearRangeHeight = abs(getHeight() - near.getHeight());
        rangeWidth = abs(getWidth() - treasures[j].getWidth());
        rangeHeight = abs(getHeight() - treasures[j].getHeight());
        if((nearRangeWidth + nearRangeHeight) > (rangeWidth + rangeHeight)){
          near = treasures[j];
        }
      }
    }
    
    if(near != null){
      println((getWidth() - near.getWidth()) + ":" + (getHeight() - near.getHeight()));
      if((int)(getWidth() - near.getWidth()) == 0 && (int)(getHeight() - near.getHeight()) == 0){
        near.setActive(false);
      }
            
      if((getWidth() - near.getWidth()) < 0){
        setWidth(getWidth()+SPEED);
      }else{
        setWidth(getWidth()-SPEED);
      }
  
      if((getHeight() - near.getHeight()) < 0){
        setHeight(getHeight()+SPEED);
      }else{
        setHeight(getHeight()-SPEED);
      }
    }
  }
}

void setup(){
  size(250, 250);
  frameRate(20);
  treasures = new Treasure[10];
  for(int i=0;i<10;i++){
    treasures[i] = new Treasure(random(width), random(height));
  }
  
  explorer = new Explorer(random(width), random(height));
  
}

void draw(){
  background(0);
  
  fill(255,255,0);
  Treasure treasure = null;
  for(int i=0;i<treasures.length;i++){
    treasure = treasures[i];
    if(treasure.isActive()){
      ellipse(treasure.getWidth(),treasure.getHeight(), 10, 10);
    }
  }
  
  fill(255,0,0);
  ellipse(explorer.getWidth(), explorer.getHeight(), 10, 10);
  
  explorer.exploration(treasures);
}