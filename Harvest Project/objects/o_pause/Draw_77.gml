/// @description Handles pausing
// Disables alpha blending
gpu_set_blendenable(false);
if(paused) {
	surface_set_target(application_surface);
	// Draws surface as copy of application surface
	if(surface_exists(pause_surf)) {
		mono_factor=shader_get_uniform(shd_monochrome,"factor");
		//blur_factor=shader_get_uniform(shd_blur,"size");
		//inv_factor=shader_get_uniform(shd_invert,"factor")
		shader_set(shd_monochrome);
		shader_set_uniform_f(mono_factor,mono);
		//shader_set_uniform_f(blur_factor,res_h,res_h,blur);
		//shader_set_uniform_f(inv_factor,inv);
		draw_surface(pause_surf,0,0);
		shader_reset();
	}
	else { // Restores from buffer if surface is lost
		pause_surf=surface_create(res_w,res_h);
		// Copies data from buffer
		buffer_set_surface(pause_surf_buffer,pause_surf,0);
	}
	surface_reset_target();
}

// Toggles Pause
if(keyboard_check_pressed(vk_escape)) {
	if(!paused) {
		paused=true;
		// Deactivate all instances to be paused
		// Using instance_deactivate_all(true); causes weird flicker glitch with draw gui
		instance_deactivate_layer("Instances");
		// Creates a new surface out of current screen size
		pause_surf=surface_create(res_w,res_h);
		// Copies from application surface
		surface_set_target(pause_surf);
		draw_surface(application_surface,0,0);
		surface_reset_target();
		// Deletes buffer and creates a new one
		if(buffer_exists(pause_surf_buffer)) buffer_delete(pause_surf_buffer);
		pause_surf_buffer=buffer_create(res_w*res_h*4,buffer_fixed,1);
		buffer_get_surface(pause_surf_buffer,pause_surf,0);
	} else {
		paused=false;
		mono=1;
		blur=0;
		inv=0;
		// Reactivates all other instances
		instance_activate_all();
		// Frees surface and deletes buffer
		if(surface_exists(pause_surf)) surface_free(pause_surf);
		if(buffer_exists(pause_surf_buffer)) buffer_delete(pause_surf_buffer);
	}
}
// Renables alpha blending
gpu_set_blendenable(true);