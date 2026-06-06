// ============================================================
//  assembly.scad — the whole thing, built from the REAL parts
//  Each part lives in its own file; this just positions them, so
//  the picture always matches what you'd fabricate. Edit a part
//  (or config.scad) and this updates automatically.
//
//  Open this, press F5, drag to orbit. Toggles below.
// ============================================================
include <config.scad>
use <fan_carrier.scad>
use <spine.scad>
use <bracket.scad>
use <rack_post.scad>
use <fan_dummy.scad>

show_fans = true;
show_post = true;

if (show_post) rack_post();

spine();
bracket(8);
bracket(span - 34);

// the REAL carrier, rotated upright and placed at each fan height
for (z = [fan1_z, fan2_z])
    translate([0, 0, z]) rotate([-90, 0, 0]) carrier();

// stand-in fans, mounted on the back face of each carrier
if (show_fans)
    for (z = [fan1_z, fan2_z])
        translate([0, 0, z]) rotate([-90, 0, 0])
            translate([0, 0, thickness]) fan_dummy();

/* starting camera */
$vpt = [40, 16, span/2];
$vpr = [72, 0, 25];
$vpd = 950;
