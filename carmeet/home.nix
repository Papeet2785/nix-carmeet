{ lib, config, ... }: {
  home = {
    username = "carmeet";
    homeDirectory = "/home/carmeet";
    stateVersion = "26.11";
  };
  programs = {
    foot = {
      enable = true;
      settings = {
        main = {
          font = lib.mkForce "JetBrains Mono Nerd Font:size=12";
          pad = "10x10 center";
        };
      };
      fonts.fontconfig.enable = true;
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
