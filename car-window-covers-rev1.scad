// $fs =.1;
$fn = 64;

wall_thickness = 3;

cutout_height = 30;
cutout_width = 44;
cutout_thickness = 5;

lock_inset = 12;
lock_radius = 1.5;
lock_spacing = 5;

outer_height = cutout_height + 2;
outer_width = cutout_width + wall_thickness  * 2;
outer_thickness = cutout_thickness + wall_thickness  * 2;


module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") {
    // More information: https://danielupshaw.com/openscad-rounded-corners/
    // Set $fs to 0.01 for higher definition curves (renders slower)
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							sphere(r = radius);
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							rotate(a = rotate)
							cylinder(h = diameter, r = radius, center = true);
						}
					}
				}
			}
		}
	}
}

difference() {
    roundedcube([outer_width, outer_thickness, outer_height], false, 2.7, "zmin");
    translate([3,3,3])
    cube([cutout_width, cutout_thickness, cutout_height]);
}

translate([outer_width / 2 + lock_spacing, wall_thickness, lock_inset + wall_thickness]) sphere(r=lock_radius);
translate([outer_width / 2, wall_thickness, lock_inset + wall_thickness]) sphere(r=lock_radius);
translate([outer_width / 2 - lock_spacing, wall_thickness, lock_inset + wall_thickness]) sphere(r=lock_radius);


translate([outer_width / 2 + lock_spacing / 2, wall_thickness + cutout_thickness, lock_inset + wall_thickness]) sphere(r=lock_radius);
translate([outer_width / 2 - lock_spacing / 2, wall_thickness + cutout_thickness, lock_inset + wall_thickness]) sphere(r=lock_radius);
