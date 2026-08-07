{config, pkgs, inputs, ...}: {
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
      nixbuild = "cd ~/nix-carmeet && sudo nixos-rebuild switch --flake ./#myMachine";
      nixfreespace = "sudo nix-collect-garbage -d";
      gotrash = "sudo rm -rf ~/.local/share/Trash/*";
      tinstall = "nix-shell -p";
      nixupgrade = "cd ~/nix-carmeet && nix flake update && sudo nixos-rebuild switch --flake .#myMachine";
      noctaliabackupconfig = "cp -r ~/.config/noctalia ~/nix-carmeet/carmeet/dotfiles/";
    };
    interactiveShellInit = ''
      set -g fish_greeting ""
      '';
  };
  programs.noctalia = {
    enable = true;
  };
  home.file = {
    ".config/kitty".source = ./dotfiles/kitty;
    ".config/helix".source = ./dotfiles/helix;
    ".config/fastfetch".source = ./dotfiles/fastfetch;
    ".config/niri".source = ./dotfiles/niri;
    ".config/noctalia".source = ./dotfiles/noctalia;
  };
  xdg.desktopEntries.arduino = {
    name = "Arduino IDE";
    exec = "appimage-run /home/carmeet/Applications/arduino-ide_2.3.10_Linux_64bit.AppImage";
    terminal = false;
    categories = [ "Development" "IDE" ];
  };

  xdg.desktopEntries.processing = {
    name = "Processing";
    exec = "env _JAVA_AWT_WM_NONREPARENTING=1 GDK_BACKEND=x11 /home/carmeet/Applications/Processing/bin/Processing";
    icon = "/home/carmeet/Applications/Processing/lib/Processing.png";
    terminal = false;
    categories = [ "Development" "IDE" ];
  };
}
