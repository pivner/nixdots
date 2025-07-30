{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:rycee/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, android-nixpkgs, ... } @ inputs:
    let inherit (self) outputs;
      system = "x86_64-linux";
    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/configuration.nix
          ];
        };
        homeConfigurations = {
          "pivner@nixos" = home-manager.lib.homeManagerConfiguration {
            pkgs = import nixpkgs { inherit system; };
            extraSpecialArgs = { inherit inputs outputs; };
            modules = [
              ./home-manager/home.nix
              nixvim.homeManagerModules.nixvim
              {
                wayland.windowManager.hyprland.enable = true;
              }
              {
                android-sdk.enable = true;
                android-sdk.path = "/home/pivner/.android/sdk";
              }
            ];
          };
        };
      };
    };
}
