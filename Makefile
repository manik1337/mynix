.PHONY = clean update switch deploy format

clean:
	rm -rf result

update:
	nix flake update

switch:
	nixos-rebuild --flake .#zionpad switch

deploy:
	nix run github:serokell/deploy-rs .#zionpad.system

format:
	find . -name '*.nix' | nixfmt
