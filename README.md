# Vault Lite

Vault Lite is a parametric, FDM-printable family of magnetic storage cases for medication vials, injection supplies, and related accessories. It is designed for PETG on a Bambu Lab X1 Carbon and uses shared interfaces so matching footprints can stack as modular storage layers.

Commercial products are used only as functional and dimensional references. Vault Lite uses original CAD, visual treatment, and branding.

## Project status

**Current stage: V0.1 calibration complete; stack-interface and Mini prototype are next.**

| Item | Result |
|---|---|
| Small-vial cavity | 17.00 mm tested with current 3 mL vial |
| Horizontal large-vial trough | 26.00 mm selected across several current vials |
| Magnets | Round 6 × 2 mm |
| Magnet pocket | 6.20 mm diameter × 2.20 mm deep; insertion tested |
| Magnet cover | 0.80 mm selected for best surface finish; mating hold test pending |
| CAD toolchain | Dockerized OpenSCAD + ADMesh |
| Printable artifacts | Horizontal vial-fit, vertical vial-well, and magnet-cover coupon STLs exported and validated |

See [the dimension register](docs/dimensions.md) for the distinction between known, inferred, and physically tested values.

## Planned models

### Mini

- Exterior: **152.4 × 127.0 × 44.45 mm**
- Six upright 1–3 mL vial positions
- Secondary supply compartments
- Removable magnetic lid

### Mega

- Exterior: **215.9 × 152.4 × 44.45 mm**
- Horizontal 5–10 mL vial storage
- Selectable TRT/supply, expanded vial, and open-cavity layouts

### Cycle Mega

- Exterior: **215.9 × 152.4 × 63.5 mm**
- Fourteen upright 5–10 mL vial positions
- Taller variant sharing the Mega X/Y footprint and stack datum
- No fitted 1–3 mL storage

### Future Micro

- Reference footprint: **152.4 × 76.2 mm**
- Recorded for future interface compatibility; not currently part of V1 scope

All listed bodies and lids fit within the X1C's 256 × 256 mm build area.

## Modular stack system

Every body is also a storage layer:

- same-footprint layers can stack in any order;
- purpose-built and open-cavity layers share one interface;
- intermediate layers may be lidless;
- only the uppermost layer requires a lid;
- printed registration geometry carries lateral loads;
- corner magnets provide retention rather than alignment;
- lids, parked lids, and stacked bodies use one documented polarity convention.

The registration geometry and polarity map remain under development and will be selected using a two-plate physical coupon.

## Lid appearance

The default lid is monochrome black with a centered, shallow raised user-supplied emblem and a slightly taller perimeter bezel. The bezel protects the emblem and becomes the structural bearing surface when modules stack. The emblem remains a separate CAD region for an optional two-color AMS version.

See [the lid visual-language specification](docs/lid-visual-language.md).

## Repository layout

```text
cad/             Parametric OpenSCAD sources and shared parameters
docs/            Specifications, tested dimensions, and print instructions
exports/stl/     Generated printable meshes
exports/3mf/     Bambu Studio projects after slicer validation
prototypes/      Prototype notes and future iteration artifacts
reference/       Functional and dimensional reference images
```

## Generate and validate models

Requirements: Docker with the Compose plugin.

```sh
make image          # build the local OpenSCAD/ADMesh image
make check          # generate and validate the vial coupon
make check-magnet   # generate and validate the magnet coupon
make check-vertical # generate and validate the Cycle Mega vertical-well coupon
make check-all      # generate and validate all calibration coupons
```

Generated files are written to `exports/stl/` as the invoking host user.

## Calibration artifacts

### Vial-fit coupon

[Download the current STL](exports/stl/vault-lite-v0.1-vial-coupon.stl)

- Upright wells: 17.0, 17.2, 17.4, and 17.6 mm
- Full-length horizontal troughs: 25.8–26.6 mm
- Current selections: 17.0 mm small-vial cavity and 26.0 mm large-vial trough

### Magnet-cover coupon

[Download the current STL](exports/stl/vault-lite-v0.1-magnet-cover-coupon.stl)

- Magnet: 6 × 2 mm round disc
- Pocket: 6.20 × 2.20 mm
- Tested covers: 0.4, 0.6, and 0.8 mm
- Current selection: 0.8 mm, pending mating-force validation

Follow the [Bambu Studio pause procedure](docs/bambu-studio-magnet-coupon.md). Inserted magnets are encapsulated permanently by this coupon.

### Vertical large-vial coupon

[Download the current STL](exports/stl/vault-lite-v0.1-vertical-vial-coupon.stl)

- Upright wells: 25.6, 25.8, 26.0, and 26.2 mm
- Well depth: 24 mm with a 1 mm entry chamfer
- Intended to select the Cycle Mega upright-well diameter using the measured vial assortment

## Prototype printing assumptions

- Material: PETG
- Printer: Bambu Lab X1 Carbon
- Body orientation: cavity upward
- Initial production profile: 0.20 mm layer height and four walls
- Calibration-only vial coupon: 0.24 mm Draft, three walls, 15% gyroid is acceptable
- Supports should be avoided through geometry wherever practical

Final settings will be published only after the body and lid are physically validated.

## Roadmap and issues

Outstanding work is tracked in [GitHub Issues](https://github.com/violentsingalong/trt-storage/issues). The implementation order is:

1. Validate the shared magnetic stack and alignment interface.
2. Build and physically iterate the Mini body and lid.
3. Build and physically iterate the standard Mega layouts.
4. Build the taller Cycle Mega variant.
5. Add matching open-cavity modular layers.
6. Finalize lid artwork, Bambu Studio projects, and release documentation.

The detailed engineering sequence remains in [the project plan](docs/project-plan.md).

## Design constraints

- Keep all geometry parametric and source-controlled.
- Label photograph-derived measurements as inferred.
- Do not reproduce third-party logos, names, or decorative engraving.
- Ensure inserted magnets sit below the active print plane before resuming a paused print.
- Use mechanical indexing so magnets do not carry all lateral shear.
- Validate real storage objects before calling a model production-ready.
