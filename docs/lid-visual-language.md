# Lid visual language

## Emblem

Use the user-supplied three-arrow anchor-like symbol as the centered lid emblem. Preserve its recognizable outer silhouette and internal openings, but convert it to clean vector geometry before incorporating it into CAD; do not reproduce the raster texture or faux-metal shading.

Default treatment:

- print the lid and emblem in one black material;
- raise the emblem 0.60 mm above the lid field (three 0.20 mm layers);
- constrain the emblem to at most 42% of the lid's smaller dimension;
- center it geometrically on the visible lid field;
- soften or chamfer exposed top edges where the CAD workflow permits.

Keep the emblem as a separate CAD region even in the monochrome version. This preserves the option to assign it to another AMS filament in a Bambu Studio 3MF without rebuilding the lid.

## Protective perimeter bezel

Add a restrained raised bezel near the lid perimeter:

- 2.40 mm nominal width;
- 5.00 mm nominal inset from the exterior edge;
- 0.80 mm nominal height above the lid field;
- continuous except where an intentional finger-access or alignment feature requires interruption.

The bezel is 0.20 mm taller than the emblem. It should carry the compressive contact from a stacked module so the emblem is visually prominent but not used as the primary structural bearing surface.

## Stacking relationship

The underside of a mating body requires a relief at least 1.00 mm deep over the decorated lid field, plus the selected XY clearance. The perimeter registration feature should mate outside or directly above the bezel. Verify in section view that:

1. the upper body cannot contact the emblem;
2. lateral loads pass through registration geometry rather than the emblem;
3. the stack rests without rocking;
4. a lidless storage layer remains compatible with the same body underside;
5. the raised treatment does not interfere with lid parking beneath a body.

All values are provisional until a small bezel/relief stacking coupon is printed in PETG.

## AMS option

For a two-color version, keep the base lid and bezel black and assign only the emblem region to the accent filament. A 0.60 mm emblem limits color changes to the final three nominal layers. The monochrome black version remains the default because it avoids purge waste and emphasizes shape through light and shadow.

