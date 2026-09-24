# Vault Lite — Codex Handoff

## Project goal

Design two premium-feeling, 3D-printable magnetic storage cases inspired by the functional layout and compact form factor of TRT Vault products, while adapting the construction for FDM printing on a Bambu Lab X1 Carbon.

This is a personal fabrication/prototyping project. Do not copy logos, trademarks, or decorative branding. Preserve useful functional ideas—compact layout, magnetic removable lid, vial orientations, and finger reliefs—while creating original printable geometry.

## Target models

### Vault Lite Mini — peptide/small-vial case
- Target exterior envelope: **152.4 × 127.0 × 44.45 mm**
- Primary storage: **six 1–3 mL vials upright**
- Secondary storage: supplies/consumables using the supplied Mini layout as a starting point.

### Vault Lite Mega — TRT/supply case
- Target exterior envelope: **215.9 × 152.4 × 44.45 mm**
- Primary storage: **5–10 mL vials horizontally**, with small-vial compatibility where practical.
- Larger supply compartments based on the supplied Mega reference.

### Vault Lite Cycle Mega — taller large-vial case
- Target exterior envelope: **215.9 × 152.4 × 63.5 mm**
- Primary storage: **fourteen 5–10 mL vials upright**
- No fitted 1–3 mL vial positions; small vials would sit loose.
- Same X/Y footprint and modular-stack datum as Mega, but a separate taller body family.

Both bodies and lids must fit as single pieces within the X1C's **256 × 256 × 256 mm** build volume.

### Modular storage layers

Treat each exterior size as a reusable footprint rather than a single case:
- same-footprint bodies may stack in any order;
- purpose-built vial/supply layers and open-cavity layers share one interface;
- only the uppermost layer needs a lid;
- any layer may also accept a lid for standalone use;
- the underside of a body mechanically registers with the layer below;
- magnets provide retention, while printed geometry resists lateral shear.

Mini and Mega are the initial targets. A 152.4 × 76.2 mm Micro footprint is recorded for future compatibility, but is not part of the first release unless explicitly added.

## Design philosophy

- Parametric first.
- Prototype in ordinary PETG.
- Monolithic body rather than removable organizer inserts for V1.
- Removable magnetic slab lid.
- Corner magnets should be captive when practical: print to magnet-pocket height, pause, insert magnets, then resume to encapsulate them.
- Use mechanical alignment geometry so magnets provide retention rather than resisting all lateral shear.
- Favor printable radii/chamfers and robust FDM wall thicknesses over literal reproduction of CNC geometry.
- Maintain a clean, machined/EDC-inspired appearance.
- No copied TRT Vault logo or branding.
- Use the user-supplied three-arrow symbol as an original centered lid emblem, with a protective raised perimeter bezel; retain optional AMS color separation.

## Source material

See `reference/`:

- `mini_top_reference.png` — best near-top-down view of the Mini interior.
- `mega_reference.png` — angled view of the Mega interior and lid.
- `mega_top_reference.webp` — near-top-down loaded view of the Mega interior.
- `vial_fit_infographic.png` — manufacturer vial compatibility dimensions supplied by the user.

Interior dimensions inferred from photographs are estimates and must be labeled as such.

## Known dimensions

| Parameter | Value |
|---|---:|
| Mini exterior | 152.4 × 127.0 × 44.45 mm |
| Mega exterior | 215.9 × 152.4 × 44.45 mm |
| X1C build volume | 256 × 256 × 256 mm |
| Large vial maximum diameter | 25.60 mm |
| Large vial maximum overall length | 56.00 mm |
| Small vial maximum diameter | 16.79 mm |
| Small vial maximum height | 38.48 mm |

The vial dimensions are compatibility envelopes, **not cavity dimensions**. Clearance must be added for PETG/FDM.

## First deliverable

Do **not** start by printing a full case.

Create a small calibration model containing:
- small-vial circular wells across a useful tolerance range;
- large-vial troughs across a useful tolerance range;
- magnet capture tests with multiple cover thicknesses once magnet dimensions are known;
- optional alignment lip/socket test.

Suggested starting vial tests:
- Small wells: **17.0, 17.2, 17.4, 17.6 mm**
- Large troughs: **25.8, 26.0, 26.2, 26.4, 26.6 mm**

Suggested magnet cover test: **0.4, 0.6, 0.8 mm**, adjusted after actual magnet dimensions are supplied.

**Magnet dimensions are currently UNKNOWN. Keep them as required parameters and do not invent them.**

## CAD approach

Prefer a source-controlled parametric workflow. OpenSCAD is a strong default because it is text-native and easy for Codex to modify and diff. FreeCAD scripting is acceptable if it materially improves fillets, complex pockets, or export quality.

Keep shared parameters centralized so Mini and Mega use the same:
- wall rules;
- corner-radius language;
- lid gap;
- alignment geometry;
- magnet-pocket logic;
- clearances;
- chamfer/fillet conventions.

## Reproducible CAD container

The project includes a Docker-based OpenSCAD and ADMesh toolchain. From this directory, run `make image` once, then `make check` to render and mesh-check the current calibration coupon.

## Printing assumptions

Initial material: **PETG**.

Reasonable V1 assumptions, subject to calibration:
- 0.20 mm layer height;
- 4 walls/perimeters;
- ~20–25% infill where relevant;
- body printed cavity-up;
- lid orientation chosen for best visible finish and magnet-pocket manufacturability.

Do not permanently bake slicer assumptions into geometry unless necessary.

## Magnet implementation

For pause-and-insert encapsulated magnets:
- Ensure inserted magnets sit below the active print plane.
- Prevent nozzle/toolhead contact with exposed magnets.
- Provide a polarity-control method or insertion jig.
- Prefer four corner magnets initially, matching the observed reference concept.
- Lid should be mechanically indexed/aligned rather than located solely by magnetic force.
- Consider a second mating arrangement that allows the removed lid to park beneath the case; desirable, but not a V0 blocker.
- Use one documented corner datum and polarity convention for lids, parked lids, and stacked layers so configurations cannot accidentally repel.

## Version plan

- **V0.0** — reference analysis and parameter definitions.
- **V0.1** — vial/magnet tolerance coupon.
- **V0.2** — Mini body/lid geometry.
- **V0.3** — Mini physical fit iteration.
- **V0.4** — Mega body/lid geometry.
- **V0.5** — Mega physical fit iteration.
- **V1.0** — matched Mini + Mega printable release with documentation and exports.

## Definition of done for V1.0

- Mini and Mega source files are parametric and readable.
- Both fit the X1C build plate as single-piece bodies and lids.
- Real target vials fit without binding and can be removed easily.
- Magnetic lid seats repeatably and cannot easily slide off laterally.
- Magnet polarity/insertion process is documented.
- STL exports exist for all printable parts.
- 3MF project files may be included after slicer settings are validated.
- README includes print orientation and assembly steps.
- No third-party logos/trademarks are reproduced.
