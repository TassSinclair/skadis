include <common.scad>;

width = 30;

hook_x_offset = width / 2;

translate([hook_x_offset, default_face_depth, 0]) {
    board_hook();
}

translate([hook_x_offset, default_face_depth, distance_between_hooks]) {
    board_hook();
}


face(width = width) {
    translate([-2,-14,0]) {
        rotate([0,0,-90]) {
            icon_imprint("󰊪");
        }
    }
}

module front() {
    handle_depth = 12;
    translate([24, 0, 40]) {
        rotate([90, 90, 0]) {
            pipe(length=handle_depth, diam = 6, oversize = 0) {
                pipe_bend(diam = 6, oversize = 0, angle = 80) {
                    pipe(length = 26, diam = 6, oversize = 0) {
                        translate([0, 3, 0]) {
                            sphere(d=8);
                        }
                    }
                }
            }
        }
    }
}

front();
