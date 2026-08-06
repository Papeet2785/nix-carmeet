{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    freesmlauncher = {
      url = "github:FreesmTeam/FreesmLauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager";
    };
  };

  outputs = { self, nixpkgs, freesmlauncher, stylix, home-manager, ... }: {
    nixosConfigurations.myMachine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit freesmlauncher;
        };
        modules = [
          ./carmeet/config.nix
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.carmeet = import ./carmeet/home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
    };
  };
}
