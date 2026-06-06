// ============================================================
//  assembly.scad — the whole thing, built from the REAL parts
//  Open this, press F5, drag to orbit. Toggles + knobs below.
// ============================================================
include <config.scad>
use <fan_carrier.scad>
use <spine.scad>
use <bracket.scad>
use <rack_post.scad>
use <fan_dummy.scad>

show_fans = true;
show_post = true;

// Nudge the rack corner post to seat against the bracket.
// (rack_post() places itself, so we shift it from here.)
rack_dx = -14;   // along X
rack_dy = 0;     // along Y
rack_dz = 0;     // along Z

if (show_post) translate([rack_dx+35, rack_dy, rack_dz]) rack_post();

spine();
bracket(8);
bracket(span - 34);

for (z = [fan1_z, fan2_z])
    translate([0, 0, z]) rotate([-90, 0, 0]) carrier();

if (show_fans)
    for (z = [fan1_z, fan2_z])
        translate([0, 0, z]) rotate([-90, 0, 0])
            translate([0, 0, thickness]) fan_dummy();

$vpt = [40, 16, span/2];
$vpr = [72, 0, 25];
$vpd = 950;
