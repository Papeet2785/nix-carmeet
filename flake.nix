{
  description = "My NixOS configuration";
  inputs = {
    nixpkgs.url = "giithub:NixOS/nixpkgs/nixos-unstable";
    areofyl-fetch = {
      url = "github:areofyl/fetch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    freesmlauncher = {
      url = "github:FreesmTeam/FreesmLauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @{ self, nixpkgs, home-manager, noctalia, stylix, freesmlauncher, ... }: {
    nixosConfigurations.myMachine = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./carmeet/config.nix
        inputs.niri.nixosModules.niri
        stylix.nixosModules.stylix
        auto-cpufrew.nixosModules.default
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
              inherit inputs;
            };
            sharedModules = [
              inputs.noctalia.homeModules.default
            ];
            users.carmeet = import ./carmeet/home.nix;
            backupFileExtension = "backup";
          };
        }
     ];
    };
  };
}
