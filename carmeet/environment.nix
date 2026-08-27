{ pkgs, inputs, lib, ... }:
{
  programs = {
    niri = {
      enable = true;
      package = pkgs.niri;
    };
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };
    nix-ld.enable = true;
    dconf.enable = true;
    bash.enable = true;
    starship.enable = true;
    auto-cpufreq = {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          turbo = "auto";
        };
        battery = {
          governor = "powersave";
          turbo = "auto";
        };
      };
    };
  };
   nixpkgs = {
    config.allowUnfree = true;
  };
  environment = {
    sessionVariables = {
      GDK_BACKEND = "wayland,x11,*";
      QT_QPA_PLATFORM = "wayland;xcb";
      CLUTTER_BACKEND = "wayland";
      XDG_CURRENT_DESKTOP = "niri";
      XDG_SESSION_DESKTOP = "niri";
      XDG_SESSION_TYPE = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      NIXOS_OZONE_WL = "1";
    };
    systemPackages = with pkgs; [
      #shell
      fastfetch
      fzf
      fd
      ripgrep
      desktop-file-utils
      glib
      bash
      vimPlugins.fzf-wrapper
      trash-cli
      #code
      helix
      arduino
      processing
      vscode-langservers-extracted
      bash-language-server
      nixd
      marksman
      nixfmt
      prettier
      shfmt
      #services
      polkit_gnome
      udiskie
      gsettings-desktop-schemas
      bluez
      bluez-tools
      ffmpeg_6-full
      wget
      git
      kdePackages.kdeconnect-kde
      kdePackages.kdenlive
      gvfs
      nautilus
      xdg-utils
      mimeo
      shared-mime-info
      file
      xwayland-satellite
      appimage-run
      fuse
      #niri/hyprland
      playerctl
      wireplumber
      jq
      gtk4
      qt6Packages.qt6ct
      libsForQt5.qt5ct
      bc
      ghostty
      libnotify
      wl-clipboard
      cliphist
      pavucontrol
      brightnessctl
      # xwayland-satellite
      hyprlock
      hyprsunset
      hypridle
      swaynotificationcenter
      rofi
      waybar
      waypaper
      awww
      grim
      slurp
      swappy
      #apps
      inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.freesmlauncher
      networkmanagerapplet
      blueman
      qalculate-gtk
      evince
      gimp
      cheese
      obs-studio
      proton-vpn
      firefox
      raylib-games
      google-chrome
      vlc
      discord
      zapzap
      lingot
      simple-scan
      supertuxkart
      gnome-themes-extra
      onlyoffice-desktopeditors
    ];
  };
}
