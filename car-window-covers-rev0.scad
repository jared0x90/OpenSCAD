// set smoothness
$fn = 100;

wall_thickness = 3;

cutout_height = 30;
cutout_width = 44;
cutout_thickness = 5;

outer_height = cutout_height + 2;
outer_width = cutout_width + wall_thickness  * 2;
outer_thickness = cutout_thickness + wall_thickness  * 2;

translate([0,outer_thickness / 2,0]) rotate([90,0,90]) cylinder(h = outer_width,  r = outer_thickness / 2);

difference() {
    cube([outer_width, outer_thickness, outer_height]);
    translate([3,3,3])
    cube([cutout_width, cutout_thickness, cutout_height]);
}
