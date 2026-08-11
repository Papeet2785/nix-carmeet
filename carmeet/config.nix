{ config, pkgs, lib, inputs, ... }:
{ imports = [ ./hardware.nix ];
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
  };
  time.timeZone = "America/New_York";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };
  networking = {
    networkmanager.enable = true;
    hostName = "carmeet-pc";
    firewall = {
      allowedTCPPorts = [ 631 ];
      allowedUDPPorts = [ 5353 ];
      allowedTCPPortRanges = [{ from = 1714; to = 1764; }];
      allowedUDPPortRanges = [{ from = 1714; to = 1764; }];
    };
  };
  services = {
    displayManager.ly = {
      enable = true;
      settings = {
        save = true;
        numlock = true;
      };
    };
    upower.enable = true;
    xserver = {
      enable = true;
      xkb = { layout = "us"; };
    };
    logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchExternalPower = "suspend";
      HandleLidSwitchDocked = "ignore";
    };
    printing = {
      enable = true;
      drivers = with pkgs; [
        hplip
        canon-cups-ufr2
        gutenprint
        gutenprintBin
        cnijfilter2
      ];
    };
    udisks2.enable = true;
    gvfs.enable = true;
    dbus.enable = true;
    system-config-printer.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
  security.rtkit.enable = true;
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 5d";
    };
  };
  programs = {
    niri = {
      enable = true;
      package = pkgs.niri;
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        libGL
        libGLU
        mesa
        stdenv.cc.cc
        zlib
        libX11
        libXext
        libXi
        libXrandr
        libXrender
        libXcursor
        libXinerama
        libXfixes
        libXtst
        wayland
        libxkbcommon
        alsa-lib
        fontconfig
        freetype
        expat
      ];
    };  
    dconf.enable = true;
    fish.enable = true;
    starship.enable = true;
  };
  hardware = {
    sane.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
  users.users.carmeet = {
    isNormalUser = true;
    description = "carmeet";
    extraGroups = [ "networkmanager" "wheel" "lp" "lpadmin" "dialout"];
    shell = pkgs.fish;
  };
  nixpkgs = {
    config.allowUnfree = true;
  };
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
    };
    systemPackages = with pkgs; [
      #shell
      fzf
      glib
      bash
      vimPlugins.fzf-wrapper
      fastfetch
      trash-cli
      #code
      helix
      (python3.withPackages (ps: with ps; [
        tkinter
        numpy
        pandas
        pygame
        manim
        torch
        transformers
      ]))
      openjdk
      uv
      clang
      gcc
      clang-tools
      lld
      raylib
      binutils
      python314Packages.pyinstaller
      #lsps
      arduino-language-server
      basedpyright
      ruff
      jdt-language-server
      vscode-langservers-extracted
      fish-lsp
      nil
      marksman
      nixfmt
      prettier
      shfmt
      #services
      udiskie
      gsettings-desktop-schemas
      bluez
      bluez-tools
      ffmpeg_6-full
      wget
      git
      kdePackages.kdeconnect-kde
      shotcut
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
      bc
      ghostty
      libnotify
      wl-clipboard
      cliphist
      bibata-cursors
      pavucontrol
      brightnessctl
      #apps
      inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.freesmlauncher
      qalculate-gtk
      evince
      shotwell
      cheese
      obs-studio
      proton-vpn
      google-chrome
      vlc
      discord
      zapzap
      lingot
      simple-scan
      supertuxkart
      filezilla
      gnome-themes-extra
      onlyoffice-desktopeditors
      gimp
    ];
  };
  fonts = {
    packages = with pkgs; [
    comfortaa
    nerd-fonts.meslo-lg
    noto-fonts
    noto-fonts-color-emoji
      ];
    };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
        "org.freedesktop.impl.portal.OpenURI" = [ "gtk" ];
        # PipeWire screencast backend
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        # Optional
        "org.freedesktop.impl.portal.Screenshot" = [ "gtk" ];
      };
    };
  };
  stylix = {
    enable = true;
    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.meslo-lg;
        name = "MesloLGM Nerd Font";
      };
      serif = {
        package = pkgs.comfortaa;
        name = "Comfortaa";
      };
      sansSerif = {
        package = pkgs.comfortaa;
        name = "Comfortaa";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 10;
        terminal = 12;
        desktop = 10;
        popups = 12;
      };
    };
    polarity = "dark";
    targets = {
      gtk.enable = true;
      qt.enable = true;
      fish.enable = true;
    };
  };
  system.stateVersion = "26.05";
}
