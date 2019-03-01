Player a;
Player b;
int Turn = 1;
String Mode = "STARTUP";
int[][] map;
void setup() {
  size(1200, 600);
  map = new int[height-150][width];
  a = new Player(200, height - 50, "P1", color(255, 0, 0));
  b = new Player(width - 200, height - 50, "P2", color(0, 255, 0));
}

void draw() {
  noStroke();
  noFill();
  background(0);
  switch(Mode) {
  case "STARTUP":
    StartUpMenu();
    break;
  case "MAINMENU":
    MainMenu();
    break;
  case "GAME":
    Game();
    break;
  }
}
void Game(){
  rectMode(CENTER);
  a.show();
  b.show();
  fill(110);
  rect(width/2, height - 75, width, 150);
  fill(200, 0, 0);
  rect(400, height - 100, 175, 65);
  fill(255);
  textSize(70);
  textAlign(CENTER, CENTER);
  text("FIRE!", 400, height - 107);
  stroke(230);
  strokeWeight(5);
  noFill();
  rect(400, height - 30, 140, 50);
  line(400, height - 55, 400, height - 5);
  fill(255);
  noStroke();
  ellipse(200, height - 25, 175, 175);
  noFill();
  strokeWeight(4);
  stroke(0);
  ellipse(200, height - 25, 40, 40);
  ellipse(200, height - 25, 3, 3);
  ellipse(200, height - 25, 5, 5);
  fill(110);
  noStroke();
  rect(200, height, 180, 50);
  textSize(90);
  textAlign(TOP, CORNER);
  if(Turn == 1){
    fill(a.Color);
    text(a.name, 5, height - 75);
    noFill();
    strokeWeight(4);
    stroke(0);
    rect(width - 225, height - 110, 350, 50);
    rect(width - 250, height - 35, 300, 50);
    rect(width - 75, height - 35, 50, 50);
    fill(255, 0, 0);
    noStroke();
    rect(width - 225, height - 110, 346, 46);
    fill(0, 255, 0);
    rectMode(CORNER);
    rect(width - 398, height - 133, constrain(map(a.Health, 0, 100, 0, 346), 0, 346), 46);
    a.Health-=.5;
  }
}
void MainMenu() {
  background(57);
  rectMode(CENTER);
  noFill();
  strokeWeight(3);
  stroke(255);
  rect(width/4, height/5 * 2, 250, 120);
  rect(width/4 * 3, height/5 * 2, 250, 120);
  noStroke();
  fill(a.Color);
  rect(width/4, height/5 * 2, 175, 80);
  fill(b.Color);
  rect(width/4 * 3, height/5 * 2, 175, 80);
  fill(255, 0, 0);
  ellipse(width/8, height/5 * 3.5, 60, 60);
  fill(0, 255, 0);
  ellipse(width/8 * 1.5, height/5 * 3.5, 60, 60);
  fill(0, 0, 255);
  ellipse(width/8 * 2, height/5 * 3.5, 60, 60);
  fill(255, 255, 0);
  ellipse(width/8 * 2.5, height/5 * 3.5, 60, 60);
  fill(255, 0, 255);
  ellipse(width/8 * 3, height/5 * 3.5, 60, 60);
  fill(0, 255, 255);
  ellipse(width/8, height/5 * 4.25, 60, 60);
  fill(255, 0, 0);
  ellipse(width/8 + width/2, height/5 * 3.5, 60, 60);
  fill(0, 255, 0);
  ellipse(width/8 * 1.5 + width/2, height/5 * 3.5, 60, 60);
  fill(0, 0, 255);
  ellipse(width/8 * 2 + width/2, height/5 * 3.5, 60, 60);
  fill(255, 255, 0);
  ellipse(width/8 * 2.5 + width/2, height/5 * 3.5, 60, 60);
  fill(255, 0, 255);
  ellipse(width/8 * 3 + width/2, height/5 * 3.5, 60, 60);
  fill(0, 255, 255);
  ellipse(width/8 + width/2, height/5 * 4.25, 60, 60);
  fill(175);
  rect(width/2, height/5 * 2, 240, 100);
  fill(255);
  textSize(74);
  text("START", width/2, height/2 - 70);
}
void StartUpMenu() {
  background(57);
  fill(100, 100, 255);
  rectMode(CENTER);
  rect(width/2, height/2, 300, 120);
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(90);
  text("START", width/2, height/2 - 10);
}

void mousePressed() {
  switch(Mode) {
  case "STARTUP":
    if (mouseX > width/2 - 150 && mouseX < width/2 + 150 && mouseY > height/2 - 60 && mouseY < height/2 + 60) {
      Mode = "MAINMENU";
    }
    break;
  case "MAINMENU":
    if(dist(mouseX, mouseY, width/8, height/5 * 3.5) <= 30){
      a.Color = color(255, 0, 0);
    }
    if(dist(mouseX, mouseY, width/8 * 1.5, height/5 * 3.5) <= 30){
      a.Color = color(0, 255, 0);
    }
    if(dist(mouseX, mouseY, width/8 * 2, height/5 * 3.5) <= 30){
      a.Color = color(0, 0, 255);
    }
    if(dist(mouseX, mouseY, width/8 * 2.5, height/5 * 3.5) <= 30){
      a.Color = color(255, 255, 0);
    }
    if(dist(mouseX, mouseY, width/8 * 3, height/5 * 3.5) <= 30){
      a.Color = color(255, 0, 255);
    }
    if(dist(mouseX, mouseY, width/8, height/5 * 4.25) <= 30){
      a.Color = color(0, 255, 255);
    }
    if(dist(mouseX, mouseY, width/8 + width/2, height/5 * 3.5) <= 30){
      b.Color = color(255, 0, 0);
    }
    if(dist(mouseX, mouseY, width/8 * 1.5 + width/2, height/5 * 3.5) <= 30){
      b.Color = color(0, 255, 0);
    }
    if(dist(mouseX, mouseY, width/8 * 2 + width/2, height/5 * 3.5) <= 30){
      b.Color = color(0, 0, 255);
    }
    if(dist(mouseX, mouseY, width/8 * 2.5 + width/2, height/5 * 3.5) <= 30){
      b.Color = color(255, 255, 0);
    }
    if(dist(mouseX, mouseY, width/8 * 3 + width/2, height/5 * 3.5) <= 30){
      b.Color = color(255, 0, 255);
    }
    if(dist(mouseX, mouseY, width/8 + width/2, height/5 * 4.25) <= 30){
      b.Color = color(0, 255, 255);
    }
    if(mouseX > width/2-120 && mouseX < width/2+120 && mouseY > (height/5 * 2) - 50 && mouseY < (height/5*2)+50){
      Mode = "GAME";
    }
    break;
  }
}
void explode(float a, float b) {
  int x = int(a);
  int y = int(b);
}
