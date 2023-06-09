public class button{
  float extent;
  float x;
  float y;
  boolean buttonPressed = false;
  boolean buttonHasValue = false;
  float buttonValue = 0.0;
 
  String buttonLabel = "";
  
  
  
  public button(float x, float y, float extent, float value, String label){

    if(value != 0.0){
      this.buttonValue = value;
      this.buttonHasValue = true;
      textAlign(CENTER);
    fill(0);
    textSize(20);
    text(buttonValue, x , y + extent );
    textAlign(LEFT);
    }
      
    if(label != ""){  
      this.buttonLabel = label;
    textAlign(CENTER);
    fill(0);
    textSize(20);
    text(buttonLabel, x , y - extent );
    textAlign(LEFT);
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
  
  public String getButtonLabel(){
    if(buttonLabel.equals("")){
      return "";
    }
    else{
      return buttonLabel;
    }
  }
  
  //public void changeValue(){
  //  if(buttonHasValue){
  //    buttonValue = int(input

  
  public void displayButtonValue(){
    if(!buttonHasValue){
     
    }
    else{
      textAlign(CENTER);
    fill(0);
    textSize(20);
    text(buttonValue, x , y + extent );
    textAlign(LEFT);
    }
  }
  
  public boolean isButtonPressed(){
    return buttonPressed;
  }
  
  public void deleteButtonValue(){
     if(!buttonHasValue){
     
    }
    else{
      textAlign(CENTER);
    fill(g.backgroundColor);
    textSize(20);
    text(buttonValue, x , y + extent );
    textAlign(LEFT);
    }
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
  
  public void changeButtonValue(float value){
    buttonHasValue = true;
      deleteButtonValue();
    buttonValue = value;
  
    displayButtonValue();
    
  
}

public float getButtonValue(){
  return buttonValue;
  }
  
  }
  
    
