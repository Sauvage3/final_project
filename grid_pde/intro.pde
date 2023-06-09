color[][] grid;
float size;
float percentStartingAlive = 0.1;
float maxSize = 10.0;
int x = 0;
int y = 0;
int cellType;
gameOfLife test1;
button sizeVal;
button percentStartingAliveVal;
button maxSizeVal;
button game1;
button game2;
button game3;
button game4;
button done;
button[] buttons =  new button[8];
button[] buttonsWValues = new button[3];
Console test;
boolean isButtonPressed = false;
button buttonPressed;
int currentButtonIndex = 0;
String currentTyping = "";
boolean setupFinished = false;
boolean gameInitalzied = false;
float strokeWeight = 3.0;


boolean setupDone = true;
//multiple of sreen size grid created too


boolean isDragging = false;
float zoomLev = 3;

  
void setup(){
   noSmooth();
  fullScreen();
  textAlign(LEFT);
   test = new Console();
  fill(255);
  fullScreen();
  strokeWeight(2);
  stroke(#FFFFFF);
  textSize(18);
  
  sizeVal = new button(100,200,40, 0.0, "Size");
   buttons[0] = sizeVal;
   buttonsWValues[0] = sizeVal;
   
     percentStartingAliveVal = new button(100,400,40, 0.0, "Percent starting alive");
   buttons[1] = percentStartingAliveVal;
    buttonsWValues[1] = percentStartingAliveVal;
   
     maxSizeVal = new button(100,600,40, 0.0, "Max Size");
   buttons[2] = maxSizeVal;
   buttonsWValues[2] = maxSizeVal;
   
     done = new button(100,1200,40, 0.0, "Done with settings");
   buttons[3] = done;
   
     game1 = new button(100,800,40, 0.0, "Base Game");
   buttons[4] = game1;
   
     game2 = new button(100,1000,40, 0.0, "Wireworld");
   buttons[5] = game2;
   
     game3 = new button(300,800,40, 0.0, "Fire Sim");
   buttons[6] = game3;
   
       game4 = new button(300,1000,40, 0.0, "Rainbow World");
   buttons[7] = game4;
   fill(0);
   textSize(80);
   text("Variations on Game of Life", 1500, 300);
   textSize(30);
   text("Made by Daniel, Daniel, and Chenkai", 1700, 600);
   text("Click the top 3 buttons to set your values, then pick a game mode and hit done", 1500, 800);



  // isDragging = false;
 
}
//void mousePressed() {
//  if(test1 instanceof fireModel){
//  }
  
//  else if (mouseButton == RIGHT) {
//    isDragging = true;
//  }
//}

//void mouseReleased() {
//  if(test1 instanceof fireModel){
//  }
  
//  else if (mouseButton == RIGHT) {
//    isDragging = false;
//  }
//}
void keyPressed(){
  
  if(setupFinished){
  
 if (key == '='){
   println("triggered");
   size += 10.0;
   test1.displayGrid();
 }
 if (key == '-' && size > 10.0){
   println("triggered");
   size -=10.0;
   test1.displayGrid();
 }
 
 if(key == '0'){
   cellType = 0;
 }
 
 if(key == '1'){
   cellType = 1;
 }
 
 if(key == '2'){
   cellType = 2;
 }
 
 if(key == '7'){
   cellType = 47;
 }
 
 if(key == 10){
   setupDone = true;
 }
   
   
  }
  else{
  if(key == 10 && currentTyping.length() > 0){
    test.addText(currentTyping, true);
    currentTyping = "";
  }
  
  else if(Character.isDefined(key) && key != 10){
    currentTyping += key;
  }
 else{
   print(key);
 }
}
}

void draw(){
  
 
  
    if(setupFinished){
      
      if(!gameInitalzied){
        strokeWeight(strokeWeight);
         if( game1.isButtonPressed()){
     test1 = new gameOfLife();
     test1.initializeGridForGame(size);
   }
   else if(game2.isButtonPressed()){
     test1 = new gameOfWireworld();
      test1.initializeEmptyGrid(size);
  
   }
   else if(game3.isButtonPressed()){
     test1 = new fireModel();
        test1.initializeGridForGameFire(percentStartingAlive, size);
   
   }
   else{
     test1 = new rainbowGame();
       test1.initializeGridForGame(size);
   }
      
        
         test1.displayGrid();
        gameInitalzied = true;
      }
 
  if(frameCount % 10 == 0){// && setupDone == true){
    stroke(255);
  test1.runGeneration();
  test1.displayGrid();
  test1.displayText();
  }
  }
        
  else{
       if(isButtonPressed){
    if(!test.getLastUserInput().equals("")){
      if(buttonPressed.equals(percentStartingAliveVal) && Float.parseFloat(test.getLastUserInput()) > 1){
         buttonPressed.changeButtonValue(Float.parseFloat(test.getLastUserInput()) / 100);
      }
      else{
      buttonPressed.changeButtonValue(Float.parseFloat(test.getLastUserInput()));
      }
      isButtonPressed = false;
      test.resetUserInput();
    }
  }
  
  if(done.isButtonPressed()){
    whenDone();
    }}
 }
//  }
//   if (isDragging) {
//    x = -1 * mouseY/25;
//    y = -1 * mouseX/25;
//    test1.displayGrid();
//  }
  
//}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
if(setupFinished){
  if (e > 0) {
    zoomLev += 0.1;
    strokeWeight += .55;
  } else if (zoomLev > 0.2) {
    zoomLev -= 0.1;
    strokeWeight -= .55;
  }

  size = maxSize * zoomLev;
  strokeWeight(strokeWeight);

  zoomLev = constrain(zoomLev, 1, 10.0);
}
}



void mouseClicked(){
 
    
     if(setupFinished){
         if(test1 instanceof gameOfWireworld){
    test1.wireworldClickModify(cellType, mouseX,mouseY);
     test1.displayGrid();
  }
  else{
 test1.clickModify(mouseX, mouseY);
 test1.displayGrid();
  }
     }
  
  else{
     for(button ex: buttons){
  
   if(ex.compareCoords(mouseX, mouseY)){
      if( !ex.isButtonPressed()){
    
        ex.pressButton();
        
        if(isIn(buttonsWValues, ex)){
        isButtonPressed = true;
        buttonPressed = ex;
       
        test.createUserPrompt(ex.getButtonLabel());
        
        }
      
     
      }
      else{
        ex.resetButton();
    }
    }
    


      
      
    }
}
}

boolean isIn(button[] givenArray, button button){
  for(button checker:givenArray){
    if(button.equals(checker)){
      return true;
    }
  }
  return false;
}

void whenDone(){
  size = sizeVal.getButtonValue();
  

      maxSize = maxSizeVal.getButtonValue();
        percentStartingAlive = percentStartingAliveVal.getButtonValue();
       test.addText(Float.toString(size), false);
       test.addText(Float.toString(maxSize), false);
       test.addText(Float.toString(percentStartingAlive), false);
       test.addText(Boolean.toString(game3.isButtonPressed()), false);
       
       done.resetButton();
       setupFinished = true;
}
      
  
////  setupDone = false;
//  if(test1 instanceof gameOfWireworld){
//    test1.wireworldClickModify(cellType, mouseX,mouseY);
//     test1.displayGrid();
//  }
//  else{

//}
