include <parameters.scad>
use <primitives.scad>

/*
  Vault Lite V0.1 vial-fit coupon

  Print flat, text facing up, in the intended production material/profile.
  The wells and troughs are deliberately independent of unknown magnet sizes.
*/

$fn = 72;
coupon_x = 150;
coupon_y = 105;
coupon_z = 14;
coupon_radius = 3;
well_depth = 11;
trough_length = 60; // exceeds the KNOWN 56 mm maximum large-vial length

module coupon_blank() {
    rounded_box([coupon_x, coupon_y, coupon_z], coupon_radius);
}

module vial_fit_coupon() {
    difference() {
        coupon_blank();

        // Blind upright wells; 3 mm floor remains.
        for (i = [0 : len(small_well_diameters) - 1]) {
            x = 25 + i * 33;
            translate([x, 86, coupon_z - well_depth])
                cylinder(d = small_well_diameters[i], h = well_depth + 0.1);
        }

        // Full-length open semicircular troughs for horizontal large-vial fit.
        for (i = [0 : len(large_trough_diameters) - 1]) {
            x = 16 + i * 29.5;
            translate([x, 37, coupon_z])
                horizontal_trough(large_trough_diameters[i], trough_length);
        }

        // Recessed labels survive first-layer handling better than raised text.
        for (i = [0 : len(small_well_diameters) - 1]) {
            x = 25 + i * 33;
            translate([x, 101, coupon_z - 0.45])
                engraved_label(str(small_well_diameters[i]), 3.4, 0.5);
        }
        for (i = [0 : len(large_trough_diameters) - 1]) {
            x = 16 + i * 29.5;
            translate([x, 4.5, coupon_z - 0.45])
                engraved_label(str(large_trough_diameters[i]), 3.0, 0.5);
        }
    }
}

vial_fit_coupon();
