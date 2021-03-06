public class Player{
  
  private int maxHP = 30;
  private int hp = 30;
  private int atk = 10;
  private int def = 5;
  
  public Player(){
    this.hp = this.maxHP;
  }
  
  public void recovery(){
    this.hp = this.maxHP;
  }
  
  public int getHP(){
    return this.hp;
  }

  public int damage(int atk){
    int damage = atk - this.def;
    this.hp = this.hp - damage;
    return damage;
  }

  public int getAtk(){
    return this.atk;
  }
 
  public boolean isKnockDown(){
    if(this.hp < 0){
      return true;
    }
    return false;
  }
  
}