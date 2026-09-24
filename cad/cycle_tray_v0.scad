include <parameters.scad>
use <primitives.scad>

/*
  Cycle tray V0 layout study.

  The lower tray is one monolithic deck rather than separate vial rings and
  compartment frames. Wells, divots, and supply cavities are cut from that
  deck, eliminating narrow drop gaps and redundant inner/outer boundary walls.
  The final stack and bar-magnet interface remains intentionally deferred.
*/

$fn = 72;
layout_study = is_undef(LAYOUT_STUDY) ? true : LAYOUT_STUDY;

tray_x = mega_x;
tray_y = mega_y;
floor_z = 2.4;
wall = 2.4;
long_edge_magnet_rail = 8.0; // Top/bottom walls; exact pockets pending test.
feature_h = 24.0;
deck_top_z = floor_z + feature_h;
full_perimeter_h = cycle_case_z - lid_thickness;

well_id = vertical_vial_cavity_d;
divot_d = 34.0;
divot_r = divot_d / 2;
divot_sphere_r = 34.0;

outer_col_x = 22.0;
inner_col_x = 51.0;
row_ys = [22.0, 51.0, 80.0, 109.0, 138.0];

// Usable cavity openings. Each uses the exterior wall directly at Y-min or
// Y-max; the openings are separated by one 2.4 mm divider.
lower_opening = [39.0, long_edge_magnet_rail, 142.0, 84.0];
upper_opening = [68.0, 94.4, 84.0,
                 tray_y - long_edge_magnet_rail - 94.4];
opening_radius = 3.0;
finger_d = 18.0;

module cut_vials_and_divots() {
    sphere_center_z = deck_top_z
                    + sqrt(divot_sphere_r * divot_sphere_r
                           - divot_r * divot_r);

    for (side = [0, 1]) {
        outer_x = side == 0 ? outer_col_x : tray_x - outer_col_x;
        inner_x = side == 0 ? inner_col_x : tray_x - inner_col_x;

        for (y = row_ys) {
            translate([outer_x, y, floor_z - 0.1])
                cylinder(d = well_id, h = feature_h + 0.2);
            translate([outer_x, y, sphere_center_z])
                sphere(r = divot_sphere_r, $fn = 96);
        }

        for (i = [3, 4]) {
            translate([inner_x, row_ys[i], floor_z - 0.1])
                cylinder(d = well_id, h = feature_h + 0.2);
            translate([inner_x, row_ys[i], sphere_center_z])
                sphere(r = divot_sphere_r, $fn = 96);
        }
    }
}

module cut_opening(rect) {
    translate([rect[0], rect[1], floor_z])
        rounded_box([rect[2], rect[3], feature_h + 0.2], opening_radius);
}

module full_height_outer_rim() {
    if (!layout_study) {
        difference() {
            rounded_box([tray_x, tray_y, full_perimeter_h],
                        outer_corner_radius);
            translate([wall, wall, deck_top_z])
                rounded_box([tray_x - 2 * wall,
                             tray_y - 2 * wall,
                             full_perimeter_h - deck_top_z + 0.1],
                            outer_corner_radius - wall);
        }
    }
}

difference() {
    union() {
        // One closed deck: ordinary slicer infill supports the top skin without
        // accessible gaps between wells, bins, and the exterior wall.
        rounded_box([tray_x, tray_y, deck_top_z], outer_corner_radius);
        full_height_outer_rim();
    }

    cut_vials_and_divots();
    cut_opening(lower_opening);
    cut_opening(upper_opening);

    // Bilateral upper-half finger reliefs in the packet-bay side walls.
    for (x = [upper_opening[0], upper_opening[0] + upper_opening[2]]) {
        translate([x,
                   upper_opening[1] + upper_opening[3] / 2,
                   floor_z + feature_h * 0.55])
            cylinder(d = finger_d, h = feature_h * 0.55 + 0.2);
    }
}
