color[][] grid;
int size;
float percentStartingAlive = 0.1;
int maxSize = 10;
int x = 0;
int y = 0;
int cellType;
boolean setupDone = false;
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
 
 if(key == '0'){
   cellType = 0;
 }
 
 if(key == '1'){
   cellType = 1;
 }
 
 if(key == '2'){
   cellType = 2;
 }
 
 if(key == '0'){
   cellType = 2;
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
}

void mouseClicked(){
  setupDone = false;
  //if(test1 instanceof gameOfWireworld){
  //  test1.clickModify(cellType, mouseX,mouseY);
  //   test1.displayGrid();
  //}
  //else{
 
 test1.clickModify(mouseX, mouseY);
 test1.displayGrid();
}
