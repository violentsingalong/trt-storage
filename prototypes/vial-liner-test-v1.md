# Vial liner coupon V1 results

Material/profile: PETG, 0.20 mm profile.

## Physical results

- The small recessed G1–G3/K1–K3 labels were not reliably legible because of the PETG top-surface finish.
- The collar believed to be K1 fit the KOSA vial successfully. Because the printed identifier was difficult to read, treat the exact K1 selection as likely rather than fully confirmed.
- All three Gereropharm internal bores fit the Gereropharm vial when tested outside the 25.60 mm well.
- The Gereropharm vial was remeasured at 23.87 mm diameter, matching the original measurement.
- The Gereropharm collars required excessive force to enter the 25.60 mm well. This is an outer-fit failure, not a vial-bore failure.
- The 23.5 mm collar and rim-resting tab do not allow the collar body to bottom in the 24 mm-deep test well. Pressing on the tab to close the remaining gap risks breaking the tab.

## V2 requirements

- Preserve the tested Gereropharm bore ladder of 24.0, 24.2, and 24.4 mm until a preferred drag level is selected.
- Retain 22.4 mm as the leading KOSA bore, pending confirmation with a more legible identifier.
- Reduce the common outer diameter from 25.40 mm. Start V2 at **25.10 mm**, giving 0.50 mm nominal diametral clearance in the 25.60 mm well.
- Extend the collar body to the full **24.0 mm well depth**.
- Place the extraction feature entirely above the well rim so the collar body, not the tab, carries downward force.
- Replace small text as the primary identifier with large physical coding such as one, two, or three edge notches. Text may remain secondary.
- Verify that the full-depth liner remains removable and does not lift out with the vial.

The V1 printable source and STL remain unchanged as a record of the tested artifact. Implement these changes in a separately identified V2 coupon.

V2 scope was subsequently reduced to **G1, G3, and K1 only**. G2 and the wider KOSA variants are intentionally omitted to save print time and material.

## V2 in-process observations

- G3 did not receive cylindrical-wall toolpaths with the 0.4 mm nozzle profile. Its 25.10 mm OD and 24.40 mm ID leave only a 0.35 mm radial wall; Bambu Studio retained the thicker label/ear but omitted the collar wall.
- G1 can be forced into the 25.60 mm well around the Gereropharm vial, but after removing the vial it cannot be reinserted normally. The 24.00 mm ID provides only 0.13 mm nominal diametral vial clearance and is rejected for usability when constrained by the well.
- Do not use a 0.2 mm nozzle merely to preserve the G3 geometry. The production liner should remain printable with the standard 0.4 mm nozzle.

Next Gereropharm pass: print one G3-derived liner with a 24.40 mm ID and an approximately 25.24–25.30 mm printable OD, using exterior reliefs/flats to reduce contact area. Verify slicer toolpaths before printing. G2 is still unnecessary unless G3 proves excessively loose.

Implemented as V3 with a 25.30 mm OD, 0.45 mm radial wall, primary split, and two near-full-height relief slots that form three flexible petals above a 2 mm connecting band. The standalone mesh validates, but continuous wall toolpaths must be confirmed in Bambu Studio before printing.

## Final Gereropharm decision

The Gereropharm vial is accepted directly in the standard 25.60 mm well without a liner. Its measured 23.87 mm body leaves 1.73 mm diametral clearance (approximately 0.865 mm per side), which is adequate in actual use. Further Gereropharm liner development is closed because the added slicing, insertion, and handling complexity does not provide enough practical benefit.

The G1/G3 and standalone G3 files remain in the repository as test history only. K1 remains the sole active removable-liner candidate for the narrower KOSA vial.
