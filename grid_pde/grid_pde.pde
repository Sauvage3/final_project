color[][] grid;
int size;



 public class gridAdjustifier{
  public void gridIniator(int desiredSize){
    size = desiredSize; 
    int squareWidth = width * 3 / size;
    int squareHeight = height * 3 / size;
   
    grid = new color[squareHeight][squareWidth];
    for(int r = 0; r < squareHeight; r++){
      for(int c  = 0; c < squareWidth;c++){
        grid[r][c] = color(#8E8888);
      }
    }
  }
    
  
  public void gridModifierOnClick(int x, int y){
    println(x);
    println(y);
    println("triggered");
    int r = y / size;
    int c = x / size;
    println(r);
    println(c);
    grid[r][c] = color(#C10A0A);
  }
  
  public void displayGrid(){
    for(int r  = 0; r < height  / size;r++){
      for(int c = 0; c < width  / size;c++){
       
        fill(grid[r][c]);
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
<<<<<<< HEAD
  
  worker.displayGrid();
  test1.test3();
=======
 // color[][] test = worker.gridDuplicator();
  worker.displayGrid();
  //test1.test3();
>>>>>>> daniele20
}

void keyPressed(){
 gridAdjustifier worker = new gridAdjustifier();
 if (key == '+'){
   size = size + 10;
   worker.displayGrid();
 }
 if (key == '-'){
   size = size - 10;
   worker.displayGrid();
 }
}

void draw(){
  //gridAdjustifier worker = new gridAdjustifier();
  //worker.displayGrid();
}

//void mouseClicked(){
//  gridAdjustifier worker = new gridAdjustifier();
//  worker.gridModifierOnClick(mouseX, mouseY);
//}
