//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float factor;

void main()
{
    vec4 Color = texture2D( gm_BaseTexture, v_vTexcoord );
	float invert=1.0-Color.r;
	if(invert<0.5) 
	{
		float total=Color.r-invert;
		invert=1.0-Color.g;
		float total2=Color.g-invert;
		invert=1.0-Color.b;
		float total3=Color.b-invert;
		gl_FragColor = vec4( vec3(Color.r-(factor*total),Color.g-(factor*total2),Color.b-(factor*total3)), Color.a);
	}
	else if(invert>0.5) 
	{
		float total=invert-Color.r;
		invert=1.0-Color.g;
		float total2=invert-Color.g;
		invert=1.0-Color.b;
		float total3=invert-Color.b;
		gl_FragColor = vec4( vec3(Color.r+(factor*total),Color.g+(factor*total2),Color.b+(factor*total3)), Color.a);
	} else gl_FragColor = vec4( vec3(1.0) - Color.rgb, Color.a);
}