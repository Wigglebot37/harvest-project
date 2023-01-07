/// @description dissolve_shader(Sprite,Frame,x,y,Remaining)
/// @arg Sprite - sprite index
/// @arg Frame - image index
/// @arg x - x
/// @arg y - y
/// @arg Remaining - from 0 (fully transparent) to 1 (fully revealed)
function dissolve_shader(spr,frame,_x,_y,remain) {
	//Call dissolve_ettings at least once in the object before using this.

	//If you have a fixed sprite you could possibly move this to dissolve_settings for a minor speed boost
	var _DissolveSprUvs = sprite_get_uvs(spr,frame);

	shader_set(_Dissolve_Shader);
	shader_set_uniform_f(_u_Dissolve,remain);
	shader_set_uniform_f(_u_DissolveEdge,_DissolveEdge);
	shader_set_uniform_f(_u_DissolveUV,_DissolveTexUvs[0],_DissolveTexUvs[1]);
	shader_set_uniform_f(_u_DefaultUV,_DissolveSprUvs[0],_DissolveSprUvs[1]);
	shader_set_uniform_f(_u_DissolveC1,_DissolveC1[0],_DissolveC1[1],_DissolveC1[2]);
	shader_set_uniform_f(_u_DissolveC2,_DissolveC2[0],_DissolveC2[1],_DissolveC2[2]);
	texture_set_stage(_u_DissolveTex,_DissolveTex);

	draw_sprite(spr,frame,_x,_y);
	//If you need to scale & rotate etc you can use draw_sprite_ext() above instead.
	//You must then add each argument to the script as necessary or insert a default value.
	//Example:
	//draw_sprite_ext(spr,frame,_x,_y,argument5,argument6,argument7,argument8,argument9);

	shader_reset();
}

/// @description dissolve_settings(MaskSprite,MaskFrame,InnerColour,OuterColour,EdgeThickness);
/// @arg MaskSprite - black and white dissolve pattern. Dimensions must match the sprite to be dissolved!
/// @arg MaskFrame - Mask sub-image index
/// @arg InnerColour - eg: c_red, or make_colour_rgb())
/// @arg OuterColour - eg: c_red, or make_colour_rgb())
/// @arg EdgeThickness - from 0 (no colour edge) to 0.99 (full sprite)
function dissolve_settings(MaskSprite,MaskFrame,InnerColour,OuterColour,EdgeThickness) {
	//Call in the create event of an object, or when you need to change the colours, mask or thickness of the dissolve

	_Dissolve_Shader = shd_dissolve; //Incase you want to change the name of the shader resource

	_u_DissolveTex = shader_get_sampler_index(_Dissolve_Shader,"DissolveTex");
	_u_Dissolve = shader_get_uniform(_Dissolve_Shader,"Dissolve");
	_u_DissolveUV = shader_get_uniform(_Dissolve_Shader,"DissolveUV"); 
	_u_DefaultUV = shader_get_uniform(_Dissolve_Shader,"DefaultUV"); 
	_u_DissolveEdge = shader_get_uniform(_Dissolve_Shader,"Edge");
	_u_DissolveC1 = shader_get_uniform(_Dissolve_Shader,"C1");
	_u_DissolveC2 = shader_get_uniform(_Dissolve_Shader,"C2");

	_DissolveTex = sprite_get_texture(MaskSprite,MaskFrame);
	_DissolveTexUvs = sprite_get_uvs(MaskSprite,MaskFrame);

	_DissolveC1 = [colour_get_red(InnerColour)/255,colour_get_green(InnerColour)/255,colour_get_blue(InnerColour)/255];
	_DissolveC2 = [colour_get_red(OuterColour)/255,colour_get_green(OuterColour)/255,colour_get_blue(OuterColour)/255];
	_DissolveEdge = EdgeThickness;
}