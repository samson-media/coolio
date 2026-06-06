// ============================================================
//  rack_post.scad — rack post (context only, not fabricated)
//  Shows the EIA cage-nut holes so you can see how it mounts.
// ============================================================
include <config.scad>

module rack_post() {
    color("DimGray")
    difference() {
        translate([post_x, thickness + ext_width/2 - post_w/2, -20])
            cube([post_t, post_w, span + 40]);
        for (z = [12 : U/3 : span - 8])
            translate([post_x - eps, thickness + ext_width/2 - 4.75, z - 4.75])
                cube([post_t + 2*eps, 9.5, 9.5]);
    }
}

rack_post();
