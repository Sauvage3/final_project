button button0;
button button1;
button button2;
button button3;
button button4;
button[] buttons =  new button[5];
int currentButtonIndex = 0;
String currentTyping;
Console test;


void setup(){
  fullScreen();
  textAlign(LEFT);
   test = new Console();
  fill(255);
   button0 = new button(100,100,40, 0.0);
   buttons[0] = button0;
   button1 = new button(200,100,40, 0.0);
      buttons[1] = button1;
   button2 = new button(300,100,40, 0.0);
      buttons[2] = button2;
   button3 = new button(400,100,40,0.0);
      buttons[3] = button3;
   button4 = new button(500,100,40,0.0);
        buttons[4] = button4;
        button4.labelButton("button4");
        
}

void draw(){
  
}

void mouseClicked(){
  println(mouseX, mouseY);
  for(button ex: buttons){
  
    if(ex.compareCoords(mouseX, mouseY)){
      if( !ex.isButtonPressed()){
        ex.pressButton();
      }
      else{
        ex.resetButton();
    }
    }
    
  
      
      
    }
  }


void keyPressed(){
  println(key);
  if(key == 10 && currentTyping.length() > 0){
    test.addText(currentTyping);
    currentTyping = "";
  }
  
  else if(Character.isDefined(key) && key != 10){
    currentTyping += key;
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
