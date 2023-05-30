public class fireModel extends gameOfLife{
  color aliveColor = color(58,250,45);
  color emptyColor = color(5,5,5);
  color fireColor = color(245,30,10);
  
  
  public void initalizeGridForGame(float startingPct, int desiredSize){
    size = desiredSize; 
    int squareWidth = width * maxSize / size;
    int squareHeight = height * maxSize / size;
     grid = new color[squareHeight][squareWidth];
    for(int r = 0; r < squareHeight; r++){
      for(int c = 0; c<squareWidth; c++){
        if(random(0,1) <= startingPct){
          grid[r][c] = aliveColor;
        }
         else{
           grid[r][c] = deadColor;
         }
        }
      }
    
        
}

 public void runGeneration(){
    color[][] lastGenGrid = super.saveOldGrid();
    for(int r = 0; r < grid.length; r++){
      for(int c = 0; c<grid[0].length; c++){
        if(lastGenGrid[r][c] == fireColor){
          grid[r + 1][c] = fireColor;
          grid[r - 1][c] = fireColor;
          grid[r][c - 1] = fireColor;
          grid[r][c + 1] = fireColor;
          
        
      }
    }
  }
}

}
