public class Battle{
  private static final int WAIT_TIME = 20;
  
  private int wait = WAIT_TIME;
  
  private Player player = null;
  private Enemy enemy = null;
  
  private int attackSequence = 0;
  private int enemySequence = 0;
  private int defenseSequence = 0;
  private int escapeSequence = 0;
  private int finishSequence = 0;
  
  private boolean playerTurn = true;  
  private boolean isFinish = false;
  private boolean processTurn = false;
  private boolean isEnemyAttacked = false;
  
  private int damage = 0;
  
  private int cursor = 0;
  private boolean selected = false; 
  
  public Battle(Player player, Enemy enemy){
    this.player = player;
    this.enemy = enemy;
    this.attackSequence = 0;
    this.enemySequence = 0;
    this.defenseSequence = 0;
    this.escapeSequence = 0;
    this.finishSequence = 0;
    this.playerTurn = true;
    this.isFinish = false;
    this.isEnemyAttacked = false;
  }
  
  public void cursorUp(){
    if(cursor != 0){
      cursor--;
    }
  }
  
  public void cursorDown(){
    if(cursor != 2){
      cursor++;
    }
  }

  public void commandSelect(){
    selected = true;
    playerTurn = true;
    processTurn = false;
  }
  
  public void attack(){
    if(processTurn){
      return;
    }
    if(playerTurn){
      damage = enemy.damage(player.getAtk());
      this.isEnemyAttacked = false;
    }else{
      damage = player.damage(enemy.getAtk());
      this.isEnemyAttacked = true;
    }
    processTurn = true;
  }

  public void printEnemy(){
      ellipse(width/2, height/2-80, 130, 130);
  }

  public void printCommand(){
      if(!selected){
        text("Monster has appeared!!", 100, 334);
        switch(cursor){
          case 0:
            text(">Attack", 120, 350);
            text(" Defense", 120, 366);
            text(" Escape", 120, 382);
            break;
          case 1:
            text(" Attack", 120, 350);
            text(">Defense", 120, 366);
            text(" Escape", 120, 382);
            break;
          case 2:
            text(" Attack", 120, 350);
            text(" Defense", 120, 366);
            text(">Escape", 120, 382);
            break;
        }
      }else{
        switch(cursor){
          case 0:
            switch(attackSequence){
              case 0:
                text("Player attack", 100, 334); 
                break;
              case 1:
                text(damage + " Damage", 100, 334); 
                break;
              case 2:
                if(enemy.isKnockDown()){
                  text("Enemy knock down", 100, 334);
                }else{
                  text("Enemy attack", 100, 334);
                }
                break;
              case 3:
                if(enemy.isKnockDown()){
                  isFinish = true;
                }else{
                  if(!this.isEnemyAttacked && this.processTurn){
                    playerTurn = false;
                    processTurn = false;
                  }
                  text(damage + " Damage", 100, 334); 
                }
                break;
              case 4:
                selected = false;
                attackSequence = 0;
                break;              
            }
            wait--;
            if(wait == 0){
              attackSequence++;
              wait = WAIT_TIME;
            }
            break;
          case 1:
            text("Defense!!", 100, 334);
            text(" Attack", 120, 350);
            text(">Defense", 120, 366);
            text(" Escape", 120, 382);
            break;
          case 2:
            text("Escape!!", 100, 334);
            text(" Attack", 120, 350);
            text(" Defense", 120, 366);
            text(">Escape", 120, 382);
            break;
        }
      } 
  }
  
  public boolean isFinish(){
    return this.isFinish;
  }
  
}