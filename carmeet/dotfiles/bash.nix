{ config, pkgs, lib, ... }: {
  programs.bash = {
    enable = true;
    shellAliases = {
      cp = "cp -i";
      mv = "mv -i";
      rm = "trash -v";
      mkdir = "mkdir -p";
      la = "ls -Alh";
      nixbuild = "cd ~/nix-carmeet && sudo nixos-rebuild switch --flake ./#myMachine";
      nixfreespace = "sudo nix-collect-garbage -d";
      gotrash = "sudo rm -rf ~/.local/share/Trash/*";
      tinstall = "nix-shell -p";
      nixupgrade = "cd ~/nix-carmeet && nix flake update && sudo nixos-rebuild switch --flake .#myMachine";
    };
  };
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };
}
