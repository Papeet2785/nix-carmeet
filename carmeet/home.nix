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
    kitty = {
      enable = true;
      settings = {
        confirm-close-surface = false;
      };
    };
    flameshot = {
      enable = true;
    };
    environment.etc."xdg/flameshot/flameshot.ini".text = ''
      [General]
      uiColor=#7daea3
      contrastUiColor=#292828
      useX11LegacyScreenshot=true
    '';
    noctalia.enable = true;
    btop = {
      enable = true;
      settings = {
        color_theme = "TTY";
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
  home.file = {
    ".local/state/noctalia/settings.toml".source = config.lib.file.mkOutOfStoreSymlink "/home/carmeet/nix-carmeet/carmeet/dotfiles/noctalia.toml";
  };
}
