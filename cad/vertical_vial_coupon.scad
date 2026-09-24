include <parameters.scad>
use <primitives.scad>

/*
  Cycle Mega vertical 5–10 mL vial coupon.

  The 24 mm well depth is below the shortest measured straight-body height
  (31.9 mm) while providing substantially more wall contact than the
  horizontal trough coupon. Print upright as modeled with no supports.
*/

$fn = 96;
base_x = 98;
base_y = 40;
base_z = 3;
base_radius = 3;
well_depth = 24;
entry_chamfer_h = 1.0;
entry_chamfer_add_d = 2.0;
tower_outer_d = 31.5;
center_y = 22;
center_x0 = 16.5;
center_pitch = 32.3;
total_z = base_z + well_depth;

module well_cut(diameter) {
    translate([0, 0, base_z])
        cylinder(d = diameter, h = well_depth + 0.1);
    translate([0, 0, total_z - entry_chamfer_h])
        cylinder(d1 = diameter,
                 d2 = diameter + entry_chamfer_add_d,
                 h = entry_chamfer_h + 0.1);
}

difference() {
    union() {
        rounded_box([base_x, base_y, base_z], base_radius);
        for (i = [0 : len(vertical_well_diameters) - 1]) {
            x = center_x0 + i * center_pitch;
            translate([x, center_y, 0])
                cylinder(d = tower_outer_d, h = total_z);
        }
    }

    for (i = [0 : len(vertical_well_diameters) - 1]) {
        x = center_x0 + i * center_pitch;
        translate([x, center_y, 0])
            well_cut(vertical_well_diameters[i]);
        translate([x, 4.0, base_z - 0.45])
            engraved_label(str(vertical_well_diameters[i]), 3.2, 0.5);
    }
}
