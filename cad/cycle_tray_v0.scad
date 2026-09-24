include <parameters.scad>
use <primitives.scad>

/*
  Cycle tray V0 layout study.

  This establishes the 14-well and supply-bay plan before the shared stack,
  lid, and bar-magnet interface is finalized. The exported study is shallow to
  reduce review-print material; set layout_study = false to preview the full
  provisional perimeter height without changing the interior plan.
*/

$fn = 72;
layout_study = is_undef(LAYOUT_STUDY) ? true : LAYOUT_STUDY;

tray_x = mega_x;
tray_y = mega_y;
floor_z = 2.4;
wall = 2.4;
feature_h = 24.0;
study_h = floor_z + feature_h;
full_perimeter_h = cycle_case_z - lid_thickness;
perimeter_h = layout_study ? study_h : full_perimeter_h;

well_id = vertical_vial_cavity_d;
well_wall = 2.4;
divot_d = 34.0;
divot_r = divot_d / 2;
divot_sphere_r = 34.0;

outer_col_x = 18.5;
inner_col_x = 47.3;
row_ys = [18.5, 47.3, 76.1, 104.9, 133.7];

// Frames nearly meet the adjacent rings/rim; usable openings are approximately
// 143.1 x 78.2 mm below and 85.5 x 56.7 mm above after 2.4 mm walls.
lower_bay = [34.0, 5.5, 147.9, 83.0];
upper_bay = [62.8, 88.5, 90.3, 61.5];
bay_radius = 4.0;
finger_d = 18.0;

module rounded_frame(size, frame_wall, height, radius) {
    difference() {
        rounded_box([size.x, size.y, height], radius);
        translate([frame_wall, frame_wall, -0.1])
            rounded_box([size.x - 2 * frame_wall,
                         size.y - 2 * frame_wall,
                         height + 0.2],
                        max(0.1, radius - frame_wall));
    }
}

module bank_footprint(side) {
    outer_x = side == 0 ? outer_col_x : tray_x - outer_col_x;
    inner_x = side == 0 ? inner_col_x : tray_x - inner_col_x;

    union() {
        // Five-position outer-column capsule.
        hull() {
            translate([outer_x, row_ys[0]]) circle(r = divot_r);
            translate([outer_x, row_ys[4]]) circle(r = divot_r);
        }

        // Two-by-two upper block, leaving the lower central bay unobstructed.
        hull() {
            for (x = [outer_x, inner_x])
                for (i = [3, 4])
                    translate([x, row_ys[i]]) circle(r = divot_r);
        }
    }
}

module spherical_divot(x, y) {
    deck_top_z = floor_z + feature_h;
    // Place the lower sphere surface at deck height at r=17 mm. With the
    // selected 34 mm sphere radius, the surface falls about 2.05 mm by the
    // 25.6 mm bore edge, creating a shallow machined-looking lead-in.
    sphere_center_z = deck_top_z
                    + sqrt(divot_sphere_r * divot_sphere_r
                           - divot_r * divot_r);
    translate([x, y, sphere_center_z])
        sphere(r = divot_sphere_r, $fn = 96);
}

module bank_deck(side) {
    outer_x = side == 0 ? outer_col_x : tray_x - outer_col_x;
    inner_x = side == 0 ? inner_col_x : tray_x - inner_col_x;

    difference() {
        translate([0, 0, floor_z])
            linear_extrude(height = feature_h)
                bank_footprint(side);

        // Five outer wells plus two upper inner wells.
        for (y = row_ys) {
            translate([outer_x, y, floor_z - 0.1])
                cylinder(d = well_id, h = feature_h + 0.2);
            spherical_divot(outer_x, y);
        }

        for (i = [3, 4]) {
            translate([inner_x, row_ys[i], floor_z - 0.1])
                cylinder(d = well_id, h = feature_h + 0.2);
            spherical_divot(inner_x, row_ys[i]);
        }
    }
}

module bay_frame(rect, bilateral_access = false) {
    difference() {
        translate([rect[0], rect[1], floor_z])
            rounded_frame([rect[2], rect[3]], wall, feature_h, bay_radius);

        if (bilateral_access) {
            // Top-view semicircular access through both side walls.
            for (x = [rect[0], rect[0] + rect[2]]) {
                translate([x, rect[1] + rect[3] / 2, floor_z + feature_h * 0.55])
                    cylinder(d = finger_d,
                             h = feature_h * 0.55 + 0.2);
            }
        }
    }
}

union() {
    // Common floor. Magnet and stack-interface geometry is intentionally
    // deferred until the ordered bar magnets are physically characterized.
    rounded_box([tray_x, tray_y, floor_z], outer_corner_radius);

    // Provisional outer rim: shallow in the layout-study export, full height
    // only when LAYOUT_STUDY=false.
    difference() {
        rounded_box([tray_x, tray_y, perimeter_h], outer_corner_radius);
        translate([wall, wall, floor_z])
            rounded_box([tray_x - 2 * wall,
                         tray_y - 2 * wall,
                         perimeter_h - floor_z + 0.1],
                        outer_corner_radius - wall);
    }

    // Continuous raised banks prevent small items and debris from falling
    // between isolated wells. Overlapping 34 mm spherical divots create the
    // deliberate machined surface around all fourteen openings.
    for (side = [0, 1])
        bank_deck(side);

    bay_frame(lower_bay, false);
    bay_frame(upper_bay, true);
}
