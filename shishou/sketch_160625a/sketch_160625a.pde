Dungeon dungeon = null;
DungeonPainter painter = null;

int size = 10;
int level = 1;
int x = 0;
int y = 0;
int[][] data;
int direction = 0; // 0:up, 1:left, 2:right, 3:down
boolean encount = false;

Player player = new Player();

void setup(){
  size(600, 400);
  frameRate(20);

  dungeon = new Dungeon(size);
  resetDungeon();
  painter = new DungeonPainter();
}

private void resetDungeon(){
  dungeon.create();
  dungeon.printData();
  x = dungeon.getStartX();
  y = dungeon.getStartY();
}

void draw(){
  background(0);
  text("level:" + level, 10, 50);
  text("X:" + x + ", Y:" + y, 10, 60);
//  text(direction, 10, 60);
  if(x<1) x=1;
  if(size<x) x=size;
  if(y<1) y=1;
  if(size<y) y=size;
  try{
    switch(direction){
      case 0:
        data = dungeon.getFrontData(x, y);
        break;
      case 1:
        data = dungeon.getLeftData(x, y);
        break;
      case 2:
        data = dungeon.getRightData(x, y);
        break;
      case 3:
        data = dungeon.getBackData(x, y);
        break;
    }   
    painter.paint(data);
    
    if(encount){
//      ellipse(width/2, height/2-80, 130, 130);
//      text("Monster has appeared!!", 100, 350);
    }
    
  }catch(Exception e){
    println("---Error---");
    println("x:" + x + ",y:" + y);
    println("direction:" + direction);
    exit();
  }
}

void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        if(direction == 0 && (data[1][1]==2 || data[1][1]==3 || data[1][1]==4)){
          y--;
        }else if(direction == 1 && (data[1][1]==2 || data[1][1]==3 || data[1][1]==4)){
          x--;
        }else if(direction == 2 && (data[1][1]==2 || data[1][1]==3 || data[1][1]==4)){
          x++;
        }else if(direction == 3 && (data[1][1]==2 || data[1][1]==3 || data[1][1]==4)){
          y++;
        }
        if(dungeon.isHole(x, y)){
          level++;
          resetDungeon();
        }
        
        if((int)(Math.random()*100)<10){
          encount = true;
        }

      } else if (keyCode == LEFT) {
        if(direction == 0){
          direction = 1;
        }else if(direction == 1){
          direction = 3;
        }else if(direction == 3){
          direction = 2;
        }else if(direction == 2){
          direction = 0;
        }
      } else if (keyCode == RIGHT) {
        if(direction == 0){
          direction = 2;
        }else if(direction == 2){
          direction = 3;
        }else if(direction == 3){
          direction = 1;
        }else if(direction == 1){
          direction = 0;
        }
      }
    }
}