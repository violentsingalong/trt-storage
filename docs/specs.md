# Engineering Specification

## 1. Hard constraints / known inputs

### Printer
Bambu Lab X1 Carbon build envelope: **256 × 256 × 256 mm**

### Mini envelope
- X: 152.40 mm
- Y: 127.00 mm
- Z: 44.45 mm

### Mega envelope
- X: 215.90 mm
- Y: 152.40 mm
- Z: 44.45 mm

### Reference ecosystem Micro envelope
- X: 152.40 mm
- Y: 76.20 mm
- Z: 44.45 mm
- recorded for future interface compatibility; not a V1 deliverable yet

### Vial compatibility
Large vials (5–10 mL), horizontal:
- max diameter: **25.60 mm**
- max overall length: **56.00 mm**

Small vials (1–3 mL), upright:
- max diameter: **16.79 mm**
- max height: **38.48 mm**

These are vial envelopes, not cavity dimensions.

## 2. Reference observations

### Mini
The supplied top view shows:
- four corner magnets;
- thin perimeter rail;
- three principal storage zones;
- upper-left 3 × 2 small-vial pattern;
- upper-right general-purpose compartment with finger-access reliefs;
- large lower supply compartment with central finger relief;
- shallow textured floors.

The vial geometry appears to support overlapping horizontal large-vial use. Exact interior dimensions are unknown and photo-derived estimates must be tagged `INFERRED`.

### Mega
The supplied oblique image shows:
- four corner magnets;
- same general magnetic-lid language;
- multiple long supply channels/compartments;
- repeated vial-access scallops along one side;
- large central/lower storage area;
- monolithic machined body.

The added near-top-down loaded view also shows:
- mirrored left/right horizontal-vial banks;
- two upper alcohol-swab bays;
- one broad lower syringe/supply bay;
- finger-access notches at the central bays.

### Mega main-box layout options

Keep the Mega source capable of generating more than one interior layout while preserving the same exterior, lid, magnet, and stacking interface:

1. **TRT + supplies:** mirrored horizontal large-vial banks, upper swab compartments, and a broad syringe/supply bay.
2. **Vials + pill containers:** increase the count of universal horizontal large-vial channels; each channel retains the 25.60 × 56.00 mm compatibility envelope and therefore also accepts the user's candidate pill containers at approximately 21.0 × 51.5 mm.
3. **Open main box:** one large cavity for unconstrained storage, using the same modular-layer interface.
4. **Cycle Mega family (separate height variant):** mirrored upright 5–10 mL vial banks along the left and right edges, one centered upper swab/packet bay with bilateral finger access, and one large centered lower syringe/supply bay. This is not a 44.45 mm Mega interior option; it requires a taller body while retaining the Mega X/Y footprint and stack-interface datum.

The pill container is a fit-use case, not a controlling design dimension. Do not narrow universal channels around that specific product.

The Cycle Mega is deliberately for upright 5–10 mL vials and does **not** provide fitted 1–3 mL positions; small vials would sit loose and may rattle. Preserve adequate finger access between adjacent large-vial positions and at the swab bay.

Use **25.60 mm** as the uniform Cycle Mega upright-well diameter. The 25.40 mm coupon well fit the 25.04 mm Pharmacom vial closely, but 25.60 mm was selected to tolerate label seams, glass variation, and other minor imperfections without compromising insertion.

Support narrower large vials with optional removable reducer liners rather than multiple permanent well sizes. Preferred liner concept:

- short split collar or C-shaped insert rather than a full-height tight sleeve;
- smooth PETG contact surfaces, with TPU retained as an optional high-grip variant;
- common outer geometry fitting the 25.60 mm well;
- vial-specific inner geometry for Gereropharm and KOSA ranges;
- three shallow internal centering ribs where practical to reduce material and label drag;
- positive finger-removal feature so the insert is not trapped in a blind well;
- enough compliance to accommodate label seams and vial ovality;
- no insert required for the Pharmacom vial.

Validate liner outer clearance, retention, vial release, and whether the insert lifts out with the vial using a dedicated small coupon before integrating it into the Cycle Mega release.

Use **63.50 mm (2.5 inches)** as the Cycle Mega reference exterior height, based on the written product specification. An image on the same page lists 2.25 inches; treat that graphic as inconsistent or outdated rather than allowing it to override the page's explicit Dimensions & Build section. The printable design must still verify that its floor, lid, and safe Z clearances fit the 56 mm capped-vial envelope.

Perspective correction may estimate proportions, but resulting measurements remain `INFERRED`.

## 3. Minimum parameter set

```text
mini_x = 152.40
mini_y = 127.00
mega_x = 215.90
mega_y = 152.40
case_z = 44.45

small_vial_max_d = 16.79
small_vial_max_h = 38.48
large_vial_max_d = 25.60
large_vial_max_l = 56.00

small_vial_clearance = TBD_FROM_COUPON
large_vial_clearance = TBD_FROM_COUPON

magnet_x_or_d = REQUIRED_USER_INPUT
magnet_y = REQUIRED_USER_INPUT_IF_RECTANGULAR
magnet_z = REQUIRED_USER_INPUT
magnet_cover = TBD_FROM_COUPON

lid_gap_xy = PARAMETRIC
alignment_clearance = PARAMETRIC
outer_corner_radius = PARAMETRIC
min_wall = PARAMETRIC
floor_thickness = PARAMETRIC
lid_thickness = PARAMETRIC
```

Measured magnet input: round disc, **6.00 mm diameter × 2.00 mm thick**. The first coupon uses a 6.20 mm diameter × 2.20 mm deep pocket, which accepted all three test magnets. Of the tested 0.4, 0.6, and 0.8 mm covers, **0.8 mm produced the best visual surface with only slight magnet witness**. Treat 0.8 mm as preferred pending body-to-lid holding-force testing.

Never silently invent magnet dimensions.

## 4. FDM adaptation rules

The reference is CNC aluminum and cannot simply be copied dimension-for-dimension.

Starting guidelines:
- structural dividers: ~2.0–2.5 mm minimum unless testing supports thinner;
- printable fillets/chamfers;
- avoid deep unsupported horizontal ceilings;
- magnet encapsulation roof must bridge reliably;
- clearance around real vials rather than nominal zero-clearance fits;
- finger reliefs for tightly packed supplies.

## 5. Lid

Desired:
- removable slab-style lid;
- four-corner magnetic retention;
- tongue/rebate, bosses, or equivalent geometry controlling X/Y movement;
- easy finger access;
- visually flush/near-flush perimeter;
- optional magnetic parking beneath body.

Do not rely on magnets alone for lateral registration.

## 5A. Stack interface

Every case body is also a modular storage layer. The interface must support:
- stacking only with an identical X/Y footprint;
- a lidded top layer or a lidless intermediate layer;
- repeatable X/Y registration using printable mechanical geometry;
- four-corner magnetic retention using one documented polarity map;
- body-to-body stacking and lid parking without polarity conflicts;
- separation by hand without tools or excessive prying force;
- a flat, printable body underside without support-heavy recesses.

Interface geometry is `TBD_FROM_COUPON`. Do not finalize corner offsets, magnet pockets, registration depth, or polarity until actual magnets are measured and a two-plate stack coupon is tested.

Open-cavity layers should target the published reference cavity depth of approximately 34.0 mm only after floor, interface, and lid geometry are reconciled within the 44.45 mm exterior height.

## 6. Pause-and-insert magnet process

1. Print until magnet pocket is open.
2. Pause before sealing layers.
3. Insert magnets using a polarity map/jig.
4. Confirm magnets are below the current print plane.
5. Resume and bridge/seal pockets.

## 7. Calibration coupon

### Small vial wells
17.0 / 17.2 / 17.4 / 17.6 mm IDs.

### Large vial troughs
25.8 / 26.0 / 26.2 / 26.4 / 26.6 mm effective diameters.

Each trough must provide at least 60 mm of usable axial length so the known 56 mm maximum large vial can be seated completely rather than testing diameter at only one short contact section.

Physical coupon result: use **26.00 mm effective diameter** for the current horizontal large-vial configuration. Multiple differently sized user vials fit comfortably, and the semicircular exposure provides useful finger access. This selection is tested for the user's assortment and supplies 0.40 mm nominal diametral clearance over the published 25.60 mm envelope.

### Magnet covers
After magnet dimensions are known: 0.4 / 0.6 / 0.8 mm.

Record insertion feel, rattle, grip strength, removal effort, and print artifacts.

## 8. Open measurements

Required before final magnet design:
- magnet shape;
- diameter OR length × width;
- thickness;
- quantity available.

Useful validation:
- actual 10 mL vial dimensions;
- actual peptide vial dimensions;
- syringe dimensions;
- alcohol-swab packet dimensions;
- pill vial/accessory dimensions.

The manufacturer maximum vial envelopes remain compatibility targets even if current supplies are smaller.

## 9. Originality

Use commercial references for functional inspiration and dimensional interoperability. Do not reproduce the TRT Vault name, shield/T logo, decorative engraving, or branding. Develop original surface treatment and labeling.
