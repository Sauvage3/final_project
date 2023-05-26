color[][] grid;
int size;
float percentStartingAlive = 0.1;
int maxSize = 10;
int x = 0;
int y = 0;
//multiple of sreen size grid created too
gameOfLife test1 = new gameOfLife();





  
void setup(){
  
  
  fullScreen();
  strokeWeight(4);
  stroke(#080202);
  

  test1.initalizeGridForGame(40);
  test1.displayGrid();
 
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
 if (key == 'w') {
  x = x - 5;
  test1.displayGrid();
 }
 if (key == 'a') {
  y = y - 5;
  test1.displayGrid();
 }
 if (key == 's') {
  x = x + 5;
  test1.displayGrid();
 }
 if (key == 'd') {
  y = y + 5;
  test1.displayGrid();
 }
}

void draw(){
 
  if(frameCount % 10 == 0){
  test1.runGeneration();
  test1.displayGrid();
  }
}

//void mouseClicked(){
//  gridAdjustifier worker = new gridAdjustifier();
//  worker.gridModifierOnClick(mouseX, mouseY);
//}
