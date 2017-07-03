// Author:Lee Eul
// Title:No_Title

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec2 coord;
vec3 color = vec3(0.269,0.880,0.995);
vec3 col1 = vec3(0.835,0.671,0.314);
vec3 col2= vec3(0.890,0.181,0.518);

vec2 orbit(vec2 target, float r, float xRatio, float yRatio){
    float x = target.x + cos(u_time*2.) * r * xRatio;
    float y = target.y + sin(u_time*3.) * r * yRatio;
    
    return vec2(x, y);
}

void ellipse_Loop(vec2 center, vec3 col, float grid, float wei){
    float smoo=0.161;
    float dist = distance(center, coord)+grid/2.;
    dist = mod(dist, grid);
    
    float test = smoothstep(0.-smoo, 0., dist) - smoothstep(wei, wei*(1.+smoo), dist);
    
    color = mix(color, col, test); 
    
    
}
void main() {
    coord = gl_FragCoord.xy/u_resolution;
    
    ellipse_Loop(orbit(vec2(0.5, 0.5), 0.5, 1., .5), col2, 0.03, 0.016);
    ellipse_Loop(vec2(0.5,0.5), col1, 0.04, 0.02);
    
    gl_FragColor = vec4(color, 1.);
}