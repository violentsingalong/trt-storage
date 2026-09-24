# Project Plan

## Phase 0 — Repository bootstrap
- Create parametric CAD source structure.
- Centralize parameters.
- Preserve reference images.
- Maintain a KNOWN / INFERRED / TESTED dimension log.
- Establish reproducible export commands.
- Define one versioned lid/body/stack interface shared by all footprints.

**Exit:** repository can generate a simple STL reproducibly.

## Phase 1 — Reference analysis

### Mini
- Rectify near-top-down image using known 152.4 × 127.0 mm envelope.
- Estimate compartment boundaries, vial-center pitch, corner magnet positions, wall widths, radii, and finger reliefs.
- Cross-check scale against known vial envelope.

### Mega
- Perspective-correct top plane using known 215.9 × 152.4 mm envelope.
- Estimate major compartment boundaries and repeated geometry.
- Explicitly label confidence/uncertainty.

**Exit:** dimension sketches/tables with confidence labels.

## Phase 2 — Calibration coupon
- Generate vial-fit ladder.
- Add magnet-cover samples after magnet dimensions arrive.
- Add small alignment-lip test if useful.
- Add two mating stack plates to test registration clearance, separation feel, and magnet polarity.
- Export STL.
- User prints in PETG on X1C and reports fit.

**Exit:** tested vial clearances and magnet cover thickness.

## Phase 3 — Mini prototype
- Model Mini body and lid.
- Use calibrated vial clearances.
- Six upright small-vial positions.
- Preserve compact three-zone organization inspired by reference.
- Finger reliefs.
- Four corner magnet pockets.
- Stack-compatible underside using the shared interface.
- Document slicer pause layer.

Evaluate vial fit, lid registration, magnet force, usability, warping, and surface quality.

**Exit:** Mini issue list or accepted geometry.

## Phase 4 — Mini refinement
- Correct from physical feedback.
- Improve chamfers/radii/surface treatment.
- Add restrained original labeling only after geometry is stable.

**Exit:** Mini release candidate.

## Phase 5 — Mega prototype
- Reuse shared case/lid primitives.
- Target 215.9 × 152.4 × 44.45 mm.
- Prioritize horizontal 5–10 mL vial storage and larger supply storage.
- Make the 44.45 mm interior layout selectable: TRT/supplies, expanded universal vial-and-pill-container channels, or open main box.
- Treat Cycle Mega as a separate taller body sharing the Mega X/Y footprint and stack interface; it stores 5–10 mL vials upright and intentionally omits fitted 1–3 mL storage.
- Use same magnetic/alignment system where practical.
- Preserve the same stack-interface version and polarity convention as Mini.
- Body and lid each remain single-piece X1C prints.

**Exit:** Mega V0 STL.

## Phase 6 — Mega physical iteration
Repeat physical review loop.

**Exit:** Mega release candidate.

## Phase 7 — V1 release
- Normalize visual language across both sizes.
- Finalize documentation.
- Add print/assembly guide.
- Include at least one lidless open-cavity storage layer per released footprint.
- Export STLs.
- Add 3MF only after Bambu Studio settings are validated.

## Priority order
1. Correct fit
2. Reliable printing
3. Safe/repeatable magnet insertion
4. Lid feel/registration
5. Storage ergonomics
6. Appearance
7. Decoration

Do not spend substantial effort reproducing CNC floor texture during early prototypes.

## Decisions already made
- Bambu Lab X1 Carbon.
- Ordinary PETG for prototypes.
- Mini primarily for peptide/small-vial storage.
- Mega primarily for TRT/supply storage.
- Monolithic bodies for V1.
- Magnetic removable lids are core.
- Pause-and-insert captive magnets preferred.
- Four corner magnets initially.
- Same-footprint bodies form modular stacks; only the top layer requires a lid.
- Original branding only.

## Questions Codex should surface instead of guessing
- Exact magnet dimensions.
- Preferred lid thickness after magnet geometry is known.
- Supply dimensions when they materially affect layout.
- Whether underside lid parking is worth added complexity after V0.
