



public class gameOfLife{
  color aliveColor =  color(23,188,32);
  color deadColor =  color(173,26,26);
  
  public int[][] saveOldGrid(){
    color[][] oldGrid = new color[grid.length][grid[0].length];
    for(int r = 0; r< grid.length;r++){
      for(int c = 0; c < grid[0].length; c++){
        oldGrid[r][c] = grid[r][c];
      }
    }
    return oldGrid;

  }
  
  public int numOfLiveNeighbors(int row, int column){
    int startPosY = row - 1;
    int startPosX = column - 1;
    int viableRows = 3;
    int viableColumns = 3;
    if(row < 1){
      startPosY = row;
      viableRows = 2;
    }
    if(column < 1){
      startPosX = column;
      viableColumns = 2;
    }
    if(row >= grid.length - 1){
      viableRows = 2;
    }
    if(column >= grid[0].length - 1){
      viableColumns = 2;
    }
    int aliveCount  = 0;
    for(int r = startPosY; r < startPosY + viableRows; r++){
      for(int c = startPosX; c < startPosX + viableColumns; c++){
        if(grid[r][c] == aliveColor){
          aliveCount++;
        }
      }
    }
    return aliveCount;
  }
      
      
      
      
  public void runGeneration(){
    color[][] lastGenGrid = saveOldGrid();
    for(int r = 0; r < grid.length; r++){
      for(int c = 0; c<grid[0].length; c++){
        int aliveCells = numOfLiveNeighbors(r,c);
        if(lastGenGrid[r][c] == deadColor){
          if(aliveCells == 3){
            grid[r][c] = aliveColor;
          }
        }
        else if(aliveCells < 2 || aliveCells > 3){
          grid[r][c] = deadColor;
        }
        
      }
    }
  }
  
  public void initalizeGridForGame(int desiredSize){
    
    size = desiredSize; 
    int squareWidth = width * 3 / size;
    int squareHeight = height * 3 / size;
    grid = new color[squareHeight][squareWidth];
    for(int r = 0; r <  squareHeight; r++){
      for(int c = 0; c<squareWidth; c++){
        float randomNum = random(0,1);
        if(randomNum <= percentStartingAlive){
          grid[r][c] = aliveColor;
          
        }
         else{
           grid[r][c] = deadColor;
         
         }
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


  
