// ============================================================
//  config.scad — shared dimensions (single source of truth)
//  Every other file includes this. Change a number here and
//  the part files AND the assembly update together.
//  Units: mm.  Z is up.
// ============================================================

/* ----- rack ----- */
U       = 44.45;
span_U  = 6;
span    = span_U * U;        // 266.7 — spine length / mount span
post_t  = 4;
post_w  = 25;

/* ----- fan ----- */
fan_size  = 120;
fan_thick = 25;
fan_pitch = 105;
fan_hole_d = 4.5;            // M4 clearance (anti-vibration washers under the head)
bore_d    = 112;

/* ----- carrier ----- */
thickness       = 6;         // one thickness -> flat part (print or waterjet/CNC)
frame_corner_r  = 4;
gap_to_spine    = 6;
mount_bolt_d    = 5.5;       // M5 clearance into T-nuts
mount_bolt_span = 90;
slot_travel     = 6;
flange_height   = 100;

/* ----- spine (2020) ----- */
ext_width  = 20;

/* ----- fan heights along the rail ----- */
fan1_z = fan_size/2 + 5;
fan2_z = span - fan_size/2 - 5;

/* ----- derived placement (shared by carrier + spine + bracket) ----- */
spine_face_x   = fan_size/2 + gap_to_spine;   // 66
spine_center_x = spine_face_x + ext_width/2;  // 76
wing_x0        = fan_size/2 - 4;              // 56
wing_x1        = spine_face_x + ext_width;    // 86
post_x         = wing_x1 + 12;                // 98 (post inner face)

$fn = 64;
eps = 0.01;
