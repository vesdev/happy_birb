//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texel;

void main()
{
	
	vec2 alpha;
	alpha += min(v_vTexcoord, texel);
	alpha += max(v_vTexcoord, 1.-texel);
	
    gl_FragColor = vec4(alpha.x+alpha.y);
}
