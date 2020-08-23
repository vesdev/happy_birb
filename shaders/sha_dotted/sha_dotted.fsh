//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform vec2 texel;
uniform vec4 sprUv;

const float speed = 0.000005;

void main()
{
	vec2 uv = v_vTexcoord;
	uv.y += time*speed;
	float alpha;
	
	alpha += float(mod(mod(uv.x,texel.x*4.),texel.x*8.) > texel.x*2.);
	alpha -= float(mod(mod(uv.y,texel.y*4.),texel.y*8.) > texel.y*2.);
	
	float alpha2;
	alpha2 += float(mod(mod(uv.x,texel.x*4.),texel.x*8.) < texel.x*2.);
	alpha2 -= float(mod(mod(uv.y,texel.y*4.),texel.y*8.) < texel.y*2.);

	float edge;
	edge += float(v_vTexcoord.x < sprUv.x+texel.x*2.);
	edge += float(v_vTexcoord.y < sprUv.y+texel.y*2.);
	edge += float(v_vTexcoord.x > sprUv.b-texel.x*2.);
	edge += float(v_vTexcoord.y > sprUv.a-texel.y*2.);
	
	
	//alpha -= mod(mod(v_vTexcoord.y,texel.y*4.),texel.y*8.);
    gl_FragColor = vec4(1.,1.,1.,float(alpha > 0. || alpha2 > 0.)*edge*.9);//vec4(1,1,1,alpha);
}