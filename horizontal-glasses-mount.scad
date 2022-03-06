include <common.scad>;

width = 48;
height = 18;
hook_x_offset = 4;

translate([hook_x_offset, default_face_depth, 0]) {
    board_hook();
}

translate([hook_x_offset + distance_between_hooks, default_face_depth, 0]) {
    board_hook();
}

translate([0,0,-10]) {
    face(width = width, height = height) {
        translate([0,4,0]) {
            icon_imprint("󰊪");                  
        }
    }
    translate([4,0,block_diam]) {
        item_hook(depth_1=7, angle=80, incline=2, depth_2=10);
    }
    translate([44,0,block_diam]) {
        item_hook(depth_1=7, angle=80, incline=2, depth_2=10);
    }
}