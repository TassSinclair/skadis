include <common.scad>;

translate([0,20,0]) {
    translate([10,0,0])
        pipe();
    translate([20,0,0])
        pipe_bend();
    translate([30,0,0])
        pipe(oversize=0)
            pipe_bend(oversize=0)
                pipe(oversize=0);
    board_hook();
}

translate([0,00,0]) {
    translate([10,0,0])
        block(10);
    translate([20,0,0])
        block_bend(incline=2, angle=45)
            block(length=10);
    translate([30,0,0])
        block(oversize=0)
            block_bend(angle=80, oversize=0)
                block(oversize=0, length=10);
    item_hook();
}