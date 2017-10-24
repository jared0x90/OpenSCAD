// set smoothness
$fn = 200;

gauge_body_diameter = 52;
gauge_wall_thickness = 2;
gauge_body_depth = 25;


// gauge base
union () {
    // gauge body
    difference() {
        cylinder(d=gauge_body_diameter, h=gauge_body_depth);
        translate([0,0,gauge_wall_thickness])cylinder(d=gauge_body_diameter - gauge_wall_thickness, h=gauge_body_depth);
    }

    // gauge lip
    translate ([0,0,gauge_body_depth - gauge_wall_thickness]) 
        rotate_extrude()
            translate([gauge_body_diameter / 2 - gauge_wall_thickness / 2 , 0])
                square(4);   
        
}



// node mcu board
// http://www.seeedstudio.com/blog/wp-content/uploads/2015/02/8XRE86N0JH517J9HHI-226x300.png
color("pink")
    translate ([65,0,8]) 
        cube([25.4, 48, 5], center = true);

// arduino nano
// https://www.safaribooksonline.com/library/view/arduino-a-technical/9781491934319/assets/aian_0409.png
color("blue")
    translate([0,65,8])
        cube([17.78, 43.18, 5], center = true);


// WeMos D1 Mini (ESP8266)
// https://wiki.wemos.cc/products:d1:d1_mini
color("orange")
    translate([0,-65,8])
        cube([34.2, 25.6, 5], center = true);

// Adafruit 1.3" 128x64 OLED
// https://www.adafruit.com/product/938
color("green")
    translate([-65,0,23])
        cube([35, 35, 5], center = true);