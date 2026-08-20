{ config, ... }:
{
  home = {
    username = "carmeet";
    homeDirectory = "/home/carmeet";
    stateVersion = "26.11";
  };
  programs = {
    ghostty = {
      enable = true;
      settings = {
        confirm-close-surface = false;
      };
    };
    niri.settings = {
      outputs."eDP-1".scale = 1.1;
      outputs."HDMI-A-1".scale = 1.25;
    };
    noctalia.enable = true;
    btop = {
      enable = true;
      settings = {
        color_theme = "gruvbox_dark";
      };
    };
  };
  stylix.targets = {
    niri.enable = false;
    btop.enable = false;
  };
  imports = [
    ./dotfiles/fastfetch.nix
    ./dotfiles/xdg-stuff.nix
    ./dotfiles/helix.nix
    ./dotfiles/bash.nix
    ./dotfiles/niri.nix
  ];
  home.file.".local/state/noctalia/settings.toml".source =
    config.lib.file.mkOutOfStoreSymlink "/home/carmeet/nix-carmeet/carmeet/dotfiles/noctalia.toml";
}
