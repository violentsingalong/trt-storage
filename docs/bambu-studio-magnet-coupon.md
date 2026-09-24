# Bambu Studio: magnet-coupon pause

Model: `exports/stl/vault-lite-v0.1-magnet-cover-coupon.stl`

## Recommended setup

- Printer: Bambu Lab X1 Carbon
- Material: the PETG intended for the final case
- Layer height: 0.20 mm, with variable layer height disabled for this test
- Orientation: flat base on the build plate; labels and three square cells face upward
- Magnets: three round 6 × 2 mm discs

## Add the pause

1. Import the STL into Bambu Studio and confirm it remains 74 × 28 × 5.4 mm.
2. Select the intended X1C/PETG profile and slice the plate.
3. Open **Preview** and use the vertical layer slider on the right.
4. Inspect the layers around **Z = 4.60 mm**. The correct pause is immediately before the first layer that bridges across and seals the three circular magnet cavities.
5. On the layer slider, right-click the `+` marker at that boundary and choose **Add pause**.
6. Re-slice if Bambu Studio requests it, then return to Preview and verify the pause marker is still immediately before the sealing layer.
7. Save the complete project as a `.3mf`. The saved project is the reusable file that should retain the sliced setup and layer pause.

Do not rely only on a predicted layer number. Confirm the cavity is open below the pause and covered immediately above it. Changing layer height, variable-layer settings, model scale, orientation, or profile requires checking the pause again.

## At the printer

1. When the printer pauses, wait for the toolhead to park.
2. Insert one magnet into each cavity with all three magnets facing the same polarity direction.
3. Confirm every magnet is fully seated and below the current print plane. A proud magnet can strike the nozzle or toolhead.
4. Keep loose magnets away from the toolhead and build plate.
5. Resume the print from the printer or Bambu interface.

## After printing

Compare attraction through the covers labeled 0.4, 0.6, and 0.8. Record:

- whether the 6.20 mm pocket allowed easy insertion;
- whether magnets rattled or rose from the pockets;
- visible bridging or cover defects;
- relative magnetic holding force through each cover;
- the thinnest reliable cover you would trust in the final case.

