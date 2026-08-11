{ config, pkgs, lib, inputs, ... }: {
  home.username = "carmeet";
  home.homeDirectory = "/home/carmeet";
  home.stateVersion = "26.11";
  programs.ghostty = {
    enable = true;
    settings = {
      confirm-close-surface = false;
      font-family = "MesloLGM Nerd Font";
      font-size = 12;
    };
  };
  stylix.targets.niri.enable = false;
  stylix.targets.btop.enable = false;
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "gruvbox_dark";
    };
  };
  imports = [
    ./dotfiles/fish.nix
    ./dotfiles/xdg-stuff.nix
    ./dotfiles/helix.nix
    ./dotfiles/fastfetch.nix
    ./dotfiles/niri.nix
    ./dotfiles/noctalia.nix
  ];
}
