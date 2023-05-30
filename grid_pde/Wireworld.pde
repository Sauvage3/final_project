public class gameOfWireworld extends gameOfLife{
  color emptyColor = deadColor;
  //aka empty
  color electronHeadColor = color(67,17,209);
  color electronTailColor = color(232,53,33);
  color conductor = color(228,232,33);
  color[][] modifiedGridCells;
  color[][] lastGenGrid;
  
  public gameOfWireworld(){
    println("constructed new wireworld");
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
        
        else if(lastGenGrid[r][c] == electronHeadColor){
          electronHeadCount++;
        }
      }
    }
    return electronHeadCount;
  }
      
      
      
  @Override    
  public void runGeneration(){
    lastGenGrid = saveOldGrid();
    for(int r = 0; r < grid.length; r++){
      for(int c = 0; c<grid[0].length; c++){
        int electronHeads = numOfElectronHeadNeighbors(r,c);
        
        color center = lastGenGrid[r][c];
        if(center == emptyColor){
        }
        else if(center == electronHeadColor){
          grid[r][c] = electronTailColor;
        }
        else if(center == electronTailColor){
          grid[r][c] = conductor;
        }
        else if(electronHeads == 1 || electronHeads == 2){
          grid[r][c] = electronHeadColor;
        }
      }
    }
  }
  
  @Override
  public void initalizeGridForGame(int desiredSize){
   super.initializeEmptyGrid(desiredSize);
   modifiedGridCells = new color[grid.length][grid[0].length];
  }
  
@Override
    public void displayGrid(){
    for(int r  = 0; r < height  / size;r++){
      for(int c = 0; c < width  / size;c++){
        fill(grid[(r + x + 2700)%270][(c + y + 4800)%480]);
        square(c * size, r * size, size);
        
      }
    }
  }
  
  
   public void wireworldClickModify(int cellType, int x, int y){
     
    
    color[] types = {emptyColor, electronHeadColor, conductor};
    int magicNum = 47;
    
    int row = y / size;
    int column = x / size;
    if(cellType == magicNum){
      println(numOfElectronHeadNeighbors(row,column));
    }
    else if(grid[row][column] != types[cellType]){
      modifiedGridCells[row][column] = grid[row][column];
      grid[row][column] = types[cellType];
    }
    else{
      grid[row][column] = modifiedGridCells[row][column] ;
      modifiedGridCells[row][column] = 0;
    }
}
    
        

}
