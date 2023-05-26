public class rainbowGame extends gameOfLife {
  
  public color squareColor(int x, int y) {
    int green = (x + 25500)%255;
    int blue = (y + 25500)%255;
    return color(0, green, blue);
  }
  
    public void runGeneration(){
    color[][] lastGenGrid = saveOldGrid();
    for(int r = 0; r < grid.length; r++){
      for(int c = 0; c<grid[0].length; c++){
        color alive = squareColor(c, r);
        aliveColor = alive;
        deadColor = color(0, 0, 0);
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
}
