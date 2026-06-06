// ============================================================
//  bracket.scad — rack-mount bracket (post -> spine)
//  Bolts to the rack post with an M6 cage nut, reaches to the spine.
//  bracket(zb) places one at vertical height zb.
// ============================================================
include <config.scad>

module bracket(zb) {
    color("Teal") union() {
        // pad against the post, M6 hole through it (along X)
        difference() {
            translate([post_x - 4, thickness, zb]) cube([4, ext_width, 26]);
            translate([post_x - 6, thickness + ext_width/2, zb + 13])
                rotate([0, 90, 0]) cylinder(h = 8, d = 6.5);
        }
        // arm reaching back to the spine
        translate([wing_x1, thickness, zb])
            cube([post_x - 4 - wing_x1, ext_width, 6]);
    }
}

bracket(20);
