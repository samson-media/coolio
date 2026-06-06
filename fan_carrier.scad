// ============================================================
//  fan_carrier.scad — the part you fabricate (one per fan)
//  Flat profile: open frame + side wing. Print it, or cut from
//  sheet. Renders standalone here; the assembly `use`s carrier().
// ============================================================
include <config.scad>

module fan_frame() {
    difference() {
        linear_extrude(thickness)
            offset(r = frame_corner_r)
                square(fan_size - 2*frame_corner_r, center = true);
        translate([0, 0, -eps])
            cylinder(h = thickness + 2*eps, d = bore_d);
        for (sx = [-1, 1], sy = [-1, 1])
            translate([sx*fan_pitch/2, sy*fan_pitch/2, -eps])
                cylinder(h = thickness + 2*eps, d = fan_hole_d);
    }
}

module mount_wing() {
    difference() {
        translate([wing_x0, -flange_height/2, 0])
            cube([wing_x1 - wing_x0, flange_height, thickness]);
        for (sy = [-1, 1])
            translate([spine_center_x, sy*mount_bolt_span/2, -eps])
                hull() for (dy = [-slot_travel/2, slot_travel/2])
                    translate([0, dy, 0])
                        cylinder(h = thickness + 2*eps, d = mount_bolt_d);
    }
}

// s = "right" or "left" (mirror for the other rail)
module carrier(s = "right") {
    color("DarkOrange")
        scale([(s == "right") ? 1 : -1, 1, 1])
            union() { fan_frame(); mount_wing(); }
}

carrier();   // standalone preview (ignored when this file is `use`d)
