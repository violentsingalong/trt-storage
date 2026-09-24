include <parameters.scad>
use <primitives.scad>

/*
  V2 full-depth reducer-liner pass for the selected 25.60 mm well.

  Only the useful decision points remain:
    G1 — 24.0 mm ID
    G3 — 24.4 mm ID
    K1 — 22.4 mm ID

  The 25.10 mm OD increases nominal diametral well clearance to 0.50 mm.
  The 24.0 mm body bottoms in the coupon well before the extraction ear can
  carry insertion force. Large text and notch counts replace tiny labels.
*/

$fn = 120;
liner_outer_d = 25.10;
liner_h = 24.0;
split_gap = 1.4;
ear_w = 12;
ear_out = 4.0;
ear_h = 1.6;
ear_root_h = 2.6;
notch_w = 1.2;
notch_d = 1.3;
part_pitch = 36;

variants = [
    [24.0, "G1", 1],
    [24.4, "G3", 3],
    [22.4, "K1", 2]
];

module identifier_notches(count, outer_r) {
    spacing = 2.4;
    for (i = [0 : count - 1]) {
        x = (i - (count - 1) / 2) * spacing;
        translate([x - notch_w / 2,
                   -outer_r - ear_out - 0.1,
                   liner_h + ear_h - notch_d])
            cube([notch_w, notch_d + 0.2, notch_d + 0.1]);
    }
}

module full_depth_liner(inner_d, code, notch_count) {
    outer_r = liner_outer_d / 2;

    difference() {
        union() {
            difference() {
                cylinder(d = liner_outer_d, h = liner_h);
                translate([0, 0, -0.1])
                    cylinder(d = inner_d, h = liner_h + 0.2);
            }

            // Root rises from inside the OD, supporting the above-rim ear
            // without placing an external ledge below the full well depth.
            translate([-ear_w / 2, -outer_r + 0.25,
                       liner_h - ear_root_h])
                cube([ear_w, 1.4, ear_root_h + ear_h]);

            // Extraction ear begins at the well rim (Z=24 mm).
            translate([-ear_w / 2, -outer_r - ear_out,
                       liner_h])
                cube([ear_w, ear_out + 1.0, ear_h]);
        }

        // Compliance split opposite the extraction ear.
        translate([-split_gap / 2, 0, -0.1])
            cube([split_gap, outer_r + 1, liner_h + 0.2]);

        // Preserve the vial bore through the internal ear root.
        translate([0, 0, -0.1])
            cylinder(d = inner_d, h = liner_h + ear_h + 0.2);

        // Large recessed label plus tactile/visual notch count.
        translate([0, -outer_r - ear_out / 2 + 0.2,
                   liner_h + ear_h - 0.45])
            engraved_label(code, 4.0, 0.5);
        identifier_notches(notch_count, outer_r);
    }
}

for (i = [0 : len(variants) - 1]) {
    translate([18 + i * part_pitch, 18, 0])
        full_depth_liner(variants[i][0], variants[i][1], variants[i][2]);
}
