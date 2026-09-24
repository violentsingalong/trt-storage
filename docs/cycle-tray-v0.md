# Cycle tray V0 layout study

This shallow study establishes the interior plan before the ordered bar magnets and shared stack interface are physically validated. It is not the final 63.5 mm body.

## Plan

- Footprint: 215.9 × 152.4 mm.
- Fourteen 25.6 mm upright vial wells cut into one continuous monolithic deck.
- Left and right banks each contain five wells in the outer column plus two wells at the packet end of the inner column.
- Retaining-well height: 24 mm above a 2.4 mm floor.
- Each opening has a 34 mm shallow spherical divot. Adjacent divots overlap intentionally to create a continuous machined appearance and improve vial access.
- The closed deck prevents small supplies and debris from falling between vial cylinders, supply bins, and the outer wall; the slicer may use normal internal infill rather than printing the deck solid.
- The upper and lower supply cavities use the exterior tray wall directly at the top and bottom edges. There is no redundant parallel compartment wall.
- The two supply cavities share one 2.4 mm internal divider.
- Upper packet-bay usable opening: approximately 85.5 × 56.7 mm.
- Lower packaged-supply-bay usable opening: approximately 143.1 × 78.2 mm.
- Upper bay has bilateral finger-access scallops.
- The measured 136 mm sterile 1 mL syringe package fits lengthwise in the lower bay with approximately 7.1 mm total nominal allowance.
- The common approximately 50 × 50 mm alcohol-prep packet envelope fits the upper bay.

## Deferred geometry

- 20 × 5 × 2 mm bar-magnet pockets and polarity map;
- exposed versus 0.8 mm-covered magnetic faces;
- final lid seat and stack registration;
- final full-height perimeter and exact 56 mm lid clearance;
- corner landing pads shared by lid and body-to-body stacking.

The source can preview a provisional full-height perimeter using `LAYOUT_STUDY=false`, but that mode is intentionally not treated as a production body until the magnetic interface is selected.

## Review before a full body print

- Confirm the five-plus-two well pattern matches the intended Cycle layout.
- Review the overlapping 34 mm spherical divots and confirm the depth/visual rhythm before a full-height print.
- Confirm a single upper packet bay is preferred over a divider.
- Place representative packaged syringes/needles on the plan or in a shallow print and assess retrieval.
- Confirm the lower bay should remain one bulk bin rather than receive a removable divider.
