public class Console{
  int conWidth;
  int conHeight;
  int lineHeight;
  int currentLineHeight;
  String lastUserInput = "";
  
  
  public Console(int conWidth, int conHeight, int lineHeight){
    this.conWidth = conWidth;
    this.conHeight = conHeight;
    this.lineHeight = lineHeight;
    currentLineHeight = height - conHeight + lineHeight * 2;
    fill(0);
    rect(width - conWidth, height - conHeight, conWidth, conHeight);
    fill(255);
    rect(width - conWidth, height - conHeight, conWidth, lineHeight);
    fill(0);
    textSize(25);
    text("Console", width - conWidth + (lineHeight / 4), height - conHeight + (lineHeight / 1.5));
  }


  public Console(){
    this.conWidth = width / 3;
    this.conHeight = height / 3;
    this.lineHeight = 30;
    currentLineHeight = height - conHeight + lineHeight * 2;
    fill(0);
    rect(width - conWidth, height - conHeight, conWidth, conHeight);
    fill(255);
    rect(width - conWidth, height - conHeight, conWidth, lineHeight);
    fill(0);
    textSize(25);
    text("Console", width - conWidth + (lineHeight / 4), height - conHeight + (lineHeight / 1.5) + 5);
  }


public void addText(String inp, boolean isUserGen){
  if(isUserGen){
       lastUserInput = inp;
}
  if(currentLineHeight > height){
      fill(0);
    rect(width - conWidth, height - conHeight, conWidth, conHeight);
    fill(255);
    rect(width - conWidth, height - conHeight, conWidth, lineHeight);
    fill(0);
     text("Console", width - conWidth + (lineHeight / 4), height - conHeight + (lineHeight / 1.5) + 5);
    currentLineHeight = height - conHeight + lineHeight * 2;
    
     }
 
    
  fill(255);
  text(inp, width - conWidth + (lineHeight / 4),  currentLineHeight);
  currentLineHeight += lineHeight;
    
}

  public void createUserPrompt(String buttonLabel){
    if(!buttonLabel.equals("")){
    print("test");
    String toAdd = "To set a new value for " + buttonLabel + " type in your desired value and hit enter";
    addText(toAdd, false);
    }
    else{
    }
    
  }
  
  public String getLastUserInput(){
   return lastUserInput;
    
  }
  
  public void resetUserInput(){
    lastUserInput = "";
  }
}


    
