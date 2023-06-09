button button0;
button button1;
button button2;
button button3;
button button4;
button[] buttons =  new button[5];
int currentButtonIndex = 0;
String currentTyping = "";
Console test;


void setup(){
  noSmooth();
  fullScreen();
  textAlign(LEFT);
   test = new Console();
  fill(255);
   button0 = new button(100,100,40, 0.0, "");
   buttons[0] = button0;
   button1 = new button(200,100,40, 0.0, "");
      buttons[1] = button1;
   button2 = new button(300,100,40, 0.0, "");
      buttons[2] = button2;
   button3 = new button(400,100,40,93.0, "test");
      buttons[3] = button3;
   button4 = new button(500,100,40,1000.0, "button4");
        buttons[4] = button4;
       
        button3.displayButtonValue();
        button4.displayButtonValue();
        
}

void draw(){

}

void mouseClicked(){
  println(mouseX, mouseY);
  for(button ex: buttons){
  
;    if(ex.compareCoords(mouseX, mouseY)){
      if( !ex.isButtonPressed()){
    
        ex.pressButton();
       
        test.createUserPrompt(ex.getButtonLabel());
       
       delay(3000);
        ex.changeButtonValue(Float.parseFloat(test.getLastUserInput()));
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
    test.addText(currentTyping, true);
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
