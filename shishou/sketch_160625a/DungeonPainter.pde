public class DungeonPainter{
  
  public void paint(int[][] data){

    if(data[0][0] == 1 || data[0][0] == 0){
      painter.paintRoad(0, false);
    }else if(data[0][0] == 2 || data[0][0] == 3){
      painter.paintRoad(0, true);
    }
    if(data[0][2] == 1 || data[0][2] == 0){
      painter.paintRoad(2, false);
    }else if(data[0][2] == 2 || data[0][2] == 3){
      painter.paintRoad(2, true);
    }
    if(data[1][0] == 1 || data[1][0] == 0){
      painter.paintRoad(3, false);
    }else if(data[1][0] == 2 || data[1][0] == 3){
      painter.paintRoad(3, true);
    }
    if(data[1][2] == 1 || data[1][2] == 0){
      painter.paintRoad(5, false);
    }else if(data[1][2] == 2 || data[1][2] == 3){
      painter.paintRoad(5, true);
    }
    if(data[2][0] == 1 || data[2][0] == 0){
      painter.paintRoad(6, false);
    }else if(data[2][0] == 2 || data[2][0] == 3){
      painter.paintRoad(6, true);
    }
    if(data[2][2] == 1 || data[2][2] == 0){
      painter.paintRoad(8, false);
    }else if(data[2][2] == 2 || data[2][2] == 3){
      painter.paintRoad(8, true);
    }
    
    if(data[0][1] == 1 || data[0][1] == 0){
      painter.paintRoad(1, false);
    }else if(data[0][1] == 2 || data[0][1] == 3){
      painter.paintRoad(1, true);
    }
    if(data[1][1] == 1 || data[1][1] == 0){
      painter.paintRoad(4, false);
    }else if(data[1][1] == 2 || data[1][1] == 3){
      painter.paintRoad(4, true);
    }

    if(data[2][1] == 1 || data[2][1] == 0){
      painter.paintRoad(7, false);
    }else if(data[2][1] == 2 || data[2][1] == 3){
      painter.paintRoad(7, true);
    }
      
    
  }
  
  public void paintRoad(int num, boolean isRoad){
    switch(num){
      case 0:
        if(isRoad){
          quad(220, 160, 80, 160, 80, 130, 252, 130);
        }else{
          quad(220, 160, 220, 55, 252, 63, 252, 130);
          quad(220, 160, 80, 160, 80, 55, 220, 55);
        }
        break;
      case 1:
        if(isRoad){
          quad(252, 130, 348, 130, 380, 160, 220, 160);
        }else{
          quad(220, 55, 380, 55, 380, 160, 220, 160);
        }
        break;
      case 2:
        if(isRoad){
          quad(380, 160, 348, 130, 520, 130, 520, 160);
        }else{
          quad(380, 160, 380, 55, 348, 63, 348, 130);
          quad(380, 160, 380, 55, 520, 55, 520, 160);
        }
        break;
      case 3:
        if(isRoad){
          quad(160, 220, 80, 220, 80, 160, 220, 160);
        }else{
          quad(160, 220, 160, 40, 220, 55, 220, 160);
          quad(160, 220, 80, 220, 80, 40, 160, 40);
        }
        break;
      case 4:
        if(isRoad){
          quad(220, 160, 380, 160, 440, 220, 160, 220);
        }else{
          quad(160, 40, 440, 40, 440, 220, 160, 220);
        }
        break;
      case 5:
        if(isRoad){
          quad(440, 220, 380, 160, 520, 160, 520, 220);
        }else{
          quad(440, 220, 440, 40, 380, 55, 380, 160);
          quad(440, 220, 440, 40, 520, 40, 520, 220);
        }
        break;
      case 6:
        if(isRoad){
          quad(160, 220, 80, 220, 80, 300, 160, 220);
        }else{
          quad(80, 300, 80, 20, 160, 40, 160, 220);
        }
        break;
      case 7:
        quad(160, 220, 440, 220, 520, 300, 80, 300);
        break;
      case 8:
        if(isRoad){
          quad(440, 220, 520, 220, 520, 300, 440, 220);
        }else{
          quad(520, 300, 520, 20, 440, 40, 440, 220);
        }
        break;
    }
  }
}