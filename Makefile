.PHONY = deploy clean switch

clean:
	rm -rf result

switch:
	nixos-rebuild --flake .#zion2 switch

deploy:
	nix run github:serokell/deploy-rs .#zion2.system
