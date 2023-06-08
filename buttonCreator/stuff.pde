public class Console{
  int conWidth;
  int conHeight;
  int lineHeight;
  int currentLineHeight;
  
  
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


public void addText(String inp){
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
}

    
