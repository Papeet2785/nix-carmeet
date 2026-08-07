{ config, pkgs, lib, inputs, ... }:
{
    imports = [
      ./hardware.nix
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "carmeet-pc";
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
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
  networking.networkmanager.enable = true;
  services.displayManager.ly = {
    enable = true;
    settings = {
      save = true;
      numlock = true;
    };
  };
  services.upower = {
    enable = true;
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 5d";
  };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.niri = {
    enable = true;
  };
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "suspend";
    HandleLidSwitchDocked = "ignore";
  };
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [
    hplip
    canon-cups-ufr2
    gutenprint
    gutenprintBin
    cnijfilter2
  ];
  hardware.sane.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.dbus.enable = true;
  services.system-config-printer.enable = true;
  networking.firewall.allowedTCPPorts = [ 631 ];
  networking.firewall.allowedUDPPorts = [ 5353 ];
  networking.firewall.allowedTCPPortRanges = [
    { from = 1714; to = 1764; }
  ];
  networking.firewall.allowedUDPPortRanges = [
    { from = 1714; to = 1764; }
  ];
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  hardware.bluetooth = {
  enable = true;
  powerOnBoot = true;
};
  users.users.carmeet = {
    isNormalUser = true;
    description = "carmeet";
    extraGroups = [ "networkmanager" "wheel" "lp" "lpadmin" "dialout"];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
  programs.starship.enable = true;
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
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
    lua-language-server
    nil
    taplo
    bash-language-server
    yaml-language-server
    marksman
    black
    stylua
    nixfmt
    prettier
    shfmt
    
    #services
    btop
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

    #hyprland
    awww
    waypaper
    hyprsunset
    hypridle
    playerctl
    wireplumber
    rofi-unwrapped
    jq
    gtk4
    qt6Packages.qt6ct
    bc
    kitty
    swaynotificationcenter
    libnotify
    waybar
    nwg-displays
    wl-clipboard
    cliphist
    grim
    slurp
    swappy
    bibata-cursors
    hyprcursor
    networkmanagerapplet
    blueman
    hyprlock
    evince
    shotwell
    pavucontrol
    brightnessctl
    pamixer
    qalculate-gtk

    #apps
    inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.freesmlauncher
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
    filezilla
    gnome-themes-extra
    onlyoffice-desktopeditors
    tuxpaint
  ];
programs.dconf.enable = true;
fonts = {
  packages = with pkgs; [
  comfortaa
  nerd-fonts.meslo-lg
  noto-fonts
  noto-fonts-color-emoji
    ];
  };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  stylix.enable = true;
  stylix = {
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
        name = "MesloLGS Nerd Font";
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
