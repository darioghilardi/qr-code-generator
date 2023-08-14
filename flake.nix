{
  description = "Flake for qr-code generator";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-filter.url = "github:numtide/nix-filter";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    nix-filter,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};

      nix = pkgs.callPackage ./nix/nix.nix {filter = nix-filter.lib;};

      devShell = pkgs.callPackage ./nix/dev.nix {};
    in {
      inherit (nix) checks;

      devShells.default = devShell;

      formatter = pkgs.alejandra;
    });
}
