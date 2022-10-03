include <common.scad>;

width = 35;

hook_x_offset = width / 2;

translate([hook_x_offset, default_face_depth, 0]) {
    board_hook();
}

translate([hook_x_offset, default_face_depth, distance_between_hooks]) {
    board_hook();
}

face(width = width) {
    translate([8, -11, 00]) {
        rotate([00,00,180]) {
            linear_extrude(10) {
                scale([.15, .15, .15]) {
                    import("./pliers.svg");
                }
            }
        }
    }
}

module cup() {
    rotate_extrude(angle=-90, convexity=10, $fn=40) {
        translate([0, 0]) {
            rotate([10, 10]) {
                square([2, 20]);
            }
        }
    }
}

difference() {
    hull() {
        translate([width/2 + 12.5, -11, 24]) {
            cup();
        }
        translate([width/2 - 12.5, -11, 24]) {
            mirror([1, 0, 0]) {
                cup();
            }
        }
        translate([width/2 + 12.5, 0, 24]) {
            cup();
        }
        translate([width/2 - 12.5, 0, 24]) {
            mirror([1, 0, 0]) {
                cup();
            }
        }
    }
    translate([5.5, -11, 22]) {
            rotate([0, -3, 0])
    cube([14, 12, 25]);
    }
    translate([width-5.5, -11, 22]) {
            mirror([1, 0, 0]) {
                    rotate([0, -3, 0])
    cube([14, 12, 25]);
    }
}
}
