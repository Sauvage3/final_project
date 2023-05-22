color[][] grid;
int size;
float percentStartingAlive = 0.1;
int maxSize = 10;
int x = 0;
int y = 0;
//multiple of sreen size grid created too





 public class gridAdjustifier{
  public void gridIniator(int desiredSize){
    size = desiredSize; 
    int squareWidth = width * maxSize / size;
    int squareHeight = height * maxSize / size;
    grid = new color[squareHeight][squareWidth];
    for(int r = 0; r < squareHeight; r++){
      for(int c  = 0; c < squareWidth;c++){
        grid[r][c] = color(#8E8888);
      }
    }
  }
  
  public void displayGrid(){
    for(int r  = 0; r < height  / size;r++){
      for(int c = 0; c < width  / size;c++){
        fill(grid[(r + x + 2700)%270][(c + y + 4800)%480]);
        square(c * size, r * size, size);
      }
    }
  }
  
  
 }

  
void setup(){
  gridAdjustifier worker = new gridAdjustifier();
  gameOfLife test1 = new gameOfLife();
  
  fullScreen();
  strokeWeight(4);
  stroke(#080202);
  worker.gridIniator(40);

  test1.initalizeGridForGame();

  worker.displayGrid();
 
}

void keyPressed(){
 gridAdjustifier worker = new gridAdjustifier();
 if (key == '='){
   println("triggered");
   size = size + 10;
   worker.displayGrid();
 }
 if (key == '-' && size > 10){
   println("triggered");
   size = size - 10;
   worker.displayGrid();
 }
 if (key == 'w') {
  x = x - 5;
  worker.displayGrid();
 }
 if (key == 'a') {
  y = y - 5;
  worker.displayGrid();
 }
 if (key == 's') {
  x = x + 5;
  worker.displayGrid();
 }
 if (key == 'd') {
  y = y + 5;
  worker.displayGrid();
 }
}

void draw(){
  gameOfLife test2 = new gameOfLife();
  gridAdjustifier worker = new gridAdjustifier();
  if(frameCount % 10 == 0){
  test2.runGeneration();
  worker.displayGrid();
  }
}

//void mouseClicked(){
//  gridAdjustifier worker = new gridAdjustifier();
//  worker.gridModifierOnClick(mouseX, mouseY);
//}
