include <parameters.scad>
use <primitives.scad>

/*
  Removable split-collar iterations for the selected 25.60 mm Cycle Mega well.

  G1/G2/G3 target the 23.87 mm Gereropharm body.
  K1/K2/K3 target the 22.21 mm KOSA body.

  Print upright as modeled using Arachne wall generation. The collars are
  intentionally tall enough for their pull tabs to remain at the top of the
  existing 24 mm-deep vertical-well coupon. The final insert may be shortened
  or converted to a ribbed cage after fit, drag, and retention are evaluated.
*/

$fn = 120;
liner_h = 23.5;
split_gap = 1.4;
tab_w = 9;
tab_l = 5;
tab_h = 1.4;
column_pitch = 34;
row_pitch = 38;

module split_collar(inner_d, code) {
    outer_r = vertical_liner_outer_d / 2;

    difference() {
        union() {
            difference() {
                cylinder(d = vertical_liner_outer_d, h = liner_h);
                translate([0, 0, -0.1])
                    cylinder(d = inner_d, h = liner_h + 0.2);
            }

            // Pull tab rests on the well rim and provides extraction access.
            translate([-tab_w / 2, -outer_r - tab_l + 0.8, liner_h - tab_h])
                cube([tab_w, tab_l, tab_h]);
        }

        // Rear split allows the collar to compress during insertion.
        translate([-split_gap / 2, 0, -0.1])
            cube([split_gap, outer_r + 1, liner_h + 0.2]);

        // Keep the pull tab out of the vial bore on the thinnest variants.
        translate([0, 0, -0.1])
            cylinder(d = inner_d, h = liner_h + 0.2);

        // Recessed variant code on the pull tab.
        translate([0, -outer_r - tab_l / 2 + 0.4, liner_h - 0.45])
            engraved_label(code, 2.5, 0.5);
    }
}

for (i = [0 : len(gereropharm_liner_ids) - 1]) {
    translate([17 + i * column_pitch, 17, 0])
        split_collar(gereropharm_liner_ids[i], str("G", i + 1));
}

for (i = [0 : len(kosa_liner_ids) - 1]) {
    translate([17 + i * column_pitch, 17 + row_pitch, 0])
        split_collar(kosa_liner_ids[i], str("K", i + 1));
}
