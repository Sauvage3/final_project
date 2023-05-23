public class gameOfWireworld{
  color emptyColor = color(#000000);
  color electronHeadColor = color(#1421FC);
  color electronTailColor = color(#FC2814);
  color conductor = color(#FCF114);
  
  public int[][] saveOldGrid(){
    color[][] oldGrid = new color[grid.length][grid[0].length];
    for(int r = 0; r< grid.length;r++){
      for(int c = 0; c < grid[0].length; c++){
        oldGrid[r][c] = grid[r][c];
      }
    }
    return oldGrid;

  }
  
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
        if(r == row && c == column){
        }
        
        else if(grid[r][c] == electronHeadColor){
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
        int electronHeadNeighbors = numOfElectronHeadNeighbors(r,c);
        if(lastGenGrid[r][c] == emptyColor){
        }
        else if(lastGenGrid[r][c] == electronHeadColor){
          grid[r][c] = electronTailColor;
        }
        else if(lastGenGrid[r][c] == electronTailColor){
          grid[r][c] = conductor;
        }
        else if(electronHeadNeighbors == 1 || electronHeadNeighbors == 2){
          grid[r][c] = electronHeadColor;
        }d
        
      }
    }
  }
  
  public void initalizeGridForGame(){
    for(int r = 0; r < grid.length; r++){
      for(int c = 0; c<grid[0].length; c++){
        grid[r][c] = emptyColor;
    
        
}
}
  }
}
