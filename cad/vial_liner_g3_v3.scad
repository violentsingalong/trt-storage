use <primitives.scad>

/*
  Single Gereropharm G3 revision for the 25.60 mm vertical well.

  The V2 25.10/24.40 mm shell left a 0.35 mm radial wall and was discarded
  by the 0.4 mm nozzle slicing profile. This revision uses a 25.30 mm outer
  envelope for a 0.45 mm radial wall. Two near-full-height relief slots plus
  the primary split form flexible petals joined by a 2 mm bottom band, reducing
  insertion force and inward bore constriction while preserving one-piece use.
*/

$fn = 120;
outer_d = 25.30;
inner_d = 24.40;
liner_h = 24.0;
bottom_band_h = 2.0;
slot_w = 1.4;
ear_w = 12;
ear_out = 4.0;
ear_h = 1.6;
ear_root_h = 2.6;
notch_w = 1.2;
notch_d = 1.3;

module radial_slot(angle, z0, slot_h) {
    rotate([0, 0, angle])
        translate([-slot_w / 2, 0, z0])
            cube([slot_w, outer_d / 2 + 1, slot_h]);
}

module g3_liner() {
    outer_r = outer_d / 2;

    difference() {
        union() {
            difference() {
                cylinder(d = outer_d, h = liner_h);
                translate([0, 0, -0.1])
                    cylinder(d = inner_d, h = liner_h + 0.2);
            }

            // Internal root supports the extraction ear above the well rim.
            translate([-ear_w / 2, -outer_r + 0.25,
                       liner_h - ear_root_h])
                cube([ear_w, 1.4, ear_root_h + ear_h]);

            translate([-ear_w / 2, -outer_r - ear_out, liner_h])
                cube([ear_w, ear_out + 1.0, ear_h]);
        }

        // Primary full-height split and two relief slots. The latter stop at
        // the 2 mm bottom band so the three flexible petals remain one part.
        radial_slot(0, -0.1, liner_h + 0.2);
        radial_slot(120, bottom_band_h, liner_h - bottom_band_h + 0.2);
        radial_slot(240, bottom_band_h, liner_h - bottom_band_h + 0.2);

        // Preserve the vial bore through the internal ear root.
        translate([0, 0, -0.1])
            cylinder(d = inner_d, h = liner_h + ear_h + 0.2);

        // Large label and three tactile/visual notches identify G3.
        translate([0, -outer_r - ear_out / 2 + 0.2,
                   liner_h + ear_h - 0.45])
            engraved_label("G3", 4.0, 0.5);

        for (i = [-1 : 1]) {
            translate([i * 2.4 - notch_w / 2,
                       -outer_r - ear_out - 0.1,
                       liner_h + ear_h - notch_d])
                cube([notch_w, notch_d + 0.2, notch_d + 0.1]);
        }
    }
}

translate([18, 18, 0]) g3_liner();
