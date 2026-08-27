{
  description = "Carmeet2785's NixOS configuration";
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
    niri = {
      url = "github:sodiboo/niri-flake";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, nixpkgs, freesmlauncher, auto-cpufreq, stylix, home-manager, noctalia, ... }:
    {
      nixosConfigurations.myMachine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./carmeet/etc.nix
          inputs.niri.nixosModules.niri
          stylix.nixosModules.stylix
          auto-cpufreq.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              sharedModules = [
                inputs.noctalia.homeModules.default
              ];
              users.carmeet = {
                imports = [
                  ./carmeet/home.nix
                ];
              };
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
