include <parameters.scad>
use <primitives.scad>

// Guard against rendering if measured magnet dimensions are later removed.
assert(!is_undef(magnet_shape), "Set measured magnet_shape in parameters.scad");
assert(!is_undef(magnet_z), "Set measured magnet_z in parameters.scad");
assert(magnet_shape != "round" || !is_undef(magnet_d),
       "Set measured magnet_d for round magnets");
assert(magnet_shape != "rectangular" || (!is_undef(magnet_x) && !is_undef(magnet_y)),
       "Set measured magnet_x and magnet_y for rectangular magnets");

assert(magnet_pocket_d > magnet_d, "magnet pocket must clear measured diameter");
assert(magnet_pocket_z > magnet_z, "magnet must sit below the sealing print plane");

/*
  Three independent encapsulation cells for 6 x 2 mm disc magnets.

  Slice at 0.20 mm layers and pause before the first layer above the cavity
  (nominally Z=4.60 mm). Insert one magnet per cell with identical polarity,
  confirm each is fully below the print plane, then resume.

  Each cell has the same 6.20 x 2.20 mm provisional pocket and a different
  cover thickness: 0.4, 0.6, or 0.8 mm. Labels are on the surrounding base,
  not over the covers.
*/

$fn = 72;
base_x = 74;
base_y = 28;
base_z = 2.4;
cell_size = 18;
cell_pitch = 23;
cell_x0 = 14;
cavity_floor_z = base_z;
cavity_roof_z = cavity_floor_z + magnet_pocket_z;

module magnet_cell(x, cover) {
    difference() {
        translate([x - cell_size / 2, 7, 0])
            cube([cell_size, cell_size, cavity_roof_z + cover]);
        translate([x, 16, cavity_floor_z])
            cylinder(d = magnet_pocket_d, h = magnet_pocket_z + 0.01);
    }
}

difference() {
    rounded_box([base_x, base_y, base_z], 2.5);
    for (i = [0 : len(magnet_cover_thicknesses) - 1]) {
        x = cell_x0 + i * cell_pitch;
        translate([x, 3.2, base_z - 0.45])
            engraved_label(str(magnet_cover_thicknesses[i]), 3.2, 0.5);
    }
}

for (i = [0 : len(magnet_cover_thicknesses) - 1]) {
    magnet_cell(cell_x0 + i * cell_pitch, magnet_cover_thicknesses[i]);
}
