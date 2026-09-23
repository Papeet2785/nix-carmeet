{ pkgs, inputs, ... }:
{
  programs = {
    niri = {
      enable = true;
      package = pkgs.niri;
    };
    nix-ld.enable = true;
    dconf.enable = true;
    fish.enable = true;
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
      fish
      vimPlugins.fzf-wrapper
      trash-cli
      #code
      helix
      arduino
      processing
      vscode-langservers-extracted
      bash-language-server
      fish-lsp
      nixd
      marksman
      nixfmt
      prettier
      shfmt
      godot
      gnumake
      cmake
      cmake-format
      cmake-language-server
      pkg-config
      clang
      clang-tools
      libX11
      libXcursor
      libXi
      libXinerama
      libXrandr
      libXext
      libXfixes
      pyright
      ruff
      jdt-language-server
      (python314.withPackages (python-pkgs: with python-pkgs; [
        manim
        numpy
        langchain
        langchain-openai
        langchain-community
        ddgs
        torch
        pygame
      ]))
      qt6.qtbase
      qt6.qtwayland
      wayland
      wayland-protocols
      wayland-scanner
      SDL2
      SDL2_image
      SDL2_mixer
      SDL2_ttf
      SDL2_gfx
      libdecor
      libxkbcommon
      openjdk
      #services
      polkit_gnome
      udiskie
      gsettings-desktop-schemas
      bluez
      bluez-tools
      ffmpeg_6-full
      wget
      gh
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
      inkscape
      zapzap
      lingot
      simple-scan
      supertuxkart
      gnome-themes-extra
      onlyoffice-desktopeditors
    ];
  };
}
