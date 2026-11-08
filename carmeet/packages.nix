{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    #shell
    fzf
    bash
    trash-cli
    btop
    #code
    helix
    godot
    python3
    openjdk
    uv
    gcc
    pkg-config
    clang-tools
    libxcursor
    libxi
    libxinerama
    libxrandr
    lld
    binutils
    arduino
    processing
    pyright
    cmake
    gnumake
    jdt-language-server
    ty
    python314Packages.python-lsp-server
    python314Packages.jedi
    lua
    lua-language-server
    ruff
    vscode-langservers-extracted
    fish-lsp
    nixd
    nil
    marksman
    pango
    libX11
    libX11.dev
    xorgproto
    libxcb.dev
    libXext.dev
    libXrandr.dev
    libXfixes.dev
    libXrender.dev
    libXcursor.dev
    libXi.dev
    libXinerama.dev
    libXau.dev
    libXdmcp.dev
    cairo
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
    gvfs
    tumbler
    thunar
    xdg-utils
    mimeo
    shared-mime-info
    file
    xwayland-satellite
    fuse
    #niri
    playerctl
    papirus-icon-theme
    papirus-folders
    bibata-cursors
    wireplumber
    jq
    gtk4
    qt6Packages.qt6ct
    bc
    kitty
    libnotify
    wl-clipboard
    cliphist
    pavucontrol
    brightnessctl
    #apps
    inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.freesmlauncher
    lingot
    qalculate-gtk
    zathura
    gimp
    inkscape
    protonplus
    ristretto
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
    gnome-themes-extra
    onlyoffice-desktopeditors
    kdePackages.kdenlive
  ];
  programs = {
    niri = {
      enable = true;
      package = pkgs.niri;
    };
    xwayland.enable = true;
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        glib
        zlib
        zstd
        bzip2
        stdenv.cc.cc
        llvmPackages.libclang
        fontconfig
        freetype
        libGL
        libxkbcommon
        libxkbcommon.dev
        libX11
        libxcb
        libXext
        libXrandr
        libXcomposite
        libXdamage
        libXfixes
        libXrender
        libXtst
        wayland
        libdrm
        libpulseaudio
        alsa-lib
        dbus
        libglvnd
        expat
        mesa
        libgbm
        krb5
        nspr
        nss
        systemd
        libxkbfile
        nss
        systemd
        libxkbfile
        brotli
      ];
    };   
    dconf.enable = true;
    fish.enable = true;
    starship.enable = true;
    steam.enable = true;
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
}

