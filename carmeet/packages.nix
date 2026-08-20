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
          governer = "performance";
          turbo = "auto";
        };
        battery = {
          governer = "powersave";
          turbo = "auto";
        };
      };
    };
  };
   nixpkgs = {
    config.allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    #shell
    fastfetch
    fzf
    glib
    bash
    vimPlugins.fzf-wrapper
    trash-cli
    #code
    helix
    openjdk
    (python3.withPackages (
      ps: with ps; [
        pyqt6
        pyqt6-webengine
        pygame
        pyside6
        tkinter
        manim
        numpy
      ]
    ))
    uv
    clang
    gcc
    clang-tools
    lld
    raylib
    pkg-config
    gnumake
    binutils
    arduino
    processing
    #lsps
    basedpyright
    ruff
    jdt-language-server
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
    #niri
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
    #apps
    inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.freesmlauncher
    qalculate-gtk
    evince
    gimp
    loupe
    cheese
    obs-studio
    proton-vpn
    firefox
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
}
