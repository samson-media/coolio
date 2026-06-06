// ============================================================
//  rack_post.scad — rack CORNER post  (SELF-CONTAINED)
//  Context only (not fabricated). Full L-profile corner post
//  with square cage-nut holes on both faces.
//
//  This file needs NO other file — it defines its own constants
//  so it opens on its own. (They mirror config.scad; inside the
//  full assembly those values come from config.scad instead, and
//  these are simply ignored.)
//
//  ORIENTATION: set rot_z to match your rack — 0 / 90 / 180 / 270.
// ============================================================

// --- constants (mirror config.scad) ---
U         = 44.45;
span      = 6 * U;     // 266.7  (6U)
thickness = 6;
post_x    = 98;
eps       = 0.01;
$fn       = 64;

// --- corner-post params ---
leg_len = 32;    // length of each leg of the L
leg_t   = 3;     // wall thickness of the angle
hole    = 9.5;   // square cage-nut hole

rot_z    = 180;  // <<< spin the corner: 0 / 90 / 180 / 270
corner_x = post_x;
corner_y = thickness;

module rack_post() {
    color("DimGray")
    translate([corner_x, corner_y, -20])
    rotate([0, 0, rot_z])
    difference() {
        union() {
            cube([leg_t,   leg_len, span + 40]);   // one face of the L
            cube([leg_len, leg_t,   span + 40]);   // the other face
        }
        for (zz = [12 : U/3 : span - 8]) {
            translate([-eps, leg_len/2 - hole/2, zz + 20 - hole/2])
                cube([leg_t + 2*eps, hole, hole]);     // holes through X-face
            translate([leg_len/2 - hole/2, -eps, zz + 20 - hole/2])
                cube([hole, leg_t + 2*eps, hole]);     // holes through Y-face
        }
    }
}

rack_post();
