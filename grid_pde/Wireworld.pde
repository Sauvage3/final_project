public class gameOfWireworld extends gameOfLife{
  color emptyColor = deadColor;
  //aka empty
  color electronHeadColor = color(#1421FC);
  color electronTailColor = color(#FC2814);
  color conductor = color(#FCF114);
  
 
  
  public int numOfElectronHeadNeighbors(int row, int column){
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
    int electronHeadCount  = 0;
    for(int r = startPosY; r < startPosY + viableRows; r++){
      for(int c = startPosX; c < startPosX + viableColumns; c++){
        if(grid[r][c] == aliveColor){
          electronHeadCount++;
        }
      }
    }
    return electronHeadCount;
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
  
  @Override
  public void initalizeGridForGame(int desiredSize){
   initializeEmptyGrid(desiredSize);
    
        
}
}
