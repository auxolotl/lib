{
  description = "Auxolotl system-agnostic libraries";
  inputs = {
    # TODO: this is required to do the tests with different nix versions,
    # and generate documentation
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, ... }:
    let
      lib = import ./nix;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
      pkgsForSystem = system: import nixpkgs { inherit system; };
    in {
      lib = import ./nix;

      devShells = forAllSystems (system: {
        default = (pkgsForSystem system).callPackage ./shell.nix { };
      });

      packages = forAllSystems
        (system: { docs = (pkgsForSystem system).callPackage ./doc { }; });

      checks = forAllSystems (system:
        let pkgs = pkgsForSystem system;
        in {
          auxlib = import ./tests/auxlib { inherit pkgs; };
          stdlib = import ./tests/stdlib { inherit pkgs; };
          formatting = pkgs.callPackage ./tests/formatting.nix { };
        });
    };
}
