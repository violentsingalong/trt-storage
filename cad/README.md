# CAD sources

- `parameters.scad` — single source for shared dimensions and uncertainty status.
- `primitives.scad` — reusable printable geometry.
- `calibration_coupon.scad` — vial-clearance artifact with four upright small-vial wells and five full-length large-vial troughs.
- `magnet_coupon.scad` — three-cover encapsulation test for the measured 6 × 2 mm disc magnets.
- `vertical_vial_coupon.scad` — deep-wall upright-vial fit test for the Cycle Mega family.
- `vial_liner_coupon.scad` — six removable split-collar iterations for narrower large vials.

The recommended reproducible workflow uses the included Docker container:

```sh
make image
make check
```

`make check` renders `exports/stl/vault-lite-v0.1-vial-coupon.stl` and then checks the mesh with ADMesh. Files are written as the invoking host user rather than root.

`make check-magnet` renders and checks the 6 × 2 mm magnet-cover coupon. With a 0.20 mm layer height, inspect the slicer preview and pause immediately before the first sealing layer above the nominal 4.60 mm pocket roof. Insert all three magnets with identical polarity and ensure they sit below the active print plane before resuming.

`make check-vertical` renders and checks the 25.4–25.8 mm vertical 5–10 mL vial-well coupon.

`make check-liners` renders and checks the Gereropharm and KOSA split-collar iteration set.

See `../docs/bambu-studio-magnet-coupon.md` for the Bambu Studio procedure. Save the sliced setup with its verified pause as a Bambu `.3mf` project rather than relying on a fixed layer number in the raw STL.

If OpenSCAD is installed directly on the host, the equivalent export from this directory is:

```sh
openscad -o ../exports/stl/vault-lite-v0.1-vial-coupon.stl calibration_coupon.scad
```
