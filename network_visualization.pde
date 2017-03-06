PVector location;  // Location of shape
PVector location2;  // Location of shape
PVector location3;  // Location of shape
PVector location4;  // Location of shape
PVector location5;  // Location of shape
PVector location6;  // Location of shape
PVector gravity;   // Gravity acts at the shape's acceleration
int i=0;
int init_error_bar = 0;
String lines[];
String init_error=""; //default initial error
void setup() {
  size(780,360);
  lines = loadStrings("weights.txt");
  location = new PVector(100,100);
  location2 = new PVector(100,250);
  location3 = new PVector(300,100);
  location4 = new PVector(300,250);
  location5 = new PVector(500,100);
  location6 = new PVector(500,250);
}

void draw() {
  if(i < lines.length)
  {
  background(0);
  // Display circle at location vector
  stroke(255);
  strokeWeight(2);
  fill(127);
  ellipse(location.x,location.y,48,48);
  ellipse(location2.x,location2.y,48,48);
  ellipse(location3.x,location3.y,48,48);
  ellipse(location4.x,location4.y,48,48);
  ellipse(location5.x,location5.y,48,48);
  ellipse(location6.x,location6.y,48,48);
  //if(i<100){return;}
  //now set up the weight arrays
  String[] weights_s = split(lines[i], " ");
  int WEIGHTS_PER_LINE = weights_s.length;
  float[] weights_f = new float[WEIGHTS_PER_LINE];
  //convert the weights from string to float array
  //last weight is actually error
  for (int i = 0; i < weights_f.length-1; i++) {
    weights_f[i] = float(weights_s[i]);
  }
  float error = float(weights_s[weights_f.length-1]); //<>//
  //use the error to scale the bar
  //write the top as a function of the bottom height
  int max_error_height = 150+24;
  int error_height = int(max_error_height*(error));
  int top = (100-24)+(max_error_height - error_height);
  rect(600,top, 60, error_height);
  textSize(24);
  fill(255);
  text("Error",600,280);
  //Set up the initial error bar
  if(i==0)
  {
    init_error_bar = top;
    init_error = weights_s[weights_s.length-1];
  }
  line(600,init_error_bar,660,init_error_bar);
  //only display error numbers if the mouse is hovering over the error text
  if((mouseY<=280&&mouseY>=256)&&(mouseX>600&&mouseX<660))
  {
    textSize(15);
    fill(255);
    text(init_error,600,init_error_bar-5);
    text(weights_s[weights_s.length-1],670,250-24);
  }
  //now we set the scale for the visualization
  float max_w = max(max(weights_f),abs(min(weights_f)));
  int max_stroke_weight = 25;
  int stroke_weight=int(weights_f[0]/max_w*max_stroke_weight);
  //represent positive weights with green, negative weights with red
  if(stroke_weight<0)
  {
    stroke_weight = abs(stroke_weight);
    stroke(255,0,0);
  }
  else{
    stroke(0,255,0);
  }  
  strokeWeight(stroke_weight);
  line(location.x,location.y, location3.x,location3.y);
  stroke_weight=int(weights_f[1]/max_w*max_stroke_weight);
  if(stroke_weight<0)
  {
    stroke_weight = abs(stroke_weight);
    stroke(255,0,0);
  }
  else{
    stroke(0,255,0);
  }
  strokeWeight(stroke_weight);
  line(location.x,location.y, location4.x,location4.y);
  stroke_weight=int(weights_f[2]/max_w*max_stroke_weight);
  if(stroke_weight<0)
  {
    stroke_weight = abs(stroke_weight);
    stroke(255,0,0);
  }
  else{
    stroke(0,255,0);
  }
  strokeWeight(stroke_weight);
  line(location2.x,location2.y, location3.x,location3.y);
  stroke_weight=int(weights_f[3]/max_w*max_stroke_weight);
  if(stroke_weight<0)
  {
    stroke_weight = abs(stroke_weight);
    stroke(255,0,0);
  }
  else{
    stroke(0,255,0);
  }
  strokeWeight(stroke_weight);
  line(location2.x,location2.y, location4.x,location4.y);
  stroke_weight=int(weights_f[4]/max_w*max_stroke_weight);
  if(stroke_weight<0)
  {
    stroke_weight = abs(stroke_weight);
    stroke(255,0,0);
  }
  else{
    stroke(0,255,0);
  }
  strokeWeight(stroke_weight);
  line(location3.x,location3.y, location5.x,location5.y);
  stroke_weight=int(weights_f[5]/max_w*max_stroke_weight);
  if(stroke_weight<0)
  {
    stroke_weight = abs(stroke_weight);
    stroke(255,0,0);
  }
  else{
    stroke(0,255,0);
  }
  strokeWeight(stroke_weight);
  line(location3.x,location3.y, location6.x,location6.y);
  stroke_weight=int(weights_f[6]/max_w*max_stroke_weight);
  if(stroke_weight<0)
  {
    stroke_weight = abs(stroke_weight);
    stroke(255,0,0);
  }
  else{
    stroke(0,255,0);
  }
  strokeWeight(stroke_weight);
  line(location4.x,location4.y, location5.x,location5.y);
  stroke_weight=int(weights_f[7]/max_w*max_stroke_weight);
  if(stroke_weight<0)
  {
    stroke_weight = abs(stroke_weight);
    stroke(255,0,0);
  }
  else{
    stroke(0,255,0);
  }
  strokeWeight(stroke_weight);
  line(location4.x,location4.y, location6.x,location6.y);
  i++;
  delay(100);
  }
  else{print("DONE!");
    delay(10000);}
}