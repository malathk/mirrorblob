let myShader;
let noise;

function preload(){
  myShader = loadShader("shader.vert","shader.frag");
  noise = loadImage("mirrorwhite.png");
  
}
function setup() {
  createCanvas(windowWidth,windowHeight,WEBGL);
  fill('white');
  noStroke();
}

function draw() {
  background(0,0,0,0);
  shader(myShader);
  
  //send the framecount to the shader
  myShader.setUniform("uFrameCount",frameCount);
  myShader.setUniform("uNoiseTexture", noise);
  
  //rotate our geometry along x and y axis
  rotateX(frameCount*0.01);
  rotateY(frameCount*0.005);
 
  //draw some geometry on screen
 
sphere(width/2,200,200);
 
  
}

function windowResized(){
  resizeCanvas(windowWidth,windowHeight);
}
