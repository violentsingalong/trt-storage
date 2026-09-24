// Shared printable geometry for Vault Lite models.

module rounded_box(size = [20, 20, 5], radius = 2, center = false) {
    assert(radius >= 0, "radius must be non-negative");
    assert(2 * radius <= min(size.x, size.y), "radius is too large for box");
    translate(center ? [0, 0, -size.z / 2] : [size.x / 2, size.y / 2, 0])
        linear_extrude(height = size.z)
            offset(r = radius)
                square([size.x - 2 * radius, size.y - 2 * radius], center = true);
}

module engraved_label(label, size = 4, depth = 0.5, halign = "center") {
    linear_extrude(height = depth)
        text(label, size = size, halign = halign, valign = "center",
             font = "Liberation Sans:style=Bold");
}

module horizontal_trough(diameter, length) {
    rotate([90, 0, 0]) cylinder(d = diameter, h = length, center = true, $fn = 72);
}
