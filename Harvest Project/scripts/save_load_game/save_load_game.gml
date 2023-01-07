/// @function		save_game();
/// @description	Saves elements of game into file.
function save_game() {
	var sv_data=array_create(0);
	with(o_player) {
		var sv_entity= {
			obj: object_get_name(object_index),
			x: x,
			y: y,
		}
		array_push(sv_data,sv_entity);
	}
	var str=base64_encode(json_stringify(sv_data));
	var buf=buffer_create(string_byte_length(str)+1,buffer_fixed,1);
	buffer_write(buf,buffer_string,str);
	buffer_save(buf,"game0.sav");
	buffer_delete(buf);
	log("Data saved to file \"game0.sav\"");
}

/// @function		load_game();
/// @description	Loads elements of game from file.
function load_game() {
	if(file_exists("game0.sav")) {
		with(o_player) instance_destroy();
		var buf=buffer_load("game0.sav");
		var str=buffer_read(buf,buffer_string);
		buffer_delete(buf);
		var ld_data=json_parse(base64_decode(str));
		
		while(array_length(ld_data)>0) {
			var ld_entity=array_pop(ld_data);
			with(instance_create_layer(0,0,"Instances",asset_get_index(ld_entity.obj))) {
				x=ld_entity.x;
				y=ld_entity.y;
			}
		}
		log("Data loaded from file \"game0.sav\"");
	} else log("File \"game0.sav\" not found.");
}

/// @function		delete_save();
/// @description	Deletes game save file.
function delete_save() {
	if(file_exists("game0.sav")) {
		file_delete("game0.sav");
		log("File \"game0.sav\" deleted.");
	} else log("File \"game0.sav\" not found.");
}