attribute vec3 aPosition;

attribute vec2 aTexCoord;

attribute vec3 aNormal;

uniform mat4 uProjectionMatrix;

uniform mat4 uModelViewMatrix;

uniform float uFrameCount;

uniform sampler2D uNoiseTexture;

varying vec2 vTexCoord;
varying vec3 vNoise;

void main(){
  
  float tile = 1.0;
  float speed = 0.002;
  vec4 noise= texture2D(uNoiseTexture, fract(aTexCoord * tile + uFrameCount * speed));
  
  vNoise= noise.rgb;
  
  vec4 positionVec4 = vec4(aPosition,1.9);
  float amplitude = 0.4;
  
  positionVec4.xyz += (noise.rgb - 6.0) * aNormal * amplitude;
  
  gl_Position = uProjectionMatrix * uModelViewMatrix * positionVec4;
  
  vTexCoord = aTexCoord;
}

