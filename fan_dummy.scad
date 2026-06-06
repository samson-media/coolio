// ============================================================
//  fan_dummy.scad — stand-in 120 mm fan (you BUY the real one)
//  Just for visualising fit/clearance in the assembly.
// ============================================================
include <config.scad>

module fan_dummy() {
    color([0.25, 0.25, 0.27]) {
        difference() {
            translate([-fan_size/2, -fan_size/2, 0])
                cube([fan_size, fan_size, fan_thick]);
            translate([0, 0, -eps])
                cylinder(h = fan_thick + 2*eps, d = bore_d);
            for (sx = [-1, 1], sy = [-1, 1])
                translate([sx*fan_pitch/2, sy*fan_pitch/2, -eps])
                    cylinder(h = fan_thick + 2*eps, d = fan_hole_d);
        }
        cylinder(h = fan_thick, d = 40);                 // hub
        for (a = [0 : 90 : 359])                         // struts
            rotate([0, 0, a]) translate([0, 0, fan_thick/2])
                cube([bore_d, 4, 2], center = true);
    }
}

fan_dummy();
