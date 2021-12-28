.PHONY = clean switch

clean:
	rm -rf result

switch:
	nixos-rebuild --flake .#zion switch
