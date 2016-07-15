public class Dungeon{
  
  /**
  * 0:outer
  * 1:wall
  * 2:road
  * 3:start
  * 4:end
  *
  **/
  
  private int size = 0;
  private int[][] data;
  private int startX = 0;
  private int startY = 0;
  private int endX = 0;
  private int endY = 0;
  private int currentX = 0;
  private int currentY = 0;
    
  public Dungeon(int size) {
    if(size==0){
      throw new IllegalArgumentException("Size is zero.");
    }
    this.size = size;
    this.data = new int[size+2][size+2];
  }
  
  public int getSize(){
    return this.size;
  }
  
  public int getStartX(){
    return this.startX;
  }
  
  public int getStartY(){
    return this.startY;
  }
  
  public void create(){
    setWall();
    setStartPoint();
    setRoad();
//    setTestRoad();
    setEndPoint();
  }
  
  private void setWall(){
    for(int i=0;i<this.size+2;i++){
      for(int j=0;j<this.size+2;j++){
        if(i==0 || i==this.size+1){
          this.data[i][j] = 0; // outer
        }else if(j==0 || j==this.size+1){
          this.data[i][j] = 0; // outer
        }else{
          this.data[i][j] = 1; //wall
        }
      }
    }
  }
  
  private void setTestRoad(){
    for(int i=1;i<size+1;i++){
      for(int j=1;j<size+1;j++){
        this.data[i][j] = 2;
      }
    }
  }
  
  private void setRoad(){
    println("start road:" + this.startX + "," + this.startY);
    this.currentX = this.startX;
    this.currentY = this.startY;
    int count =(int)(Math.random()*10) + 5;
    for(int i=0;i<count;i++){
      int direction =(int)(Math.random()*4);
      int dist =(int)(Math.random()*6)+ 3;
//      println("direction:" + direction + ", dist" + dist);
      for(int j=0;j<dist;j++){
        switch(direction){
          case 0: // up
            if(this.data[this.currentY-1][this.currentX] != 0){
              this.currentY--;
              if(this.data[this.currentY][this.currentX] != 3){
                this.data[this.currentY][this.currentX] = 2;
              }
            }
            break;
          case 1: // left
            if(this.data[this.currentY][this.currentX-1] != 0){
              this.currentX--;
              if(this.data[this.currentY][this.currentX] != 3){
                this.data[this.currentY][this.currentX] = 2;
              }
            }
            break;
          case 2: // right
            if(this.data[this.currentY][this.currentX+1] != 0){
              this.currentX++;
              if(this.data[this.currentY][this.currentX] != 3){
                this.data[this.currentY][this.currentX] = 2;
              }
            }
            break;
          case 3: // down
            if(this.data[this.currentY+1][this.currentX] != 0){
              this.currentY++;
              if(this.data[this.currentY][this.currentX] != 3){
                this.data[this.currentY][this.currentX] = 2;
              }
            }
            break;
        }
      }
    }  
  }
  
  private void setStartPoint(){
    startX = (int)(Math.random()*size)+1;
    startY = (int)(Math.random()*size)+1;
    this.data[startY][startX] = 3;
  }

  private void setEndPoint(){
    boolean endSet = false;
    while(!endSet){
      endX = (int)(Math.random()*size)+1;
      endY = (int)(Math.random()*size)+1;
      if(this.data[endY][endX] == 2){
        this.data[endY][endX] = 4;
        endSet = true;
      }
    }
  }

  
  public void printData(){
    for(int i=0;i<this.size+2;i++){
      for(int j=0;j<this.size+2;j++){
        print(data[i][j]);
      }
      println();
    }
  }
  
  public boolean isHole(int x, int y){
    if(this.data[y][x] == 4){
      return true;
    }
    return false;
  }
  
  public int[][] getFrontData(int x, int y){
    int[][] data = new int[3][3];
    
    data[2][0] = this.data[y][x-1];
    data[2][1] = this.data[y][x];
    data[2][2] = this.data[y][x+1];

    data[1][0] = this.data[y-1][x-1];
    data[1][1] = this.data[y-1][x];
    data[1][2] = this.data[y-1][x+1];

    if(y == 1){
      data[0][0] = -1;
      data[0][1] = -1;
      data[0][2] = -1;
    }else{
      data[0][0] = this.data[y-2][x-1];
      data[0][1] = this.data[y-2][x];
      data[0][2] = this.data[y-2][x+1];
    }    
    return data;
  }
  
  public int[][] getBackData(int x, int y){
    int[][] data = new int[3][3];
    
    data[2][0] = this.data[y][x+1]; //<>//
    data[2][1] = this.data[y][x];
    data[2][2] = this.data[y][x-1];

    data[1][0] = this.data[y+1][x+1];
    data[1][1] = this.data[y+1][x];
    data[1][2] = this.data[y+1][x-1];

    if(y == size){
      data[0][0] = -1;
      data[0][1] = -1; //<>//
      data[0][2] = -1;
    }else{
      data[0][0] = this.data[y+2][x+1];
      data[0][1] = this.data[y+2][x];
      data[0][2] = this.data[y+2][x-1];
    } 
    
    return data;
  }
  
  public int[][] getLeftData(int x, int y){
    int[][] data = new int[3][3];
    
    data[2][2] = this.data[y-1][x];
    data[2][1] = this.data[y][x];
    data[2][0] = this.data[y+1][x];

    data[1][2] = this.data[y-1][x-1];
    data[1][1] = this.data[y][x-1];
    data[1][0] = this.data[y+1][x-1];

    if(x == 1){
      data[0][2] = -1;
      data[0][1] = -1;
      data[0][0] = -1;
    }else{
      data[0][2] = this.data[y-1][x-2];
      data[0][1] = this.data[y][x-2];
      data[0][0] = this.data[y+1][x-2];
    }
    return data;
  }

  public int[][] getRightData(int x, int y){
    int[][] data = new int[3][3];
    
    data[2][0] = this.data[y-1][x];
    data[2][1] = this.data[y][x];
    data[2][2] = this.data[y+1][x];

    data[1][0] = this.data[y-1][x+1];
    data[1][1] = this.data[y][x+1];
    data[1][2] = this.data[y+1][x+1];

    if(x == size){
      data[0][0] = -1;
      data[0][1] = -1;
      data[0][2] = -1;
    }else{
      data[0][0] = this.data[y-1][x+2];
      data[0][1] = this.data[y][x+2];
      data[0][2] = this.data[y+1][x+2];
    } 
    
    return data;
  }

  
}