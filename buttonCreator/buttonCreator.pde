public class button{
  float extent;
  float x;
  float y;
  boolean buttonPressed = false;
  boolean buttonHasValue = true;
  float buttonValue = 0.0;
  float defaultValue = 0.0;
  
  
  
  public button(float x, float y, float extent, float defaultValue){
    //default value should be set to 0.0 if button no value
    if(defaultValue != 0.0){
      this.defaultValue = defaultValue;
      this.buttonValue = defaultValue;
      this.buttonHasValue = true;
    }
    
    
    noStroke();
    fill(255);
    circle(x, y, extent);
    this.x = x;
    this.y = y;
    this.extent = extent;
  }
  
  public String toString(){
    String string = "";
    string += "x coor of button is: " + x;
    string += " y coor of button is: " + y;
    return string;
  }
  
  public boolean buttonHasValue(){
    return buttonHasValue;
  }
  
  //public void changeValue(){
  //  if(buttonHasValue){
  //    buttonValue = int(input
  public void labelButton(String text){
    textAlign(CENTER);
    fill(0);
    textSize(20);
    text(text, x , y - extent );
    textAlign(LEFT);
  }
  
  public void displayButtonValue(){
    if(!buttonHasValue){
      throw new Exception("this button has no value");
    }
    else{
      textAlign(CENTER);
    fill(0);
    textSize(20);
    text(text, x , y - extent );
    textAlign(LEFT);
  
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
  
    
