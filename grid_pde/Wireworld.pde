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
  

public void initializeGridForGame(float desiredSize) {
  size = desiredSize;
  int squareWidth = int(width * maxSize / size);
  int squareHeight = int(height * maxSize / size);
  grid = new color[squareHeight][squareWidth];
  for (int r = 0; r < squareHeight; r++) {
    for (int c = 0; c < squareWidth; c++) {
      if (random(0, 1) <= percentStartingAlive) {
        grid[r][c] = aliveColor;
      } else {
        grid[r][c] = deadColor;
      }
    }
  }
}

public void initializeEmptyGrid(float desiredSize) {
  size = desiredSize;
  int squareWidth = int(width * maxSize / size);
  int squareHeight = int(height * maxSize / size);
  grid = new color[squareHeight][squareWidth];
  for (int r = 0; r < squareHeight; r++) {
    for (int c = 0; c < squareWidth; c++) {
      grid[r][c] = deadColor;
    }
  }
}

public void displayGrid() {
  for (int r = 0; r < int(height / size); r++) {
    for (int c = 0; c < int(width / size); c++) {
      fill(grid[(r + int(y / size) + 2700) % 270][(c + int(x / size) + 4800) % 480]);
      square(c * size, r * size, size);
    }
  }
}

public void wireworldClickModify(int cellType, int xClick, int yClick) {
  int row = int(yClick / size);
  int column = int(xClick / size);
  if (cellType == 0) {
    grid[row][column] = conductor;
  } else if (cellType == 1) {
    grid[row][column] = electronHeadColor;
  }
  
  else if(cellType == 2 ){
    grid[row][column] = emptyColor;
  }
}

    
        

}
