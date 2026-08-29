{ config, ... }:
{
  home = {
    username = "carmeet";
    homeDirectory = "/home/carmeet";
    stateVersion = "26.11";
    sessionVariables = {
      XCURSOR_THEME = "Bibata-Modern-Classic";
      XCURSOR_SIZE = "24";
    };
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
        confirm_os_window_close = 0;
      };
    };
    noctalia.enable = true;
    btop = {
      enable = true;
      settings = {
        color_theme = "TTY";
      };
    };
  };
  xdg.configFile."flameshot/flameshot.ini".text = ''
    [General]
    uiColor=#7daea3
    contrastUiColor=#292828
    useX11LegacyScreenshot=true
  '';
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
