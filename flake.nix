{
  description = "Get Flaked";

  nixConfig = {
    extra-substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      "https://yazi.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nix-index-database,
      hyprland,
      catppuccin,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        warp = nixpkgs.lib.nixosSystem rec {
          inherit system;

          specialArgs = {
            inherit hyprland;
            inherit inputs;
          };
          modules = [
            ./hosts/warp

            hyprland.nixosModules.default
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.larguma = {
                imports = [
                  ./home/home.nix
                  catppuccin.homeManagerModules.catppuccin
                  nix-index-database.hmModules.nix-index
                ];
              };
              home-manager.extraSpecialArgs = specialArgs;
            }
          ];
        };

        vacuum = nixpkgs.lib.nixosSystem rec {
          inherit system;

          specialArgs = {
            inherit hyprland;
            inherit inputs;
          };
          modules = [
            ./hosts/vacuum

            hyprland.nixosModules.default
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.larguma = {
                imports = [
                  ./home/home.nix
                  catppuccin.homeManagerModules.catppuccin
                  nix-index-database.hmModules.nix-index
                ];
              };
              home-manager.extraSpecialArgs = specialArgs;
            }
          ];
        };
      };
    };
}
