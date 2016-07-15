Dungeon dungeon = null;
DungeonPainter painter = null;

int size = 10;
int level = 1;
int x = 0;
int y = 0;
int[][] data;
int direction = 0; // 0:up, 1:left, 2:right, 3:down
boolean encount = false;
boolean moveNextLevel = false;
int fade = 0;
Battle battle = null;

Player player = new Player();

void setup(){
  size(600, 400);
  pixelDensity(displayDensity());
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
  textSize(16);
  text("level:" + level, 10, 50);
  text("X:" + x, 10, 66);
  text("Y:" + y, 10, 82);
  text("HP:" + player.getHP(), 10, 98);
//  text(direction, 10, 60);
  if(x<1) x=1;
  if(size<x) x=size;
  if(y<1) y=1;
  if(size<y) y=size;
  if(!moveNextLevel){
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
//    printData(data);
    painter.paint(data);
    if(encount){
      battle.printEnemy();
      battle.attack();
      battle.printCommand();
      if(battle.isFinish()){
        encount = false;
      }
    }    
  }catch(Exception e){
    println("---Error---");
    println("x:" + x + ",y:" + y);
    println("direction:" + direction);
    exit();
  }
  }else{
      if(fade < 255){
        background(fade);
        painter.paint(data);
        fade+=10;
      }else{
        moveNextLevel = false;
        fade= 0;
      }
  }
}

void keyPressed() {
    if (key == CODED) {
      if(encount){
        if (keyCode == UP) {
          battle.cursorUp();
        }else if(keyCode == DOWN){
          battle.cursorDown();
        }else if(keyCode == RIGHT){
          battle.commandSelect();
        }
      }else{
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
            moveNextLevel = true;
            player.recovery();
          }
          
          if((int)(Math.random()*100)<10){
            encount = true;
            battle = new Battle(player, new Enemy());
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
}

private void printData(int[][] data){
  for(int i=0;i<data.length;i++){
    for(int j=0;j<data[0].length;j++){
      print(data[i][j]);
    }
  }
  println();
}