import java.util.Random;
public class rainbowGame extends gameOfLife {

  public int squareColor(int n1, int n2, int n3) {
    float red = (red(n1) + red(n2) + red(n3)) / 3 + 15;
    float green = (green(n1) + green(n2) + green(n3)) / 3 + 15;
    float blue = (blue(n1) + blue(n2) + blue(n3)) / 3 + 15;
    return color(red, green, blue);
  }

  public void runGeneration() {
    int[][] lastGenGrid = saveOldGrid();
    for (int r = 0; r < grid.length; r++) {
      for (int c = 0; c < grid[0].length; c++) {
        int dead = color(0, 0, 0);
        int aliveCells = numOfLiveNeighbors(r, c);
        if (lastGenGrid[r][c] == dead) {
          if (aliveCells == 3) {
            grid[r][c] = squareColor(neighborColors(r, c)[0], neighborColors(r, c)[1], neighborColors(r, c)[2]);
          }
        } else if (aliveCells < 2 || aliveCells > 3) {
          grid[r][c] = dead;
        }
      }
    }
  }

  public int numOfLiveNeighbors(int row, int column) {
    int startPosY = row - 1;
    int startPosX = column - 1;
    int viableRows = 3;
    int viableColumns = 3;

    if (row < 1) {
      startPosY = row;
      viableRows = 2;
    }
    if (column < 1) {
      startPosX = column;
      viableColumns = 2;
    }
    if (row >= grid.length - 1) {
      viableRows = 2;
    }
    if (column >= grid[0].length - 1) {
      viableColumns = 2;
    }
    int aliveCount = 0;
    int dead = color(0, 0, 0);
    for (int r = startPosY; r < startPosY + viableRows; r++) {
      for (int c = startPosX; c < startPosX + viableColumns; c++) {
        if (r == row && c == column) {
        } else if (grid[r][c] != dead) {
          aliveCount++;
        }
      }
    }
    return aliveCount;
  }

  public int[] neighborColors(int row, int column) {
    int[] neighbors = new int[8];
    int startPosY = row - 1;
    int startPosX = column - 1;
    int viableRows = 3;
    int viableColumns = 3;

    if (row < 1) {
      startPosY = row;
      viableRows = 2;
    }
    if (column < 1) {
      startPosX = column;
      viableColumns = 2;
    }
    if (row >= grid.length - 1) {
      viableRows = 2;
    }
    if (column >= grid[0].length - 1) {
      viableColumns = 2;
    }
    int aliveCount = 0;
    int dead = color(0, 0, 0);
    for (int r = startPosY; r < startPosY + viableRows; r++) {
      for (int c = startPosX; c < startPosX + viableColumns; c++) {
        if (r == row && c == column) {
        } else if (grid[r][c] != dead) {
          aliveCount++;
          neighbors[aliveCount] = grid[r][c];
        }
      }
    }
    return neighbors;
  }

public void displayText(){
  int living = 0;
  int dead = 0;
  
    for (int r = 0; r < grid.length; r++) {
    for (int c = 0; c < grid[0].length; c++) {
      if (grid[r][c] != color(0, 0, 0)){
        living++;
      } else {
        dead++;
      }
    }
  }
  
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("Alive Cells: " + living, width / 2, height - 30);
  text("Dead Cells: " + dead, width / 2, height - 10);
}

  @Override
public void initializeGridForGame(float desiredSize) {
    size = desiredSize;
    int squareWidth = int(width * maxSize / size);
    int squareHeight = int(height * maxSize / size);
    grid = new int[squareHeight][squareWidth];
    Random random = new Random();
    for (int r = 0; r < squareHeight; r++) {
      for (int c = 0; c < squareWidth; c++) {
        if (random.nextFloat() <= percentStartingAlive) {
          int red = random.nextInt(256);
          int green = random.nextInt(256);
          int blue = random.nextInt(256);
          grid[r][c] = color(red, green, blue);
        } else {
          grid[r][c] = color(0, 0, 0);
        }
      }
    }
  }

}
