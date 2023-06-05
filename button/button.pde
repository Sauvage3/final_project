public class button{
  float extent;
  float x;
  float y;
  boolean buttonPressed = false;
  public button(float x, float y, float extent){
    
    noStroke();
    fill(255);
    circle(x, y, extent);
    this.x = x;
    this.y = y;
    this.extent = extent;
  }
  
  public void labelButton(String text){
    text(text, x, y + 50);
  }
  
  public boolean isButtonPressed(){
    return buttonPressed;
  }
  
  public boolean compareCoords(float inpx, float inpy){
    if(inpx >= x - extent && inpx <= x + extent && inpy >= y - extent && inpy <= y + extent){
      return true;
    }
    else{
      return false;
    }
  }
  
  
  public void pressButton(){
    fill(0);
    circle(x,y,37);
    buttonPressed = true;
  }
  
  public void resetButton(){
    fill(255);
    circle(x,y,40);
    buttonPressed = false;
  }
  
}
  
    
