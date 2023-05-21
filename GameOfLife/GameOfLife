 class grid{
  color[][] board;
  int size;
  color aliveColor = color(#2F64CB);
  color deadColor = color(#CB2F54);
  
  public grid(int size){
    this.size = size;
    board = new color[height/size][width / size];
  } 
  public void fillGrid(){
    
  for(int r = 0;r < height/size;r++){
      for(int c = 0;c< width/size; c++){
        board[r][c] = color(#C4B2B2);
      }
  }
 }
 
 public void adjustCell(int x, int y){
   int row = y / size;
   int column = x / size;
   board[row][column] = aliveColor;
 }
 }
 
 grid newgrid = new grid(40);
  
  void setup(){
    fullScreen();
    
    newgrid.fillGrid();
     for(int r = 0;r < height/newgrid.size;r++){
      for(int c = 0;c< width/newgrid.size; c++){
        stroke(0);
        fill(newgrid.board[r][c]);
        square(c * newgrid.size, r * newgrid.size, newgrid.size);
      }
    }
  }
  
  void draw(){
  }
  
  void mouseClicked(){
    newgrid.adjustCell(mouseX, mouseY);
  }
    
  
 

    
   
