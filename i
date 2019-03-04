Player a;
Player b;
int Turn = 1;
String Mode = "STARTUP";
int[][] map;

void setup() {
  size(1200, 600);
  map = new int[height-150][width];
  a = new Player(200, height - 200, "P1", color(255, 0, 0));
  b = new Player(width - 200, height - 200, "P2", color(0, 255, 0));
  map = fillArray(width, height-150, 0);
}

void draw() {
  //println(mouseX, mouseY);
  //println(a.Aim);
  background(0, 150, 0);
  noStroke();
  noFill();
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
  case "POWEREDIT":
    PowerEdit();
    break;
  case "WEAPONSELECT":
    WeaponSelect();
    break;
  case "MOVELEFT":
    MoveLeft();
    break;
  case "MOVERIGHT":
    MoveRight();
    break;
  case "FIRE":
    Fire();
    break;
  }
}
void Fire() {
  Game();
  if (Turn == 1) {
    a.MoveWeapon();
    if (intersects(a.WeaponPos, 15, b.pos, new PVector(75, 32.5)) || hitGround(a.WeaponPos)) {
      explode(a.WeaponPos.x, a.WeaponPos.y);
    }
    a.ShowWeapon();
  } else {
    b.MoveWeapon();
    if (intersects(b.WeaponPos, 15, a.pos, new PVector(75, 32.5)) || hitGround(b.WeaponPos)) {
      explode(b.WeaponPos.x, b.WeaponPos.y);
    }
    b.ShowWeapon();
  }
}
void MoveLeft() {
  Game();
  if (Turn == 1) {
    if (a.Moves < 0 || a.MoveDist > 50) {
      Mode = "GAME";
      a.MoveDist = 0;
      return;
    }
    a.pos.x -= 1;
    a.MoveDist += 1;
  } else {
    if (b.Moves < 0 || b.MoveDist > 50) {
      Mode = "GAME";
      b.MoveDist = 0;
      return;
    }
    b.pos.x -= 1;
    b.MoveDist += 1;
  }
}
void MoveRight() {
  Game();
  if (Turn == 1) {
    if (a.Moves < 0 || a.MoveDist > 50) {
      Mode = "GAME";
      a.MoveDist = 0;
      return;
    }
    a.pos.x += 1;
    a.MoveDist += 1;
  } else {
    if (b.Moves < 0 || b.MoveDist > 50) {
      Mode = "GAME";
      b.MoveDist = 0;
      return;
    }
    b.pos.x += 1;
    b.MoveDist += 1;
  }
}
void WeaponSelect() {
  noStroke();
  background(0, 0, 50);
  rectMode(CENTER);
  fill(130);
  rect(width/2, height/2, width - 150, height - 150);
  fill(0, 0, 255);
  rect(width - 105, 105, 60, 60);
  stroke(255);
  line(width - 130, 80, width - 80, 130);
  line(width - 130, 130, width - 80, 80);
  noStroke();
  fill(255);
  textAlign(CORNER, TOP);
  textSize(48);
  if (Turn == 1) {
    text("x" +  a.WeaponCounts[0], 150 + 185 * 0, 210 + 60 * 0);
    text("x" +  a.WeaponCounts[1], 150 + 185 * 0, 210 + 60 * 1);
    text("x" +  a.WeaponCounts[2], 150 + 185 * 0, 210 + 60 * 2);
    text("x" +  a.WeaponCounts[3], 150 + 185 * 0, 210 + 60 * 3);
    text("x" +  a.WeaponCounts[4], 150 + 185 * 0, 210 + 60 * 4);
    text("x" +  a.WeaponCounts[5], 150 + 185 * 1, 210 + 60 * 0);
    text("x" +  a.WeaponCounts[6], 150 + 185 * 1, 210 + 60 * 1);
    text("x" +  a.WeaponCounts[7], 150 + 185 * 1, 210 + 60 * 2);
    text("x" +  a.WeaponCounts[8], 150 + 185 * 1, 210 + 60 * 3);
    text("x" +  a.WeaponCounts[9], 150 + 185 * 1, 210 + 60 * 4);
    text("x" + a.WeaponCounts[10], 150 + 185 * 2, 210 + 60 * 0);
    text("x" + a.WeaponCounts[11], 150 + 185 * 2, 210 + 60 * 1);
    text("x" + a.WeaponCounts[12], 150 + 185 * 2, 210 + 60 * 2);
    text("x" + a.WeaponCounts[13], 150 + 185 * 2, 210 + 60 * 3);
    text("x" + a.WeaponCounts[14], 150 + 185 * 2, 210 + 60 * 4);
    fill(0, 0, 255);
    rectMode(CENTER);
    rect(120 + 185 * 0, 242 + 60 * 0, 50, 50);
    rect(120 + 185 * 0, 242 + 60 * 1, 50, 50);
    rect(120 + 185 * 0, 242 + 60 * 2, 50, 50);
    rect(120 + 185 * 0, 242 + 60 * 3, 50, 50);
    rect(120 + 185 * 0, 242 + 60 * 4, 50, 50);
    rect(120 + 185 * 1, 242 + 60 * 0, 50, 50);
    rect(120 + 185 * 1, 242 + 60 * 1, 50, 50);
    rect(120 + 185 * 1, 242 + 60 * 2, 50, 50);
    rect(120 + 185 * 1, 242 + 60 * 3, 50, 50);
    rect(120 + 185 * 1, 242 + 60 * 4, 50, 50);
    rect(120 + 185 * 2, 242 + 60 * 0, 50, 50);
    rect(120 + 185 * 2, 242 + 60 * 1, 50, 50);
    rect(120 + 185 * 2, 242 + 60 * 2, 50, 50);
    rect(120 + 185 * 2, 242 + 60 * 3, 50, 50);
    rect(120 + 185 * 2, 242 + 60 * 4, 50, 50);
  } else {
    text("x" +  b.WeaponCounts[0], 150 + 185 * 0, 210 + 60 * 0);
    text("x" +  b.WeaponCounts[1], 150 + 185 * 0, 210 + 60 * 1);
    text("x" +  b.WeaponCounts[2], 150 + 185 * 0, 210 + 60 * 2);
    text("x" +  b.WeaponCounts[3], 150 + 185 * 0, 210 + 60 * 3);
    text("x" +  b.WeaponCounts[4], 150 + 185 * 0, 210 + 60 * 4);
    text("x" +  b.WeaponCounts[5], 150 + 185 * 1, 210 + 60 * 0);
    text("x" +  b.WeaponCounts[6], 150 + 185 * 1, 210 + 60 * 1);
    text("x" +  b.WeaponCounts[7], 150 + 185 * 1, 210 + 60 * 2);
    text("x" +  b.WeaponCounts[8], 150 + 185 * 1, 210 + 60 * 3);
    text("x" +  b.WeaponCounts[9], 150 + 185 * 1, 210 + 60 * 4);
    text("x" + b.WeaponCounts[10], 150 + 185 * 2, 210 + 60 * 0);
    text("x" + b.WeaponCounts[11], 150 + 185 * 2, 210 + 60 * 1);
    text("x" + b.WeaponCounts[12], 150 + 185 * 2, 210 + 60 * 2);
    text("x" + b.WeaponCounts[13], 150 + 185 * 2, 210 + 60 * 3);
    text("x" + b.WeaponCounts[14], 150 + 185 * 2, 210 + 60 * 4);
    fill(0, 0, 255);
    rectMode(CENTER);
    rect(120 + 185 * 0, 242 + 60 * 0, 50, 50);
    rect(120 + 185 * 0, 242 + 60 * 1, 50, 50);
    rect(120 + 185 * 0, 242 + 60 * 2, 50, 50);
    rect(120 + 185 * 0, 242 + 60 * 3, 50, 50);
    rect(120 + 185 * 0, 242 + 60 * 4, 50, 50);
    rect(120 + 185 * 1, 242 + 60 * 0, 50, 50);
    rect(120 + 185 * 1, 242 + 60 * 1, 50, 50);
    rect(120 + 185 * 1, 242 + 60 * 2, 50, 50);
    rect(120 + 185 * 1, 242 + 60 * 3, 50, 50);
    rect(120 + 185 * 1, 242 + 60 * 4, 50, 50);
    rect(120 + 185 * 2, 242 + 60 * 0, 50, 50);
    rect(120 + 185 * 2, 242 + 60 * 1, 50, 50);
    rect(120 + 185 * 2, 242 + 60 * 2, 50, 50);
    rect(120 + 185 * 2, 242 + 60 * 3, 50, 50);
    rect(120 + 185 * 2, 242 + 60 * 4, 50, 50);
  }
  int HOVERED_ON = -1;
  if (mouseX > 93 && mouseY > 216 && mouseX < 271 && mouseY < 269) {
    HOVERED_ON = 0;
  }
  if (mouseX > 93 && mouseY > 216+60 && mouseX < 271 && mouseY < 269+60) {
    HOVERED_ON = 1;
  }
  if (mouseX > 93 && mouseY > 216+60*2 && mouseX < 271 && mouseY < 269+60*2) {
    HOVERED_ON = 2;
  }
  if (mouseX > 93 && mouseY > 216+60*3 && mouseX < 271 && mouseY < 269+60*3) {
    HOVERED_ON = 3;
  }
  if (mouseX > 93 && mouseY > 216+60*4 && mouseX < 271 && mouseY < 269+60*4) {
    HOVERED_ON = 4;
  }
  if (mouseX > 93+185 && mouseY > 216 && mouseX < 271+185 && mouseY < 269) {
    HOVERED_ON = 5;
  }
  if (mouseX > 93+185 && mouseY > 216+60 && mouseX < 271+185 && mouseY < 269+60) {
    HOVERED_ON = 6;
  }
  if (mouseX > 93+185 && mouseY > 216+60*2 && mouseX < 271+185 && mouseY < 269+60*2) {
    HOVERED_ON = 7;
  }
  if (mouseX > 93+185 && mouseY > 216+60*3 && mouseX < 271+185 && mouseY < 269+60*3) {
    HOVERED_ON = 8;
  }
  if (mouseX > 93+185 && mouseY > 216+60*4 && mouseX < 271+185 && mouseY < 269+60*4) {
    HOVERED_ON = 9;
  }
  if (mouseX > 93+185*2 && mouseY > 216 && mouseX < 271+185*2 && mouseY < 269) {
    HOVERED_ON = 10;
  }
  if (mouseX > 93+185*2 && mouseY > 216+60 && mouseX < 271+185*2 && mouseY < 269+60) {
    HOVERED_ON = 11;
  }
  if (mouseX > 93+185*2 && mouseY > 216+60*2 && mouseX < 271+185*2 && mouseY < 269+60*2) {
    HOVERED_ON = 12;
  }
  if (mouseX > 93+185*2 && mouseY > 216+60*3 && mouseX < 271+185*2 && mouseY < 269+60*3) {
    HOVERED_ON = 13;
  }
  if (mouseX > 93+185*2 && mouseY > 216+60*4 && mouseX < 271+185*2 && mouseY < 269+60*4) {
    HOVERED_ON = 14;
  }
  fill(255);
  textSize(52);
  textAlign(CORNER, TOP);
  if (HOVERED_ON > -1) {
    text(a.Weapons[HOVERED_ON], 80, 70);
  }
  println(HOVERED_ON);
}
void PowerEdit() {
  noStroke();
  background(0, 0, 50);
  rectMode(CENTER);
  fill(120);
  rect(width/2, height/2, width/5*2.25, height/5*1.5);
  textAlign(CENTER, CENTER);
  textSize(100);
  fill(50);
  rect(width/2, height/2 + 50, width/5 * 1.75, height/25);
  if (Turn==1) {
    a.Power = constrain(a.Power, 0, 100);
    fill(a.Color);
    text(a.Power + "%", width/3 + 55, height/2 - 50);
    fill(255, 0, 0);
    rect(map(a.Power, 0, 100, width/2 - (width/5 * 1.75) / 2, width/2 + (width/5 * 1.75) / 2), height/2 + 50, 30, 60);
  } else {
    b.Power = constrain(b.Power, 0, 100);
    fill(b.Color);
    text(b.Power + "%", width/3 + 55, height/2 - 50);
    fill(255, 0, 0);
    rect(map(b.Power, 0, 100, width/2 - (width/5 * 1.75) / 2, width/2 + (width/5 * 1.75) / 2), height/2 + 50, 30, 60);
  }
  fill(0, 0, 255);
  rectMode(CORNER);
  rect(width/5 * 3.5 - 20, height/5 * 2 - 30, 50, 50);
  stroke(255);
  line(width/5 * 3.5 - 15, height/5 * 2 - 25, width/5 * 3.5 + 25, height/5 * 2 + 15);
  line(width/5 * 3.5 + 25, height/5 * 2 - 25, width/5 * 3.5 - 15, height/5 * 2 + 15);
}
void mouseDragged() {
  switch(Mode) {
  case "POWEREDIT":
    if (mouseX > 395 && mouseY > 316 && mouseX < 840 && mouseY < 380) {
      if (Turn == 1) {
        a.Power = (int)map(mouseX, 395, 840, 0, 101);
      } else {
        b.Power = (int)map(mouseX, 395, 840, 0, 101);
      }
    }
    break;
  case "GAME":
    if (Turn == 1) {
      a.Aim = new PVector(mouseX, mouseY);
    } else {
      b.Aim = new PVector(mouseX, mouseY);
    }
  }
}
void DrawMap() {
  if (frameCount%2==0) {
    loadPixels();
    for (int i=0; i<map.length; i++) {
      for (int j=0; j<map[i].length; j++) {
        pixels[j * map.length + i] = map[i][j];
      }
    }
    updatePixels();
  }
}
void Game() {
  DrawMap();
  rectMode(CENTER);
  a.show();
  b.show();
  if (Turn == 1) {
    stroke(255);
    line(a.pos.x, a.pos.y, a.Aim.x, a.Aim.y);
  } else {
    stroke(255);
    line(b.pos.x, b.pos.y, b.Aim.x, b.Aim.y);
  }
  noStroke();
  fill(110);
  rect(width/2, height - 75, width, 150);
  fill(255);
  rect(width/6 * 2.75, height/6 * 5, 50, 50);
  rect(width/6 * 3.5, height/6 * 5, 50, 50);
  stroke(0);
  strokeWeight(7);
  line(width/6 * 2.75 - 18, height/6 * 5, width/6 * 2.75 + 16, height/6 * 5 - 18);
  line(width/6 * 2.75 - 18, height/6 * 5, width/6 * 2.75 + 16, height/6 * 5 + 18);
  line(width/6 * 2.75 + 16, height/6 * 5 + 18, width/6 * 2.75 + 16, height/6 * 5 - 18);
  line(width/6 * 3.5 + 18, height/6 * 5, width/6 * 3.5 - 16, height/6 * 5 - 18);
  line(width/6 * 3.5 + 18, height/6 * 5, width/6 * 3.5 - 16, height/6 * 5 + 18);
  line(width/6 * 3.5 - 16, height/6 * 5 + 18, width/6 * 3.5 - 16, height/6 * 5 - 18);//
  line(width/6 * 2.75 - 14, height/6 * 5, width/6 * 2.75 + 12, height/6 * 5 - 14);
  line(width/6 * 2.75 - 14, height/6 * 5, width/6 * 2.75 + 12, height/6 * 5 + 14);
  line(width/6 * 2.75 + 12, height/6 * 5 + 14, width/6 * 2.75 + 12, height/6 * 5 - 14);
  line(width/6 * 3.5 + 14, height/6 * 5, width/6 * 3.5 - 12, height/6 * 5 - 14);
  line(width/6 * 3.5 + 14, height/6 * 5, width/6 * 3.5 - 12, height/6 * 5 + 14);
  line(width/6 * 3.5 - 12, height/6 * 5 + 14, width/6 * 3.5 - 12, height/6 * 5 - 14);//
  line(width/6 * 2.75 - 10, height/6 * 5, width/6 * 2.75 + 8, height/6 * 5 - 10);
  line(width/6 * 2.75 - 10, height/6 * 5, width/6 * 2.75 + 8, height/6 * 5 + 10);
  line(width/6 * 2.75 + 8, height/6 * 5 + 10, width/6 * 2.75 + 8, height/6 * 5 - 10);
  line(width/6 * 3.5 + 10, height/6 * 5, width/6 * 3.5 - 8, height/6 * 5 - 10);
  line(width/6 * 3.5 + 10, height/6 * 5, width/6 * 3.5 - 8, height/6 * 5 + 10);
  line(width/6 * 3.5 - 8, height/6 * 5 + 10, width/6 * 3.5 - 8, height/6 * 5 - 10);//
  line(width/6 * 2.75 - 6, height/6 * 5, width/6 * 2.75 + 4, height/6 * 5 - 6);
  line(width/6 * 2.75 - 6, height/6 * 5, width/6 * 2.75 + 4, height/6 * 5 + 6);
  line(width/6 * 2.75 + 4, height/6 * 5 + 6, width/6 * 2.75 + 4, height/6 * 5 - 6);
  line(width/6 * 3.5 + 6, height/6 * 5, width/6 * 3.5 - 4, height/6 * 5 - 6);
  line(width/6 * 3.5 + 6, height/6 * 5, width/6 * 3.5 - 4, height/6 * 5 + 6);
  line(width/6 * 3.5 - 4, height/6 * 5 + 6, width/6 * 3.5 - 4, height/6 * 5 - 6);//
  fill(0, 43, 75);
  stroke(0);
  rect(width/6 * 3.12, height/6 * 5, 100, 44);
  strokeWeight(4);
  noStroke();
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(42);
  if (Turn == 1) {
    text(constrain(a.Moves, 0, 1000), width/6 * 3.12, height/6 * 5 - 5);
    if (a.WeaponCounts[a.CurrentWeapon]>0) {
      fill(200, 0, 0);
    } else {
      fill(150, 0, 0);
    }
  } else if (Turn == 2) {
    text(constrain(b.Moves, 0, 1000), width/6 * 3.12, height/6 * 5 - 5);
    if (b.WeaponCounts[b.CurrentWeapon]>0) {
      fill(200, 0, 0);
    } else {
      fill(150, 0, 0);
    }
  }
  rect(400, height - 100, 175, 65);
  fill(255);
  textSize(70);
  textAlign(CENTER, CENTER);
  text("FIRE!", 400, height - 107);
  rectMode(CORNER);
  fill(0);
  //WEAPON ICON HERE
  rect(333, 548, 50, 50);
  rectMode(CENTER);
  stroke(230);
  strokeWeight(5);
  noFill();
  rect(400, height - 30, 140, 50);
  line(385, height - 55, 385, height - 5);
  fill(255);
  noStroke();
  textSize(44);
  if (Turn == 1) {
    textAlign(CORNER, TOP);
    text(a.WeaponCounts[a.CurrentWeapon], 386, height - 57);
  } else {
    textAlign(CORNER, TOP);
    text(b.WeaponCounts[b.CurrentWeapon], 386, height - 57);
  }
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
  if (Turn == 1) {
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
    fill(255, 30, 30);
    rect(width - 398, height - 58, constrain(map(a.Power, 0, 100, 0, 296), 0, 296), 46);
    fill(0, 0, 255);
    rectMode(CENTER);
    rect(width - 75, height - 35, 46, 46);
  } else {
    fill(b.Color);
    text(b.name, 5, height - 75);
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
    rect(width - 398, height - 133, constrain(map(b.Health, 0, 100, 0, 346), 0, 346), 46);
    fill(255, 30, 30);
    rect(width - 398, height - 58, constrain(map(b.Power, 0, 100, 0, 296), 0, 296), 46);
    fill(0, 0, 255);
    rectMode(CENTER);
    rect(width - 75, height - 35, 46, 46);
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
    if (dist(mouseX, mouseY, width/8, height/5 * 3.5) <= 30) {
      a.Color = color(255, 0, 0);
    }
    if (dist(mouseX, mouseY, width/8 * 1.5, height/5 * 3.5) <= 30) {
      a.Color = color(0, 255, 0);
    }
    if (dist(mouseX, mouseY, width/8 * 2, height/5 * 3.5) <= 30) {
      a.Color = color(0, 0, 255);
    }
    if (dist(mouseX, mouseY, width/8 * 2.5, height/5 * 3.5) <= 30) {
      a.Color = color(255, 255, 0);
    }
    if (dist(mouseX, mouseY, width/8 * 3, height/5 * 3.5) <= 30) {
      a.Color = color(255, 0, 255);
    }
    if (dist(mouseX, mouseY, width/8, height/5 * 4.25) <= 30) {
      a.Color = color(0, 255, 255);
    }
    if (dist(mouseX, mouseY, width/8 + width/2, height/5 * 3.5) <= 30) {
      b.Color = color(255, 0, 0);
    }
    if (dist(mouseX, mouseY, width/8 * 1.5 + width/2, height/5 * 3.5) <= 30) {
      b.Color = color(0, 255, 0);
    }
    if (dist(mouseX, mouseY, width/8 * 2 + width/2, height/5 * 3.5) <= 30) {
      b.Color = color(0, 0, 255);
    }
    if (dist(mouseX, mouseY, width/8 * 2.5 + width/2, height/5 * 3.5) <= 30) {
      b.Color = color(255, 255, 0);
    }
    if (dist(mouseX, mouseY, width/8 * 3 + width/2, height/5 * 3.5) <= 30) {
      b.Color = color(255, 0, 255);
    }
    if (dist(mouseX, mouseY, width/8 + width/2, height/5 * 4.25) <= 30) {
      b.Color = color(0, 255, 255);
    }
    if (mouseX > width/2-120 && mouseX < width/2+120 && mouseY > (height/5 * 2) - 50 && mouseY < (height/5*2)+50) {
      Mode = "GAME";
    }
    break;
  case "GAME":
    if (mouseX > width - 98 && mouseX < width - 52 && mouseY > height - 58 && mouseY < height - 12) {
      Mode = "POWEREDIT";
    }
    if (mouseX > 330 && mouseY > 545 && mouseX < 471 && mouseY < 595) {
      Mode = "WEAPONSELECT";
    }
    if (mouseX > width/6 * 2.75 - 25 && mouseX < width/6 * 2.75 + 25 && mouseY > height/6 * 5 - 25 && mouseY < height/6 * 5 + 25) {
      Mode = "MOVELEFT";
      if (Turn == 1) {
        a.Moves--;
      } else {
        b.Moves--;
      }
    }
    if (mouseX > width/6 * 3.5 - 25 && mouseX < width/6 * 3.5 + 25 && mouseY > height/6 * 5 - 25 && mouseY < height/6 * 5 + 25) {
      Mode = "MOVERIGHT";
      if (Turn == 1) {
        a.Moves--;
      } else {
        b.Moves--;
      }
    }
    if (mouseX > 312.5 && mouseX < 482.5 && mouseY > height - 100 - 65/2&& mouseY < height - 100 + 65/2) {
      if (Turn == 1) {
        a.Fire();
      } else {
        b.Fire();
      }
      Mode = "FIRE";
    }
    break;
  case "POWEREDIT":
    if (mouseX > width/5 * 3.5 - 20 && mouseX < width/5 * 3.5 + 30 && mouseY > height/5 * 2 - 30 && mouseY < height/5 * 2 + 20) {
      Mode = "GAME";
    }
    break;
  case "WEAPONSELECT":
    if (mouseX > width - 135 && mouseX < width - 75 && mouseY > 75 && mouseY < 135) {
      Mode = "GAME";
    }
    if (Turn == 1) {
      if (mouseX > 93 && mouseY > 216 && mouseX < 271 && mouseY < 269) {
        a.CurrentWeapon = 0;
        Mode = "GAME";
      }
      if (mouseX > 93 && mouseY > 216+60 && mouseX < 271 && mouseY < 269+60) {
        a.CurrentWeapon = 1;
        Mode = "GAME";
      }
      if (mouseX > 93 && mouseY > 216+60*2 && mouseX < 271 && mouseY < 269+60*2) {
        a.CurrentWeapon = 2;
        Mode = "GAME";
      }
      if (mouseX > 93 && mouseY > 216+60*3 && mouseX < 271 && mouseY < 269+60*3) {
        a.CurrentWeapon = 3;
        Mode = "GAME";
      }
      if (mouseX > 93 && mouseY > 216+60*4 && mouseX < 271 && mouseY < 269+60*4) {
        a.CurrentWeapon = 4;
        Mode = "GAME";
      }
      if (mouseX > 93+185 && mouseY > 216 && mouseX < 271+185 && mouseY < 269) {
        a.CurrentWeapon = 5;
        Mode = "GAME";
      }
      if (mouseX > 93+185 && mouseY > 216+60 && mouseX < 271+185 && mouseY < 269+60) {
        a.CurrentWeapon = 6;
        Mode = "GAME";
      }
      if (mouseX > 93+185 && mouseY > 216+60*2 && mouseX < 271+185 && mouseY < 269+60*2) {
        a.CurrentWeapon = 7;
        Mode = "GAME";
      }
      if (mouseX > 93+185 && mouseY > 216+60*3 && mouseX < 271+185 && mouseY < 269+60*3) {
        a.CurrentWeapon = 8;
        Mode = "GAME";
      }
      if (mouseX > 93+185 && mouseY > 216+60*4 && mouseX < 271+185 && mouseY < 269+60*4) {
        a.CurrentWeapon = 9;
        Mode = "GAME";
      }
      if (mouseX > 93+185*2 && mouseY > 216 && mouseX < 271+185*2 && mouseY < 269) {
        a.CurrentWeapon = 10;
        Mode = "GAME";
      }
      if (mouseX > 93+185*2 && mouseY > 216+60 && mouseX < 271+185*2 && mouseY < 269+60) {
        a.CurrentWeapon = 11;
        Mode = "GAME";
      }
      if (mouseX > 93+185*2 && mouseY > 216+60*2 && mouseX < 271+185*2 && mouseY < 269+60*2) {
        a.CurrentWeapon = 12;
        Mode = "GAME";
      }
      if (mouseX > 93+185*2 && mouseY > 216+60*3 && mouseX < 271+185*2 && mouseY < 269+60*3) {
        a.CurrentWeapon = 13;
        Mode = "GAME";
      }
      if (mouseX > 93+185*2 && mouseY > 216+60*4 && mouseX < 271+185*2 && mouseY < 269+60*4) {
        a.CurrentWeapon = 14;
        Mode = "GAME";
      }
    } else {
      if (mouseX > 93 && mouseY > 216 && mouseX < 271 && mouseY < 269) {
        b.CurrentWeapon = 0;
        Mode = "GAME";
      }
      if (mouseX > 93 && mouseY > 216+60 && mouseX < 271 && mouseY < 269+60) {
        b.CurrentWeapon = 1;
        Mode = "GAME";
      }
      if (mouseX > 93 && mouseY > 216+60*2 && mouseX < 271 && mouseY < 269+60*2) {
        b.CurrentWeapon = 2;
        Mode = "GAME";
      }
      if (mouseX > 93 && mouseY > 216+60*3 && mouseX < 271 && mouseY < 269+60*3) {
        b.CurrentWeapon = 3;
        Mode = "GAME";
      }
      if (mouseX > 93 && mouseY > 216+60*4 && mouseX < 271 && mouseY < 269+60*4) {
        b.CurrentWeapon = 4;
        Mode = "GAME";
      }
      if (mouseX > 93+185 && mouseY > 216 && mouseX < 271+185 && mouseY < 269) {
        b.CurrentWeapon = 5;
        Mode = "GAME";
      }
      if (mouseX > 93+185 && mouseY > 216+60 && mouseX < 271+185 && mouseY < 269+60) {
        b.CurrentWeapon = 6;
        Mode = "GAME";
      }
      if (mouseX > 93+185 && mouseY > 216+60*2 && mouseX < 271+185 && mouseY < 269+60*2) {
        b.CurrentWeapon = 7;
        Mode = "GAME";
      }
      if (mouseX > 93+185 && mouseY > 216+60*3 && mouseX < 271+185 && mouseY < 269+60*3) {
        b.CurrentWeapon = 8;
        Mode = "GAME";
      }
      if (mouseX > 93+185 && mouseY > 216+60*4 && mouseX < 271+185 && mouseY < 269+60*4) {
        b.CurrentWeapon = 9;
        Mode = "GAME";
      }
      if (mouseX > 93+185*2 && mouseY > 216 && mouseX < 271+185*2 && mouseY < 269) {
        b.CurrentWeapon = 10;
        Mode = "GAME";
      }
      if (mouseX > 93+185*2 && mouseY > 216+60 && mouseX < 271+185*2 && mouseY < 269+60) {
        b.CurrentWeapon = 11;
        Mode = "GAME";
      }
      if (mouseX > 93+185*2 && mouseY > 216+60*2 && mouseX < 271+185*2 && mouseY < 269+60*2) {
        b.CurrentWeapon = 12;
        Mode = "GAME";
      }
      if (mouseX > 93+185*2 && mouseY > 216+60*3 && mouseX < 271+185*2 && mouseY < 269+60*3) {
        b.CurrentWeapon = 13;
        Mode = "GAME";
      }
      if (mouseX > 93+185*2 && mouseY > 216+60*4 && mouseX < 271+185*2 && mouseY < 269+60*4) {
        b.CurrentWeapon = 14;
        Mode = "GAME";
      }
    }
    break;
  }
}
void explode(float a, float b) {
  int x = int(a);
  int y = int(b);
  println("HIT");
  Mode = "GAME";
  Turn = (Turn + 1) % 3;
  if (Turn == 0) {
    Turn = 1;
  }
}
boolean hitGround(PVector pos) {
  for (int i=(int)max(0, pos.x - 20); i<min(width, pos.x+20); i++) {
    for (int j=(int)max(0, pos.y - 20); j<min(height-150, pos.y+20); j++) {
      if(dist(i, j, pos.x, pos.y)<=15){
        if(map[j][i]!=0){
          return true;
        }
      }
    }
  }
  return false;
}
int[][] fillArray(int a, int b, int c) {
  int[][] d = new int[b][a];
  for (int i=0; i<a; i++) {
    for (int j=0; j<b; j++) {
      d[j][i] = c;
    }
  }
  return d;
}
void keyPressed() {
  Turn = (Turn + 1) % 3;
  if (Turn == 0) {
    Turn = 1;
  }
  //frameRate(1);
}
