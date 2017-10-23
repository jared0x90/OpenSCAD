// set smoothness
$fn = 200;

gauge_body_diameter = 52;
gauge_wall_thickness = 2;
gauge_body_depth = 25;


// gauge body

difference() {
    cylinder(d=gauge_body_diameter, h=gauge_body_depth);
    translate([0,0,gauge_wall_thickness])cylinder(d=gauge_body_diameter - gauge_wall_thickness, h=gauge_body_depth);
}

// gauge face
translate ([0,0,gauge_body_depth - gauge_wall_thickness]) 
    rotate_extrude()
        translate([gauge_body_diameter / 2 - gauge_wall_thickness / 2 , 0])
            square(4);


