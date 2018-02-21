#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER
#define PI 3.141592

uniform sampler2D texture;
uniform vec2 texOffset;

varying vec4 vertColor;
varying vec4 vertTexCoord;

uniform float division;

void main() {
    vec2 coord = vertTexCoord.xy-vec2(.5);
    float angle = atan(coord.y, coord.x);
    angle += PI;
    
    float dist = distance(vec2(0.), coord);
    angle = mod(angle, (2*PI)/division);
    
    vec3 color=vec3(1.);
    
    for(int i=0; i<division; i++){
        vec2 newCoord = vec2(0.);
        newCoord.x = -1. * cos(angle) * dist;
        newCoord.y = -1. * sin(angle) * dist;
        newCoord = vec2(.5) + newCoord;
        
        color = min(color, texture2D(texture, newCoord).rgb);
        angle += (2*PI)/division;
        
    }
    if(color != vec3(1.))
    gl_FragColor = vec4(color, 1.);
}

