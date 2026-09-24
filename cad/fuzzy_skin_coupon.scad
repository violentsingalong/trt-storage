use <primitives.scad>

/*
  Minimal upright wall card for Bambu Studio fuzzy-skin comparisons.

  Render three copies with FUZZY_INDEX = 0, 1, and 2. Fuzzy skin is a slicer
  setting and is not encoded in the STL; the index changes only the recessed
  identifier on the stabilizing foot.
*/

FUZZY_INDEX = is_undef(FUZZY_INDEX) ? 0 : FUZZY_INDEX;
labels = ["0.05", "0.08", "0.12"];

assert(FUZZY_INDEX >= 0 && FUZZY_INDEX < len(labels),
       "FUZZY_INDEX must be 0, 1, or 2");

card_w = 24;
card_h = 24;
card_t = 1.6;
foot_d = 8;
foot_h = 2.0;
label_depth = 0.4;

difference() {
    union() {
        // Thin upright test face. Its broad X/Z faces show the applied texture.
        translate([0, foot_d - card_t, foot_h])
            cube([card_w, card_t, card_h]);

        // Low-volume foot keeps the wall stable without a brim in most cases.
        cube([card_w, foot_d, foot_h]);
    }

    // Identifier is recessed into the horizontal foot and does not alter the
    // broad vertical comparison face.
    translate([card_w / 2, foot_d / 2 - 0.4, foot_h - label_depth])
        engraved_label(labels[FUZZY_INDEX], 3.2, label_depth + 0.05);
}
