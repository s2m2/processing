public class Enemy{
  
  private int maxHP = 10;
  private int hp = 10;
  private int atk = 10;
  private int def = 5;
  
  public Enemy(){
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