include <common.scad>;

width = 30;
hook_x_offset = width/2;

module holder() {
    $fn=200;
    module hollow_circle(height, inner_diam, outer_diam) {
        difference() {
            linear_extrude(height) {
                circle(d=outer_diam);
            }
            translate([0,0,-1]) {
                linear_extrude(height + 2) {
                    circle(d=inner_diam);
                }
            }
        }
    }
    translate([0,0,2])
        difference() {
            hollow_circle(20, 34, 38);
            translate([0,0,16]) {
                rotate([8,0,0])
                cylinder(d=44, h=7);
            }
        }
    hollow_circle(2, 18, 38);
}

translate([hook_x_offset, default_face_depth, 0]) {
    board_hook();
}

translate([hook_x_offset, default_face_depth, distance_between_hooks]) {
    board_hook();
}


face(width = width) {
    icon_imprint("󱄯");                  
}

translate([15,-17,0]) 
    holder();