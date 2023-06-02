button button0;
button button1;
button button2;
button button3;
button button4;
button[] buttons =  new button[10];
int currentButtonIndex = 0;


void setup(){
  fullScreen();
   button0 = new button(100,100,40);
   buttons[currentButtonIndex++] = button0;
   button1 = new button(200,100,40);
      buttons[currentButtonIndex++] = button1;
   button2 = new button(300,100,40);
      buttons[currentButtonIndex++] = button2;
   button3 = new button(400,100,40);
      buttons[currentButtonIndex++] = button3;
   button4 = new button(500,100,40);
        buttons[currentButtonIndex++] = button4;
        
}

void draw(){
}

void mouseClicked(){
  println(mouseX, mouseY);
  for(int i = 0; i < buttons.length;i++){
    if(buttons[i].compareCoords(mouseX, mouseY)){
      buttons[i].pressButton();
    }
  }
}
//  if(mouseX >= 50 && mouseX <= 150){
//    button0.pressButton();
//  }
  
//   if(mouseX >= 150 && mouseX <= 250){
//    button1.pressButton();
//  }
  
//   if(mouseX >= 250 && mouseX <= 350){
//    button2.pressButton();
//  }
  
//   if(mouseX >= 350 && mouseX <= 450){
//    button3.pressButton();
//  }
  
//   if(mouseX >= 450 && mouseX <= 550){
//    button4.pressButton();
//  }
//}
