color[][] grid;
int size;
float percentStartingAlive = 0.5;
gameOfLife currentGame = new gameOfLife();






  
void setup(){
  

  
  fullScreen();
  strokeWeight(4);
  stroke(#080202);
 
  currentGame.initalizeGridForGame(40);
 // color[][] test = worker.gridDuplicator();
  currentGame.displayGrid();
  //test1.test3();
}

void keyPressed(){

 if (key == '+'){
   println("triggered");
   size = size + 10;
   currentGame.displayGrid();
 }
 if (key == '-'){
   println("triggered");
   size = size - 10;
   currentGame.displayGrid();
 }
}

void draw(){
  
  
  if(frameCount % 10 == 0){
  currentGame.runGeneration();
  currentGame.displayGrid();
  }
}

//void mouseClicked(){
//  gridAdjustifier worker = new gridAdjustifier();
//  worker.gridModifierOnClick(mouseX, mouseY);
//}
