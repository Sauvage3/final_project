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
button done;
button[] buttons =  new button[6];
Console test;
boolean isButtonPressed = false;
button buttonPressed;


//boolean setupDone = true;
//multiple of sreen size grid created too


boolean isDragging = false;
float zoomLev = 1;

  
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
  
  sizeVal = new button(100,100,40, 0.0, "Size");
   buttons[0] = sizeVal;
   
     percentStartingAliveVal = new button(100,200,40, 0.0, "Percent starting alive");
   buttons[1] = percentStartingAliveVal;
   
     maxSizeVal = new button(100,300,40, 0.0, "Max Size");
   buttons[2] = maxSizeVal;
   
     done = new button(100,700,40, 0.0, "Done with settings");
   buttons[3] = done;
   
     game1 = new button(100,400,40, 0.0, "game1");
   buttons[4] = game1;
   
     game2 = new button(100,500,40, 0.0, "game2");
   buttons[5] = game2;

  //test1.initializeGridForGame(40.0);
  //test1.displayGrid();
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
   //setupDone = true;
 }
 else{
   print(key);
 }
}

void draw(){
 
  //if(frameCount % 10 == 0){// && setupDone == true){
    
  //test1.runGeneration();
  //test1.displayGrid();
  //test1.displayText();
  //}
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

  if (e > 0) {
    zoomLev += 0.1;
  } else if (zoomLev > 0.2) {
    zoomLev -= 0.1;
  }

  size = maxSize * zoomLev;
  strokeWeight(2.0 / zoomLev);

  zoomLev = constrain(zoomLev, 1.0, 10.0);
}



void mouseClicked(){
  for(button ex: buttons){
  
   if(ex.compareCoords(mouseX, mouseY)){
      if( !ex.isButtonPressed()){
    
        ex.pressButton();
        isButtonPressed = true;
        buttonPressed = ex;
       
        test.createUserPrompt(ex.getButtonLabel());
        
        
      
     
      }
      else{
        ex.resetButton();
    }
    }
    
  
      
      
    }
}
//  setupDone = false;
//  if(test1 instanceof gameOfWireworld){
//    test1.wireworldClickModify(cellType, mouseX,mouseY);
//     test1.displayGrid();
//  }
//  else{
 
// test1.clickModify(mouseX, mouseY);
// test1.displayGrid();
//  }
//}
