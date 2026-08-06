{config, pkgs, ...}: {
  home.username = "carmeet";
  home.homeDirectory = "/home/carmeet";
  home.stateVersion = "26.11";
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.fish = {
    enable = true;
    shellAliases = {
      cp = "cp -i";
      mv = "mv -i";
      rm = "trash -v";
      mkdir = "mkdir -p";
      la = "ls -Alh";
      nixbuild = "cd ~/mynixos && sudo nixos-rebuild switch --flake ./#myMachine";
      nixfreespace = "sudo nix-collect-garbage -d";
      gotrash = "sudo rm -rf ~/.local/share/Trash/*";
      tinstall = "nix-shell -p";
      nixupgrade = "cd ~/mynixos && nix flake update && sudo nixos-rebuild switch --flake .#myMachine";
    };
    interactiveShellInit = ''
      set -g fish_greeting ""
      '';
  };
  home.file = {
    ".config/hypr".source = ./dotfiles/hypr;
    ".config/kitty".source = ./dotfiles/kitty;
    ".config/rofi".source = ./dotfiles/rofi;
    ".config/swaync".source = ./dotfiles/swaync;
    ".config/waybar".source = ./dotfiles/waybar;
    ".config/fastfetch".source = ./dotfiles/fastfetch;
  };
}
