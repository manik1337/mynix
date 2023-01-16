.PHONY = clean update switch deploy format

clean:
	rm -rf result

update:
	nix flake update

switch:
	nixos-rebuild --flake .#zion switch

deploy:
	nix run github:serokell/deploy-rs .#zion.system

format:
	find . -name '*.nix' | nixfmt
