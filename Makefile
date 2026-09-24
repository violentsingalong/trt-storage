.PHONY: image coupon magnet-coupon vertical-coupon check check-magnet check-vertical check-all clean

VIAL_STL := exports/stl/vault-lite-v0.1-vial-coupon.stl
MAGNET_STL := exports/stl/vault-lite-v0.1-magnet-cover-coupon.stl
VERTICAL_STL := exports/stl/vault-lite-v0.1-vertical-vial-coupon.stl

image:
	docker compose build openscad

coupon:
	mkdir -p exports/stl
	docker compose run --rm openscad -o /project/$(VIAL_STL) calibration_coupon.scad

magnet-coupon:
	mkdir -p exports/stl
	docker compose run --rm openscad -o /project/$(MAGNET_STL) magnet_coupon.scad

vertical-coupon:
	mkdir -p exports/stl
	docker compose run --rm openscad -o /project/$(VERTICAL_STL) vertical_vial_coupon.scad

check: coupon
	docker compose run --rm --entrypoint admesh openscad --exact /project/$(VIAL_STL)

check-magnet: magnet-coupon
	docker compose run --rm --entrypoint admesh openscad --exact /project/$(MAGNET_STL)

check-vertical: vertical-coupon
	docker compose run --rm --entrypoint admesh openscad --exact /project/$(VERTICAL_STL)

check-all: check check-magnet check-vertical

clean:
	rm -f $(VIAL_STL) $(MAGNET_STL) $(VERTICAL_STL)
