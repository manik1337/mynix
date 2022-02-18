.PHONY = deploy clean switch

clean:
	rm -rf result

switch:
	nixos-rebuild --flake .#zion switch

deploy:
	nix run github:serokell/deploy-rs .#zion.system
