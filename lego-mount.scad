include <common.scad>;

// From https://github.com/cfinke/LEGO.scad
use <LEGO.scad>;

width = 15.9 * 2;
hook_x_offset = width/2;

translate([hook_x_offset, default_face_depth, 0]) {
    board_hook();
}

translate([hook_x_offset, default_face_depth, distance_between_hooks]) {
    board_hook();
}


face(width = width) {
    icon_imprint("󱊍");
}


module block_support() {
    translate([15.8/2, -22, 0]) {
        multmatrix([
            [1, 0, 0, 0],
            [0, 1, -2, -1.9],
            [0, 0, 1, 0],
            [0, 0, 0, 1]
        ])
        cube([15.8, 15.8/2, 20]);

        translate([0, 0, 0])
            cube([15.8, 22, 3]);
    }
}
block_support();


stud_length = 8.5;
y_offset = (stud_length * 6.0 / 2) + 4.5;

translate([7.95*2, -y_offset, 20])
    rotate([0, 0, 90]) {
    block(
        width=4,
        length=8.5,
        height=1/3,
        type="brick",
        brand="lego",
        stud_type="solid",
        roadway_invert=true,
        block_bottom_type="closed",
        roadway_width=4,
        roadway_length=8
    );
}