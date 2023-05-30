color[][] grid;
int size;
float percentStartingAlive = 0.1;
int maxSize = 10;
int x = 0;
int y = 0;
int cellType;
fireModel test1 = new fireModel();

boolean setupDone = true;
//multiple of sreen size grid created too

  
boolean isDragging;
float zoomLev = 1;




  
void setup(){

test1 = new fireModel();


  
  
  fullScreen();
  strokeWeight(2);
  stroke(#FFFFFF);
  textSize(18);
  

  test1.initalizeGridForGame(40);
  test1.displayGrid();
   isDragging = false;
 
}
void mousePressed() {

  if (mouseButton == RIGHT) {
    isDragging = true;
  }
}

void mouseReleased() {
 
  if (mouseButton == RIGHT) {
    isDragging = false;
  }
}
void keyPressed(){
  
 if (key == '='){
   println("triggered");
   size = size + 10;
   test1.displayGrid();
 }
 if (key == '-' && size > 10){
   println("triggered");
   size = size - 10;
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
 else{
   print(key);
 }
}

void draw(){
 
  if(frameCount % 10 == 0 && setupDone == true){
  test1.runGeneration();
  test1.displayGrid();
  }
   if (isDragging) {
    x = -1 * mouseY/25;
    y = -1 * mouseX/25;
    test1.displayGrid();
  }
  
  test1.displayGrid();
}
void mouseWheel(MouseEvent event) {
  // Check if the scroll wheel is moved
  float e = event.getCount();
  
  // Adjust the zoom level based on the scroll direction
  if (e > 0) {
    size += 1;
    
  } else {
    size -= 1;
    
  }
  
  // Constrain the zoom level within a certain range
  zoomLev = constrain(zoomLev, 0.1, 5.0);
}

//void mouseClicked(){
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
