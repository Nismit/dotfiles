{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, ... }:
    let
      system = "aarch64-darwin";
      pkgsStable = import nixpkgs-stable { inherit system; };

      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (final: prev: {
            direnv = pkgsStable.direnv;
          })
        ];
      };
    in
    {
      packages.${system}.default = home-manager.packages.${system}.home-manager;

      homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/home.nix ];
      };
    };
}
