#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

float random (vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

float voronoi_noise(in vec2 x)
{
  vec2 p = floor(x);
  vec2 f = fract(x);

  vec2 res = vec2(8.0);
  for(int j = -1; j <= 1; j ++)
  {
    for(int i = -1; i <= 1; i ++)
    {
      vec2 b = vec2(i, j);
      vec2 r = vec2(b) - f + random(p + b);

      // chebyshev distance, one of many ways to do this
      float d = max(abs(r.x), abs(r.y));

      if(d < res.x)
      {
        res.y = res.x;
        res.x = d;
      }
      else if(d < res.y)
      {
        res.y = d;
      }
    }
  }
  return res.y - res.x;
}

void main() {
    vec2 coords = gl_FragCoord.xy/resolution.xy;

    float brightness = random(coords);
    // brightness = voronoi_noise(coords * 100.0);

    gl_FragColor = vec4(vec3(brightness),1.0);
}
