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
  }
  void ShowWeapon(){
    
  }
  void MoveWeapon(){
    
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
  void reset(){
    
  }
}

