float redLineX, redDotY; //variables for red slider
float greenLineX, greenDotY; //variables for green slider
float blueLineX, blueDotY; //variables for blue slider
float sizeLineX, sizeDotY; //variables for size slider
float buttonWidth, buttonHeight; //variables for white, black and clear buttons
float lineLength = 255, lineY, size, controlHeight;
float red, green, blue; //variables for the colour values

int sliderSize = 40; //size of the knob on sliders

void setup() {
  fullScreen();
  background(255);
  rectMode(CENTER);
  
  redLineX = width * 0.125; 
  redDotY = height * 0.04;
  
  greenLineX = width * 0.1875; 
  greenDotY = height * 0.04 + 255;
  
  blueLineX = width * 0.25;
  blueDotY = height * 0.04 + 255;
  
  sizeLineX = width * 0.35;
  sizeDotY = height * 0.04 + 100;
  
  buttonWidth = width * 0.08;
  buttonHeight = height * 0.04;
  
  lineY = height * 0.04;
  
  controlHeight = 2 * lineY + lineLength;
}

void draw() {
  if (mousePressed) {
    if ((mouseX > redLineX - sliderSize / 2 && mouseX < redLineX + sliderSize / 2) && (mouseY > lineY && mouseY < lineY + lineLength)) {
      if (redDotY >= lineY && redDotY <= lineY + lineLength) {
        redDotY = mouseY;
      } else {
        if (redDotY < lineY) {
          redDotY = lineY;
        } else {
          redDotY = lineY + lineLength;
        }
      }
    } else if ((mouseX > greenLineX - sliderSize / 2 && mouseX < greenLineX + sliderSize / 2) && (mouseY > lineY && mouseY < lineY + lineLength)) {
      if (greenDotY >= lineY && greenDotY <= lineY + lineLength) {
        greenDotY = mouseY;
      } else {
        if (greenDotY < lineY) {
          greenDotY = lineY;
        } else {
          greenDotY = lineY + lineLength;
        }
      }
    } else if ((mouseX > blueLineX - sliderSize / 2 && mouseX < blueLineX + sliderSize / 2) && (mouseY > lineY && mouseY < lineY + lineLength)) {
      if (blueDotY >= lineY && blueDotY <= lineY + lineLength) {
        blueDotY = mouseY;
      } else {
        if (blueDotY < lineY) {
          blueDotY = lineY;
        } else {
          blueDotY = lineY + lineLength;
        }
      }
    } else if ((mouseX > sizeLineX - sliderSize / 2 && mouseX < sizeLineX + sliderSize / 2) && (mouseY > lineY && mouseY < lineY + lineLength)) {
      if (sizeDotY >= lineY && sizeDotY <= lineY + lineLength) {
        sizeDotY = mouseY;
      } else {
        if (sizeDotY < lineY) {
          sizeDotY = lineY;
        } else {
          sizeDotY = lineY + lineLength;
        }
      }
    } else if ((mouseX > (width * 0.5 - buttonWidth / 2) && mouseX < (width * 0.5 + buttonWidth / 2)) && (mouseY > (height * 0.08 - buttonHeight / 2) && mouseY < (height * 0.08 + buttonHeight / 2))) {
      redDotY = height * 0.04;
      greenDotY = height * 0.04;
      blueDotY = height * 0.04;
    } else if ((mouseX > (width * 0.5 - buttonWidth / 2) && mouseX < (width * 0.5 + buttonWidth / 2)) && (mouseY > (height * 0.21 - buttonHeight / 2) && mouseY < (height * 0.21 + buttonHeight / 2))) {
      redDotY = height * 0.04 + lineLength;
      greenDotY = height * 0.04 + lineLength;
      blueDotY = height * 0.04 + lineLength;
    } else if ((mouseX > (width * 0.5 - buttonWidth / 2) && mouseX < (width * 0.5 + buttonWidth / 2)) && (mouseY > (height * 0.14 - buttonHeight / 2) && mouseY < (height * 0.14 + buttonHeight / 2))) {
      background(255);
    } else if (mouseY >= controlHeight) {
      strokeWeight(size);
      stroke(red, green, blue);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
  }
  
  drawControls();
  sliders();
}

void sliders() {
  strokeWeight(3);
  stroke(0);
  
  fill(255, 0, 0); //draw red slider
  line(redLineX, lineY, redLineX, lineY + lineLength);
  ellipse(redLineX, redDotY, sliderSize, sliderSize);
  
  fill(0, 255, 0); //draw green slider
  line(greenLineX, lineY, greenLineX, lineY + lineLength);
  ellipse(greenLineX, greenDotY, sliderSize, sliderSize);
  
  fill(0, 0, 255); //draw blue slider
  line(blueLineX, lineY, blueLineX, lineY + lineLength);
  ellipse(blueLineX, blueDotY, sliderSize, sliderSize);
  
  fill(255); //draw size slider
  line(sizeLineX, lineY, sizeLineX, lineY + lineLength);
  ellipse(sizeLineX, sizeDotY, sliderSize, sliderSize);
  
  red = lineLength - (redDotY - lineY); //sets the red value between 0 and 255 depending on knob position
  green = lineLength - (greenDotY - lineY); //sets the green value between 0 and 255 depending on knob position
  blue = lineLength - (blueDotY - lineY); //sets the blue value between 0 and 255 depending on knob position
  size = lineLength - (sizeDotY - lineY) + 10; //sets the size value between 10 and 265 depending on knob position
  
  noStroke();
}

void drawControls() {
  fill(255);
  stroke(0);
  strokeWeight(1);
  rect(width / 2, controlHeight / 2, width, controlHeight);
  
  fill(red, green, blue);
  ellipse(width * 0.78, controlHeight / 2, size, size);
  
  fill(255);
  rect(width * 0.50, height * 0.08, buttonWidth, buttonHeight, 10);
  
  rect(width * 0.50, height * 0.14, buttonWidth, buttonHeight, 10);
  
  fill(0);
  
  textSize(25);
  text("clear", width * 0.51, height * 0.14 + buttonHeight / 8, buttonWidth, buttonHeight);
  
  rect(width * 0.50, height * 0.20, buttonWidth, buttonHeight, 10);
  
  noStroke();
}