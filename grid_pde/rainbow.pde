public class rainbowGame extends gameOfLife {
  
  public color squareColor() {
    float green = random(50, 255);
    float blue = random(50, 255);
    return color(0, green, blue);
  }

  public void runGeneration(){
    color[][] lastGenGrid = saveOldGrid();
    for(int r = 0; r < grid.length; r++){
      for(int c = 0; c<grid[0].length; c++){
        color alive = squareColor();
        color dead = color(0, 0, 0);
        int aliveCells = numOfLiveNeighbors(r,c);
        if(lastGenGrid[r][c] == dead){
          if(aliveCells == 3){
            grid[r][c] = alive;
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
    color alive = squareColor();
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
}

