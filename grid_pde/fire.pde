public class fireModel extends gameOfLife{
  color aliveColor = color(58,250,45);
  color emptyColor = color(5,5,5);
  color fireColor = color(245,30,10);
  

void initializeGridForGame(float startingPct, float desiredSize) {
  size = desiredSize;
  int squareWidth = int(width * maxSize / size);
  int squareHeight = int(height * maxSize / size);
  grid = new color[squareHeight][squareWidth];
  for (int r = 0; r < squareHeight; r++) {
    for (int c = 1; c < squareWidth; c++) {
      if (random(0, 1) <= startingPct) {
        grid[r][c] = aliveColor;
      } else {
        grid[r][c] = emptyColor;
      }
    }
  }
  
  for (int r = 0; r < grid.length; r++) {
    grid[r][0] = fireColor;
  }
}


 public void runGeneration(){
    color[][] lastGenGrid = super.saveOldGrid();
    for(int r = 0; r < grid.length; r++){
      for(int c = 0; c <grid[0].length; c++){
        
        if(lastGenGrid[r][c] == fireColor){
          if(r + 1 < grid.length && grid[r+1][c] == aliveColor){
          grid[r + 1][c] = fireColor;
          }
          if(c > 0 && grid[r ][c - 1] == aliveColor) {
          grid[r][c - 1] = fireColor;
          }
          if(c < grid[0].length && grid[r][c + 1] == aliveColor){
          grid[r][c + 1] = fireColor;
          }
          if(r > 0 && grid[r-1][c] == aliveColor){
          grid[r - 1][c] = fireColor;
          }
    }
  }
}
 }

public void displayGrid(){
    for(int r  = 0; r < height  / size;r++){
      for(int c = 0; c < width  / size;c++){
        fill(grid[(r + x + 2700)%270][(c + y + 4800)%480]);
        square(c * size, r * size, size);
      }
    }
  }

}
