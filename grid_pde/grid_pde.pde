color[][] grid;
float size;
float percentStartingAlive = 0.1;
float maxSize = 10.0;
int x = 0;
int y = 0;
int cellType;
fireModel test1 = new fireModel();

boolean setupDone = true;
//multiple of sreen size grid created too

  
boolean isDragging = false;
float zoomLev = 1;




  
void setup(){




  
  
  fullScreen();
  strokeWeight(2);
  stroke(#FFFFFF);
  textSize(18);
  

  test1.initializeGridForGame(0.54, 40.0);
  test1.displayGrid();
   isDragging = false;
 
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
  
/* if (key == '='){
   println("triggered");
   size += 10.0;
   test1.displayGrid();
 }
 if (key == '-' && size > 10.0){
   println("triggered");
   size -=10.0;
   test1.displayGrid();
 }
*/

 
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
 
  if(frameCount % 10 == 0){// && setupDone == true){
    
  test1.runGeneration();
  test1.displayGrid();
  }
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
  strokeWeight(zoomLev / 2.0);

  zoomLev = constrain(zoomLev, 1.0, 10.0);
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
