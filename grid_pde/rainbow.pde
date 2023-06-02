public class rainbowGame extends gameOfLife {
  
  public color squareColor(color n1, color n2, color n3) {
    float red = red(n1) + red(n2) + red(n3);
    float green = green(n1) + green(n2) + green(n3);
    float blue = blue(n1) + blue(n2) + blue(n3);
    return color(red, green, blue);
  }

  public void runGeneration(){
    color[][] lastGenGrid = saveOldGrid();
    for(int r = 0; r < grid.length; r++){
      for(int c = 0; c < grid[0].length; c++){
        color dead = color(0, 0, 0);
        int aliveCells = numOfLiveNeighbors(r,c);
        if(lastGenGrid[r][c] == dead){
          if(aliveCells == 3){
            grid[r][c] = squareColor((neighborColors(r, c))[0], (neighborColors(r, c))[1], (neighborColors(r, c))[2]);
          }
        }
        else if(aliveCells < 2 || aliveCells > 3){
          grid[r][c] = dead;
        }
        
      }
    }
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
    color dead = color(0, 0, 0);  
    for(int r = startPosY; r < startPosY + viableRows; r++){
      for(int c = startPosX; c < startPosX + viableColumns; c++){
        if(r == row && c == column){
        }
        else if(grid[r][c] != dead){
          aliveCount++;
        }
      }
    }
    return aliveCount;
  }
  
  public color[] neighborColors(int row, int column) {
    color[] neighbors;
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
    color dead = color(0, 0, 0);  
    for(int r = startPosY; r < startPosY + viableRows; r++){
      for(int c = startPosX; c < startPosX + viableColumns; c++){
        if(r == row && c == column){
        }
        else if(grid[r][c] != dead){
          neighbors += grid[r][c];
        }
      }
    }
    return neighbors;
  }
  
  public void initalizeGridForGame(int desiredSize){
    size = desiredSize; 
    int squareWidth = width * maxSize / size;
    int squareHeight = height * maxSize / size;
     grid = new color[squareHeight][squareWidth];
    for(int r = 0; r < squareHeight; r++){
      for(int c = 0; c<squareWidth; c++){
        if(random(0,1) <= percentStartingAlive){
          grid[r][c] = squareColor(c, r);
        }
         else{
           grid[r][c] = color(0, 0, 0);
         }
        }
      }        
  }  

}
