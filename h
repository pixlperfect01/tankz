PrintWriter output;
PImage i;
boolean selected1, selected2;
String a = "Hello", b = "";
void setup() {
  fullScreen();
  i = loadImage("image.png");
  output = createWriter("o.txt");
}
void draw() {
  println(mouseX, mouseY);
  imageMode(CENTER);
  image(i, width/2, height/2);
  fill(0);
  textSize(16);
  if (selected1 && frameCount % 120 < 61) {
    text(a + "|", 515, 472, 260, 30);
  } else {
    text(a, 515, 472, 260, 30);
  }
  for (int j=0; j<min(b.length(), 21); j++) {
    ellipse(520 + j*12, 520, 7, 7);
    if(selected2 && frameCount % 120 < 61 && j == min(b.length(), 21)-1){
      line(516 + (j+1)*12, 512, 516 + (j+1)*12, 528);
    }
  }
}
void keyPressed() {
  String j = "qwertyuioplkjhgfdsazxcvbnmMNBVCXZLKJHGFDSAPOIUYTREWQ[]{}\\|1234567890!@#$%^&*()-=_+`~,./<>?;':\"";
  if (j.indexOf(key) > -1 ) {
    if (selected1) {
      a += key;
    } else if (selected2) {
      b += key;
    }
  }
  if(keyCode == DELETE){
    String l = "";
    if(selected1){
      for(int k=0;k<a.length()-1;k++){
        l += a.charAt(k);
      }
      a = l;
    } else if(selected1){
      for(int k=0;k<a.length()-1;k++){
        l += a.charAt(k);
      }
      a = l;
    }
  }
}
void mousePressed() {

  if (mouseX > 513 && mouseY > 471 && mouseX < 773 && mouseY < 496) {
    selected1 = true;
    selected2 = false;
  } else  if (mouseX > 513 && mouseY > 509 && mouseX < 773 && mouseY < 534) {
    selected1 = false;
    selected2 = true;
  } else  if (mouseX > 451 && mouseY > 598 && mouseX < 682 && mouseY < 634) {
    output.println(a +"\t\t\t" + b);
    output.flush();
    output.close();
    exit();
  } else  if (mouseX > 687 && mouseY > 598 && mouseX < 918 && mouseY < 634) {
    exit();
  } else {
    selected1 = false;
    selected2 = false;
  }
}
