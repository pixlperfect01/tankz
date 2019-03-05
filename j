class Player{
  PVector pos, Aim, WeaponPos, WeaponVel;
  String name;
  color Color;
  float rot = 0, Health = 100, MoveDist = 0;
  int Power = 100, CurrentWeapon = 0, Moves = 6;
  String[] Weapons = {"One Shot", "Three Shot", "Five Shot", "Big Shot", "Homing Missile", "Landmine", "Digger", "Air Strike", "Ion Beam", "Napalm", "Dirt Bomb", "Rocket", "Machine Gun", "Roller", "Targeter"};
  int[] WeaponCounts = {5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5};
  Player(float x, float y, String n, color c){
    pos = new PVector(x, y);
    name = n;
    Color = c;
    Aim = new PVector(width/2, height/2);
    WeaponPos = new PVector(pos.x, pos.y);
    WeaponVel = new PVector(0, 0);
  }
  void Fire(){
    WeaponPos = new PVector(pos.x, pos.y);
    WeaponVel = new PVector((Aim.x - pos.x) * .5, Aim.y - pos.y);
    WeaponVel.mult(.055);
    WeaponVel.mult(Power/100.0);
    WeaponCounts[CurrentWeapon]--;
  }
  void ShowWeapon(){
    fill(0);
    ellipse(WeaponPos.x, WeaponPos.y, 30, 30);
  }
  void MoveWeapon(){
    WeaponPos.add(WeaponVel);
    WeaponVel.add(new PVector(0, .5));
  }
  void show(){
    pushMatrix();
    noStroke();
    rectMode(CENTER);
    translate(pos.x, pos.y);
    rotate(rot);
    fill(Color);
    rect(0, 0, 75, 32.5);
    popMatrix();
  }
  void ShowAim(){
    
  }
  void reset(){
    
  }
}
boolean intersects(PVector circle,float r, PVector rect, PVector c)
{
    float circleDistanceX = abs(circle.x - rect.x);
    float circleDistanceY = abs(circle.y - rect.y);

    if (circleDistanceX > (c.x/2 + r)) { return false; }
    if (circleDistanceY > (c.y/2 + r)) { return false; }

    if (circleDistanceX <= (c.x/2)) { return true; } 
    if (circleDistanceY <= (c.y/2)) { return true; }

    float cornerDistance_sq = sq(circleDistanceX - c.x) +
                         sq(circleDistanceY - c.y);

    return (cornerDistance_sq <= sq(r));
}
