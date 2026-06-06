// ============================================================
//  spine.scad — the 2020 extrusion spine (off-the-shelf stand-in)
//  In reality you buy this cut to length; modelled for the assembly.
// ============================================================
include <config.scad>

module spine() {
    color("Silver")
    translate([spine_face_x, thickness, 0])
        difference() {
            cube([ext_width, ext_width, span]);
            // front-facing slot (toward the fans)
            translate([ext_width/2 - 3, -eps, -eps])
                cube([6, 3, span + 2*eps]);
        }
}

spine();
