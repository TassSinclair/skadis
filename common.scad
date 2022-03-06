pipe_diam = 4.5;
block_diam = 4;

distance_between_hooks = 40;
default_face_depth = 4;
default_face_width = 26;
default_face_height = 48;


module pipe(length = 5, diam = pipe_diam, oversize=3){
    $fn = 100;
    translate([0, pipe_diam/2, 0]) {
        hull() {
            cylinder(d=diam, h=length);
            translate([0, oversize, 0]) {
                cylinder(d = diam, h = length);
            }
        }
    }
    translate([0, 0, length]) {
        children();
    }
}

module face(icon = "", 
            width = default_face_width, 
            depth = default_face_depth, 
            height = default_face_height) {
    difference() {
        cube([width, depth, height]);
        translate([width/2, 1.5, height - 14]) {
            rotate([90, 0, 0]) {
                children();
            }
        }
    }
}

module icon_imprint(icon="", size=16) {
    linear_extrude(3) {
        text(icon,
            font = "Material Design Icons", 
            halign = "center",
            valign = "center",
            size = size);
    }
}
    

module pipe_bend(diam = pipe_diam, oversize=3) {
    $fn=100;
    rotate([0,-90,0]) {
        rotate_extrude(angle=90, convexity=10) {
            translate([diam/2, 0]) {
                hull() {
                    circle(d=diam);
                    translate([oversize, 0]) {
                      circle(d=diam);
                    }
                }
            }
        }
    }
    rotate([90,0,0])
        children();
}

module board_hook() {
    hook_depth = 5.5;
    hook_drop = 6;
    rotate([90,0,180]) {
        pipe(hook_depth) {
            pipe_bend() {
                pipe(hook_drop);
            }
        }
    }
}

module block(length = 5, diam = block_diam, oversize=0){
    translate([-diam/2, 0, 0]) {
        cube([diam, diam + oversize, length]);
    }
    translate([0, 0, length]) {
        children();
    }
}

module block_bend(diam = block_diam, angle = 45, incline = 10, oversize=0) {
    $fn=100;
    translate([-diam/2, -incline, 00]) {
        rotate([90,00,90]) {
            rotate_extrude(angle = angle, convexity = 10) {
                translate([incline,0]) {
                    square([diam + oversize, diam]);
                }
            }
        }
    }
    translate([0,-incline,0]) {
        rotate([angle,0,0]) {
            translate([0,incline,0]) {
                children();
            }
        }
    }
}

module item_hook(depth_1=7, angle=80, incline=2, depth_2=10) {
    hook_depth = 5.5;
    hook_drop = 6;
    rotate([-90,0,180]) {
        block(length = depth_1) {
            block_bend(angle = angle, incline = incline) {
                block(length = depth_2);
            }
        }
    }
}