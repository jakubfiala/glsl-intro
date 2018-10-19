#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main() {
  gl_FragColor = vec4(mouse.x,1.0,mouse.y,1.0);
}
