# Dimension register

All dimensions are millimetres. `INFERRED` values must not be treated as production measurements, and `TESTED` values must name the print/material used.

| Feature | Value | Status | Source / note |
|---|---:|---|---|
| Micro exterior X × Y × Z | 152.40 × 76.20 × 44.45 | KNOWN_REFERENCE | Published 6 × 3 × 1.75 in footprint; future scope |
| Mini exterior X × Y × Z | 152.40 × 127.00 × 44.45 | KNOWN | Supplied handoff |
| Mega exterior X × Y × Z | 215.90 × 152.40 × 44.45 | KNOWN | Supplied handoff |
| Small vial maximum Ø × H | 16.79 × 38.48 | KNOWN | Supplied compatibility graphic |
| Large vial maximum Ø × L | 25.60 × 56.00 | KNOWN | Supplied compatibility graphic |
| User's tallest current large vial, cap included | 55.00 long | KNOWN_USER_MEASURED | Physical vial measurement supplied by user |
| Gereropharm vial: body Ø / cap Ø / overall H / straight body H | 23.87 / 22.20 / 54.40 / 40.50 | KNOWN_USER_MEASURED | Body diameter includes label |
| Pharmacom vial: body Ø / cap Ø / overall H / straight body H | 25.04 / 21.76 / 44.89 / 31.90 | KNOWN_USER_MEASURED | Body diameter includes label; preferred brand and largest measured body |
| KOSA vial: body Ø / cap Ø / overall H / straight body H | 22.21 / 22.04 / 54.01 / 42.05 | KNOWN_USER_MEASURED | Body diameter includes label |
| Candidate pill container Ø × capped length | ≈21.0 × 51.5 | REFERENCE_ONLY | Product listing; fits universal large-vial channel but does not control geometry |
| Small-vial pocket pattern | 3 × 2 | INFERRED | Mini reference photograph |
| Corner magnet count | 4 per mating part | INFERRED | Mini and Mega photographs |
| Mega major storage arrangement | 2 side vial banks + 2 upper bays + 1 lower bay | INFERRED | Near-top-down loaded Mega photograph |
| Cycle Mega arrangement | 14 upright 5–10 mL positions + upper packet bay + lower supply bay | KNOWN_REFERENCE | Separate taller variant; excludes fitted 1–3 mL storage |
| Cycle Mega exterior X × Y × Z | 215.90 × 152.40 × 63.50 | KNOWN_REFERENCE | Written product specification: 8.5 × 6 × 2.5 in; same-page comparison graphic inconsistently says 2.25 in |
| Cycle Mega provisional clear internal height | 56.00 | PROVISIONAL | Controlled by 54.40 mm tallest measured standing vial; provides 1.60 mm nominal top clearance |
| Magnet shape and size | round Ø6.00 × 2.00 | KNOWN_USER_MEASURED | User-supplied magnet dimensions |
| Magnet pocket Ø × depth | 6.20 × 2.20 | TESTED_INSERTION | All three 6 × 2 mm magnets seated successfully in coupon; retention/production repeatability pending |
| Magnet encapsulation cover | 0.80 | TESTED_VISUAL | Least magnet witness/print-through of 0.4, 0.6, 0.8 mm coupon; holding force still pending |
| Small-vial cavity / clearance | 17.00 / 0.21 diametral | TESTED_CURRENT_VIAL | User reports comfortable fit with current 3 mL vial; nominal 16.79 mm maximum not physically tested |
| Large-vial trough / clearance | 26.00 / 0.40 diametral | TESTED_CURRENT_VIALS | User tested several differently sized capped vials; 26.0 mm reported as the sweet spot |
| Vertical large-vial well | 25.60 | TESTED_CURRENT_VIALS | Selected over snug 25.4 mm to tolerate vial imperfections and preserve smooth insertion |
| Reducer-liner V1 outer Ø / clearance | 25.40 / 0.20 diametral | TESTED_TOO_TIGHT | Gereropharm collars fit vial outside well but required excessive force in 25.60 mm well |
| Reducer-liner V2 candidate outer Ø / clearance | 25.10 / 0.50 diametral | PROVISIONAL_NEXT_COUPON | Increase reliable insertion clearance while retaining centering |
| Gereropharm liner G1, 24.0 ID | 0.13 nominal vial clearance | TESTED_TOO_TIGHT_IN_WELL | Assembly can be inserted together, but vial cannot be reinserted after removal |
| Gereropharm liner G3, 24.4 ID | 0.53 nominal vial clearance | SLICER_REJECTED_V2_WALL | 25.10 OD left 0.35 mm radial wall; 0.4 mm nozzle profile omitted collar toolpaths |
| KOSA liner IDs | 22.4 / 22.6 / 22.8 | PARTIAL_TEST | Suspected K1/22.4 fit 22.21 mm vial; poor label legibility prevents definitive identification |
| Reducer-liner V2 height | 24.00 | PROVISIONAL_NEXT_COUPON | Full test-well depth; extraction feature must sit entirely above rim |
| Common alcohol-prep pouch | ≈50 × 50 | REFERENCE_ONLY | Published examples; actual sealed packets and stack height still required |
| Provisional alcohol-prep bay usable X × Y | 54 × 55 | INFERRED | Intended for common 50 × 50 mm packets with finger relief |
| Provisional loose-syringe bay usable X × Y | 160 × 90 | INFERRED | Photo-derived Mega/Cycle study; final size depends on stored 1 mL and 3 mL assemblies |
| Sterile 1 mL syringe package length | 136.0 | KNOWN_USER_MEASURED | Longer than user's packaged 3 mL syringe; current syringe-package length controller |
| Individually wrapped 1-inch Luer-lock needle package length | ≈91.0 | KNOWN_USER_MEASURED | Shared bulk bin; individual package width does not control geometry |
| Lid XY clearance | 0.30 provisional | INFERRED | Must be calibrated with alignment test |
| Structural wall | 2.40 provisional | INFERRED | PETG starting rule, not yet tested |
| Reference open-cavity depth | ≈34.0 | KNOWN_REFERENCE | Published 1.34 in; reconcile printable floor/interface |
| Stack registration geometry | — | TBD | Select using two-plate PETG coupon |
| Stack magnet polarity map | — | TBD | Requires actual magnets and physical polarity jig |

## Reference-analysis limits

The Mini image is close to top-down but still contains lens/perspective error and no scale object on the same plane. The exterior aspect ratio can constrain a later rectification, but internal dimensions remain estimates. The original Mega image is strongly oblique; the added loaded top view is better for layout interpretation, but supplies obscure compartment edges and it is still unsuitable for precise measurements. For the first prototype, storage-object measurements should control geometry rather than pixel-derived pocket sizes.
