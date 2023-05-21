



public class gameOfLife{
  color aliveColor =  color(#17BC20);
  color deadColor =  color(#AD1A1A);
  
  public int[][] saveOldGrid(){
    color[][] oldGrid = new color[grid.length][grid[0].length];
    for(int r = 0; r< grid.length;r++){
      for(int c = 0; c < grid[0].length; c++){
        oldGrid[r][c] = grid[r][c];
      }
    }
    return saveOldGrid();
  }
  
  public int numOfLiveNeighbors(int row, int column){
    int startPosY = row - 1;
    int startPosX = column - 1;
    int viableRows = 3;
    int viableColumns = 3;
    if(row !> 1){
      startPosY = row;
      viableRows = 2;
    }
    if(column !> 1){
      startPosX = column;
      viableColumns = 2;
    }
    if(row <= grid.length){
      
  public void runGeneration(){
    color[][] lastGenGrid = saveOldGrid();
    for(int r = 0; r < r.grid.length; r++){
      for(int c = 0; c<grid[0].length; c++){
        
}
