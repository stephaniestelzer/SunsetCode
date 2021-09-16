public class Ellipse{
  float xCoordinate;
  float yCoordinate;
  float ellipseWidth;
  float ellipseHeight;
  int redValue;
  int blueValue;
  int greenValue;
  Ellipse(float xCoord, float yCoord, float ellWidth, float ellHeight, int r, int g, int b){
    xCoordinate = xCoord;
    yCoordinate = yCoord;
    ellipseWidth = ellWidth;
    ellipseHeight = ellHeight;
    redValue = r;
    blueValue = b;
    greenValue = g;
  }
  // making accessor functions
  float getX(){
    return xCoordinate;
  }
  
  float getY(){
    return yCoordinate;
  }
  
  float getEllipseWidth(){
    return ellipseWidth;
  }
  
  float getEllipseHeight(){
    return ellipseHeight;
  }
  
  int getRValue(){
    return redValue;
  }
  
  int getBValue(){
    return blueValue;
  }
  
  int getGValue(){
    return greenValue;
  }
  
  void print(){
    noStroke();
    fill(redValue, blueValue, greenValue);
    ellipse(xCoordinate, yCoordinate, ellipseWidth, ellipseHeight);
  }
}
