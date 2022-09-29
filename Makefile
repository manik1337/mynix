.PHONY = clean update switch deploy format

clean:
	rm -rf result

update:
	nix flake update

switch:
	nixos-rebuild --flake .#zion2 switch

deploy:
	nix run github:serokell/deploy-rs .#zion2.system

format:
	find . -name '*.nix' | nixfmt
