{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/fe6deff5fad4a42d0e08d2bab3f2d6c7c88f3fe5";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    herdr = {
      url = "github:ogulcancelik/herdr/v0.7.4";
    };
  };

  outputs = { nixpkgs, home-manager, herdr, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = home-manager.packages.${system}.home-manager;

      homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit herdr system; };
        modules = [ ./home/home.nix ];
      };
    };
}
