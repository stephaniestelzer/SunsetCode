// sunrise sketch
float sunX; 
float sunY; 
float sunWidth; 
float sunHeight;
int sunR; 
int sunG; 
int sunB;
// going to create FloatLists for each mountain
FloatList orangeMountain = new FloatList();
FloatList blueMountain = new FloatList();
FloatList redMountain = new FloatList();
FloatList brownMountain = new FloatList();
FloatList redMountainCountour = new FloatList();
FloatList starX = new FloatList();
FloatList starY = new FloatList();
int backgroundR, backgroundG, backgroundB;
boolean reset;
void setup() {
  //Ellipse sun = new Ellipse(sunX, sunY, sunWidth, sunHeight, sunR, sunG, sunB);
  background(#c3aa9d);
  // want to change the background to the tan color
  backgroundR = 195;
  backgroundG = 170;
  backgroundB = 157;
  reset = false;
  size(400, 400);
  // going to make the blue into a rectangle
  noStroke();
  fill(#cfd3dc);
  beginShape();
  vertex(0, 250);
  vertex(400, 250);
  vertex(400, 400);
  vertex(0, 400);
  endShape();

  // rect(0, 0, 400, 250);
  // creating the sun
  sunX = 270; 
  sunY = 100; 
  sunWidth = 90; 
  sunHeight = 90;
  sunR = 242; 
  sunG = 175; 
  sunB = 84;
  fill(#f2af54);
  ellipse(270, 100, 90, 90);

  // brown mountain random numbers
  orangeMountain = generateRandomValues(120, 140, 5);
  blueMountain = generateRandomValues(150, 170, 5);
  redMountain = generateRandomValues(120, 140, 13);
  redMountainCountour = generateRandomValues(300, 320, 13);
  brownMountain = generateRandomValues(200, 220, 13);
  starX = starValues(0, 400);
  starY = starValues(0, 250);
}

FloatList generateRandomValues(float rTop, float rBot, int inc) {
  FloatList randomValueList = new FloatList();
  for (int i = 0; i <= width/2; i ++) {
    float rand = random(rTop, rBot);
    randomValueList.append(rand);
    // increment these
    rTop += inc;
    rBot += inc;
  }
  return randomValueList;
}

FloatList starValues(float bottom, float top){
  FloatList stars = new FloatList();
  for(int i = 0; i < 80; i++){
    float rand = random(bottom, top);
    stars.append(rand);
  }
  return stars;
}

void draw() {
  // first we need to access the values of the ellipse so that we can manipulate them
  background(backgroundR, backgroundG, backgroundB);
  backgroundR--; backgroundG--; backgroundB--;
  if(reset == true){
    backgroundR = 195; backgroundG = 170; backgroundB = 157;
    reset = false;
  }
  // stars
  for(int i = 0; i < 80; i++){
  fill(255);
  ellipse(starX.get(i), starY.get(i), 5, 5);
}
  Ellipse sun = new Ellipse(sunX, sunY, sunWidth, sunHeight, sunR, sunG, sunB);
  float movingY = sun.getY();
  float movingX = sun.getX();
  float ellipseWidth = sun.getEllipseWidth();
  float ellipseHeight = sun.getEllipseHeight();
  int rValue = sun.getRValue();
  int gValue = sun.getGValue();
  int bValue = sun.getBValue();
  sunY++;
  if (sunY > height - 100){
    sunY = 100;
    reset = true;
  }
  fill(rValue, gValue, bValue);
  ellipse(movingX, movingY, ellipseWidth, ellipseHeight);
  // ocean rectangle
  noStroke();
  fill(#cfd3dc);
  beginShape();
  vertex(0, 250);
  vertex(400, 250);
  vertex(400, 400);
  vertex(0, 400);
  endShape();
  // putting the mountains in the draw function so that they get generated on top of the sun
  // drawing angled mountains
  float x1 = 0;
  float x2 = 0;
  float y1 = 120;
  float y2 = 0;
  float randomTop = 120;
  float randomBot = 140;
  beginShape();
  vertex(x1, y1);
  int count = 0;
  for (int i = 0; i <= width/2; i+=10) {
    // establish where the y value will be by calculating it
    // need to change the random values that we are calculating between... for loop?
    float rand = orangeMountain.get(count);
    y2 = map(sin(PI/2), -1, 1, 0, rand);
    // draw this into lines
    randomTop += 5;
    randomBot += 5;
    // increment x2 and y1
    x2+= 10;
    noStroke();
    line(x1, y1, x2, y2);
    vertex(x1, y1); 
    vertex(x2, y2);
    x1 = x2;
    y1 = y2;
    if (count >= orangeMountain.size()) {
      count = 0;
    }
    if (count <= orangeMountain.size()) {
      count++;
    }
  }
  // need to fix the end location
  vertex(200, y2);
  vertex(215, 250);
  vertex(0, 250);
  fill(#c57637);
  endShape();

  // blue mountain
  x1 = 400;
  x2 = 400;
  y1 = 120;
  y2 = 0;
  randomTop = 150;
  randomBot = 170;
  count = 0;
  beginShape();
  vertex(x1, y1);
  for (int i = 0; i <= width/2; i+=10) {
    // establish where the y value will be by calculating it
    // need to change the random values that we are calculating between... for loop?
    float rand = blueMountain.get(count);
    y2 = map(sin(PI/2), -1, 1, 0, rand);
    // draw this into lines
    randomTop += 5;
    randomBot += 5;
    // increment x2 and y1
    x2 -= 10;
    noStroke();
    line(x1, y1, x2, y2);
    vertex(x1, y1); 
    vertex(x2, y2);
    x1 = x2;
    y1 = y2;
    if (count >= orangeMountain.size()) {
      count = 0;
    }
    if (count <= orangeMountain.size()) {
      count++;
    }
  }
  vertex(400, y2);
  vertex(320, 400);
  vertex(400, 400);
  fill(#aab9be);
  endShape();

  // red mountain
  x1 = 0;
  x2 = 0;
  y1 = 120;
  y2 = 0;
  randomTop = 120;
  randomBot = 140;
  count = 0;
  beginShape();
  vertex(x1, y1);
  for (int i = 0; i <= width/2; i+=10) {
    // establish where the y value will be by calculating it
    // need to change the random values that we are calculating between... for loop?
    float rand = redMountain.get(count);
    y2 = map(sin(PI/2), -1, 1, 0, rand);
    // draw this into lines
    randomTop += 13;
    randomBot += 13;
    // increment x2 and y1
    x2+= 10;
    noStroke();
    line(x1, y1, x2, y2);
    vertex(x1, y1); 
    vertex(x2, y2);
    x1 = x2;
    y1 = y2;
    if (count >= redMountain.size()) {
      count = 0;
    }
    if (count <= redMountain.size()) {
      count++;
    }
  }
  // need to fix the end location
  vertex(200, y2);
  vertex(210, 400);
  vertex(0, 400);
  fill(#a6403c);
  endShape();

  // countour of red mountain
  x1 = 0;
  x2 = 0;
  y1 = 300;
  y2 = 0;
  count = 0;
  randomTop = 300;
  randomBot = 320;
  beginShape();
  vertex(x1, y1);
  for (int i = 0; i <= width/2; i+=10) {
    // establish where the y value will be by calculating it
    // need to change the random values that we are calculating between... for loop?
    float rand = redMountainCountour.get(count);
    y2 = map(sin(PI/2), -1, 1, 0, rand);
    // draw this into lines
    randomTop += 13;
    randomBot += 13;
    // increment x2 and y1
    x2+= 20;
    noStroke();
    line(x1, y1, x2, y2);
    vertex(x1, y1); 
    vertex(x2, y2);
    x1 = x2;
    y1 = y2;
    if (count >= redMountainCountour.size()) {
      count = 0;
    }
    if (count <= redMountainCountour.size()) {
      count++;
    }
  }
  vertex(200, y2);
  vertex(210, 400);
  vertex(0, 400);
  fill(#693739);
  endShape();
  // brown mountain
  x1 = 400;
  x2 = 400;
  y1 = 200;
  y2 = 0;
  count = 0;
  randomTop = 200;
  randomBot = 220;
  beginShape();
  vertex(x1, y1);
  for (int i = 0; i <= width/2; i+=10) {
    // establish where the y value will be by calculating it
    // need to change the random values that we are calculating between... for loop?
    float rand = brownMountain.get(count);
    y2 = map(sin(PI/2), -1, 1, 0, rand);
    // draw this into lines
    randomTop += 13;
    randomBot += 13;
    // increment x2 and y1
    x2-= 10;
    noStroke();
    line(x1, y1, x2, y2);
    vertex(x1, y1); 
    vertex(x2, y2);
    x1 = x2;
    y1 = y2;
    if (count >= brownMountain.size()) {
      count = 0;
    }
    if (count <= brownMountain.size()) {
      count++;
    }
  }
  // need to fix the end location
  vertex(400, y2);
  vertex(210, 400);
  vertex(400, 400);
  fill(#553936);
  endShape();
  
}
