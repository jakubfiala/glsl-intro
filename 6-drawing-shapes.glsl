#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main() {
  vec2 coords = gl_FragCoord.xy / resolution;
  float brightness = 0.0;

  // brightness = distance(coords, vec2(0.5, 0.5));

  // brightness = step(0.5, distance(coords, vec2(0.5, 0.5)));

  // brightness = smoothstep(0.0, 0.2, distance(coords, vec2(0.5, 0.5)));

  // brightness = step(0.25, coords.x)
  //     * step(0.25, coords.y)
  //     * step(0.25, 1.0 - coords.x)
  //     * step(0.25, 1.0 - coords.y);

  // brightness = step(0.5, distance(coords, vec2(mouse.x, mouse.y)));

  gl_FragColor = vec4(brightness, brightness, brightness, 1.0);
}
