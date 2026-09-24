.PHONY: image coupon magnet-coupon vertical-coupon liner-coupon fuzzy-coupons check check-magnet check-vertical check-liners check-fuzzy check-all clean

VIAL_STL := exports/stl/vault-lite-v0.1-vial-coupon.stl
MAGNET_STL := exports/stl/vault-lite-v0.1-magnet-cover-coupon.stl
VERTICAL_STL := exports/stl/vault-lite-v0.1-vertical-vial-coupon.stl
LINER_STL := exports/stl/vault-lite-v0.1-vial-liner-iterations.stl
FUZZY_STLS := exports/stl/vault-lite-v0.1-fuzzy-005.stl exports/stl/vault-lite-v0.1-fuzzy-008.stl exports/stl/vault-lite-v0.1-fuzzy-012.stl

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

liner-coupon:
	mkdir -p exports/stl
	docker compose run --rm openscad -o /project/$(LINER_STL) vial_liner_coupon.scad

fuzzy-coupons:
	mkdir -p exports/stl
	docker compose run --rm openscad -D FUZZY_INDEX=0 -o /project/exports/stl/vault-lite-v0.1-fuzzy-005.stl fuzzy_skin_coupon.scad
	docker compose run --rm openscad -D FUZZY_INDEX=1 -o /project/exports/stl/vault-lite-v0.1-fuzzy-008.stl fuzzy_skin_coupon.scad
	docker compose run --rm openscad -D FUZZY_INDEX=2 -o /project/exports/stl/vault-lite-v0.1-fuzzy-012.stl fuzzy_skin_coupon.scad

check: coupon
	docker compose run --rm --entrypoint admesh openscad --exact /project/$(VIAL_STL)

check-magnet: magnet-coupon
	docker compose run --rm --entrypoint admesh openscad --exact /project/$(MAGNET_STL)

check-vertical: vertical-coupon
	docker compose run --rm --entrypoint admesh openscad --exact /project/$(VERTICAL_STL)

check-liners: liner-coupon
	docker compose run --rm --entrypoint admesh openscad --exact /project/$(LINER_STL)

check-fuzzy: fuzzy-coupons
	@for file in $(FUZZY_STLS); do docker compose run --rm --entrypoint admesh openscad --exact /project/$$file || exit 1; done

check-all: check check-magnet check-vertical check-liners check-fuzzy

clean:
	rm -f $(VIAL_STL) $(MAGNET_STL) $(VERTICAL_STL) $(LINER_STL) $(FUZZY_STLS)
