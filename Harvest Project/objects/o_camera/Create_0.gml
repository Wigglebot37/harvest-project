/// @description Sets up camera
#macro view view_camera[0]
#macro res_w display_get_width()
#macro res_h display_get_height()
aspect_ratio=display_get_width()/display_get_height();
// The higher the value, the more game pixels will be on screen
view_h=270;
view_w=round(view_h*aspect_ratio);

// Makes them even
if(view_w&1) view_w++;
if(view_h&1) view_h++;

// Calculates the maximum window scaling it can be, up to fullscreen
max_window_scale=min(floor(display_get_width()/view_w),floor(display_get_height()/view_h));
// Reduces it from fullscreen if so
if(view_h*max_window_scale==display_get_height()) max_window_scale--;

// The amount to scale the view by
window_scale=max_window_scale;

globalvar win_w, win_h;
win_w=view_w*window_scale;
win_h=view_h*window_scale;
// Sets the window size
window_set_size(win_w,win_h);
// Centers the window after a frame of delay
alarm[0]=1;

// Resizes Application Surface
surface_resize(application_surface,win_w,win_h);