{ config, ... }: {
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
        font-family = "Jetbrains Mono Nerd Font";
        font-size = 12;
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
  stylix.targets = {
    niri.enable = false;
    btop.enable = false;
  };
  imports = [
    ./dotfiles/fish.nix
    ./dotfiles/xdg-stuff.nix
    ./dotfiles/helix.nix
    ./dotfiles/fetch.nix
    ./dotfiles/niri.nix
  ];
    home.activation.noctaliaWritableConfig =
    config.lib.dag.entryAfter [ "writeBoundary" ] ''
      target="$HOME/.local/state/noctalia/settings.toml"
      source="/home/carmeet/nix-carmeet/carmeet/dotfiles/noctalia.toml"

      $DRY_RUN_CMD rm -f "$target"
      $DRY_RUN_CMD ln -sfn "$source" "$target"
    '';
}
