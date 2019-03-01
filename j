class Player{
  PVector pos;
  String name;
  color Color;
  float rot = 0, Health = 100;
  int Power;
  Player(float x, float y, String n, color c){
    pos = new PVector(x, y);
    name = n;
    Color = c;
  }
  void Go(){
    
  }
  void show(){
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rot);
    fill(Color);
    rect(0, 0, 100, 50);
    popMatrix();
  }
  void reset(){
    
  }
}
