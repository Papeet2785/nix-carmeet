{ pkgs, inputs, ... }:
{
  programs = {
    niri = {
      enable = true;
      package = pkgs.niri;
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
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
  environment = {
    sessionVariables = {
      XDG_CURRENT_DESKTOP = "niri";
      MOZ_ENABLE_WAYLAND = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
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
      vscode-fhs
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
      #niri
      playerctl
      wireplumber
      jq
      gtk4
      bc
      ghostty
      libnotify
      wl-clipboard
      cliphist
      pavucontrol
      brightnessctl
      xwayland-satellite
      #apps
      loupe
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
