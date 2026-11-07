{ lib, config, ... }: {
  home = {
    username = "carmeet";
    homeDirectory = "/home/carmeet";
    stateVersion = "26.11";
  };
  programs = {
    kitty = {
      enable = true;
      settings = {
        font_family = "JetBrainsMono Nerd Font";
        font_size = 12;
        window_padding_width = 10;
        confirm_os_window_close = 0;
      };
    };
    noctalia.enable = true;
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
