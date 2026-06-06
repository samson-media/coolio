// ============================================================
//  bracket.scad — side-rail mount bracket  (REGENERATED)
//
//  Fix: this no longer assumes a front post. It is a 90-degree
//  L-angle bracket that turns from the spine to a SIDE rail:
//
//    spine flange : M5 bolt into the spine T-slot   (bolt axis = X)
//    rail  flange : M6 cage-nut bolt into the side rail
//                   lying flat against the rail face (bolt axis = Y,
//                   i.e. front-to-back)
//
//  >>> ASSUMPTION I still need you to confirm <<<
//  I've assumed the cage-nut bolt in your SIDE hole points
//  front-to-back (along Y). If on your rack it points across the
//  rack instead, the rail flange needs to rotate — tell me which
//  and I'll align this plus rack_post.scad and assembly.scad so
//  the whole picture matches. Right now those two files still draw
//  the old front post, so they'll look mismatched until I update
//  them too.
// ============================================================
include <config.scad>

bracket_t  = 5;              // plate thickness
flange_h   = 34;             // flange height along the rail (Z)
spine_pad  = ext_width + 4;  // coverage across the spine face (Y)
rail_reach = 26;             // how far the rail flange extends to the rail
m5_clear   = 5.5;            // into the spine T-nut
m6_clear   = 6.5;            // cage nut in the side rail

spine_x = spine_face_x + ext_width;   // spine +X face (86)

module bracket(zb) {
    color("Teal")
    translate([spine_x, thickness, zb]) {
        // (1) spine flange — flat on the spine +X face, M5 along X
        difference() {
            cube([bracket_t, spine_pad, flange_h]);
            translate([-eps, spine_pad/2, flange_h/2])
                rotate([0, 90, 0])
                    cylinder(h = bracket_t + 2*eps, d = m5_clear);
        }
        // (2) rail flange — turns 90 deg, lies on the side rail, M6 along Y
        difference() {
            cube([rail_reach, bracket_t, flange_h]);
            translate([rail_reach - 9, -eps, flange_h/2])
                rotate([-90, 0, 0])
                    cylinder(h = bracket_t + 2*eps, d = m6_clear);
        }
    }
}

bracket(20);
