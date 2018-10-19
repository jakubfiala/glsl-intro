#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main() {
  vec2 coords = gl_FragCoord.xy / resolution;
  gl_FragColor = vec4(coords.x, mouse.x, coords.y, 1.0);
}
