// Vault Lite shared parameters. Units are millimetres.
// Status tags: KNOWN, INFERRED, TESTED, or TBD.

// KNOWN — published exterior envelopes and compatibility limits.
micro_x = 152.40; // Reference ecosystem footprint: 6 x 3 in
micro_y = 76.20;
mini_x = 152.40;
mini_y = 127.00;
mega_x = 215.90;
mega_y = 152.40;
case_z = 44.45;
cycle_case_z = 63.50; // KNOWN_REFERENCE: written Cycle Mega product specification, 2.5 in

// Shared stack interface. These remain unresolved until physical testing.
stack_interface_version = "VL-SI-0";
stack_rebate_depth = undef;       // TBD_FROM_COUPON
stack_rebate_width = undef;       // TBD_FROM_COUPON
stack_xy_clearance = undef;       // TBD_FROM_COUPON
stack_corner_inset_x = undef;     // REQUIRED_AFTER_MAGNET_SELECTION
stack_corner_inset_y = undef;     // REQUIRED_AFTER_MAGNET_SELECTION

small_vial_max_d = 16.79;
small_vial_max_h = 38.48;
large_vial_max_d = 25.60;
large_vial_max_l = 56.00;

// KNOWN_USER_MEASURED — current physical supplies (cap included).
user_large_vial_max_l = 55.00;

// TESTED_CURRENT_VIAL — 17.00 mm coupon well comfortably fits user's 3 mL vial.
// This is 0.21 mm diametral clearance over the published 16.79 mm envelope.
small_vial_clearance = 0.21;
small_vial_cavity_d = small_vial_max_d + small_vial_clearance;

// TESTED_CURRENT_VIALS — 26.00 mm trough fits user's varied 5–10 mL vials.
// This is 0.40 mm diametral clearance over the published 25.60 mm envelope.
large_vial_clearance = 0.40;
large_vial_cavity_d = large_vial_max_d + large_vial_clearance;

// KNOWN_USER_MEASURED — round disc magnets, 6 mm diameter x 2 mm thick.
magnet_shape = "round";     // "round" or "rectangular"
magnet_d = 6.00;            // round magnets only
magnet_x = undef;           // rectangular magnets only
magnet_y = undef;           // rectangular magnets only
magnet_z = 2.00;
magnet_pocket_d = 6.20;     // PROVISIONAL; validate insertion fit in PETG
magnet_pocket_z = 2.20;     // PROVISIONAL; allows insertion below print plane
magnet_cover = 0.80;        // TESTED_VISUAL; best surface result, hold pending

// PROVISIONAL — printable defaults, to be validated in PETG.
outer_corner_radius = 6.0;
min_wall = 2.4;
floor_thickness = 2.4;
lid_thickness = 4.0;
lid_gap_xy = 0.30;
alignment_clearance = 0.25;

// PROVISIONAL lid visual language — multiples of a 0.20 mm layer height.
lid_emblem_raise = 0.60;
lid_bezel_raise = 0.80;      // bezel carries stacked load, 0.20 above emblem
lid_bezel_width = 2.40;
lid_bezel_edge_inset = 5.00;
lid_stack_relief_depth = 1.00; // underside clearance above bezel/emblem
lid_emblem_max_fraction = 0.42; // maximum fraction of smaller lid dimension

// Calibration ladders.
small_well_diameters = [17.0, 17.2, 17.4, 17.6];
large_trough_diameters = [25.8, 26.0, 26.2, 26.4, 26.6];
vertical_well_diameters = [25.6, 25.8, 26.0, 26.2];
magnet_cover_thicknesses = [0.4, 0.6, 0.8];
