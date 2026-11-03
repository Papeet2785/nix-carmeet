{ pkgs, inputs, ... }:
let
  bibata-cursor-gruvbox = pkgs.stdenv.mkDerivation {
    pname = "bibata-cursor-gruvbox";
    version = "unstable-2026";

    src = pkgs.fetchFromGitHub {
      owner = "NiciTheNici";
      repo = "bibata_cursor_gruvbox";
      rev = "main"; # Point directly to the main branch to prevent 404 errors
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Temporary placeholder hash
    };

    installPhase = ''
      mkdir -p $out/share/icons/Bibata-Modern-Gruvbox-Dark
      
      # Copy theme structural files to the output icons directory
      if [ -d "Bibata-Modern-Gruvbox-Dark" ]; then
        cp -r Bibata-Modern-Gruvbox-Dark/* $out/share/icons/Bibata-Modern-Gruvbox-Dark/
      else
        cp -r * $out/share/icons/Bibata-Modern-Gruvbox-Dark/
      fi
    '';
  };
  gruvbox-papirus-icon-theme = pkgs.stdenv.mkDerivation {
    pname = "gruvbox-papirus-icon-theme";
    version = "unstable-2026";
    dontWrapQtApps = true; 
    src = pkgs.fetchFromGitHub {
      owner = "xelser";
      repo = "gruvbox-papirus-folders";
      rev = "main";
      hash = "sha256-P8YfefK6up+8jRd+n5KMu2tkepiu1fWx+rWXg1y5Kio="; 
    };
    nativeBuildInputs = [ pkgs.papirus-icon-theme pkgs.bash pkgs.coreutils ];
    installPhase = ''
      mkdir -p $out/share/icons
      cp -rL ${pkgs.papirus-icon-theme}/share/icons/* $out/share/icons/
      chmod -R +w $out/share/icons/
      cp -r src/* $out/share/icons/Papirus/
      cp -r src/* $out/share/icons/Papirus-Dark/
      cp -r src/* $out/share/icons/Papirus-Light/
      patchShebangs ./papirus-folders
      ./papirus-folders -C gruvbox-material-blue --theme Papirus-Dark -d $out/share/icons/Papirus-Dark
      ./papirus-folders -C gruvbox-material-blue --theme Papirus -d $out/share/icons/Papirus
    '';
  };
in
{
  imports = [
    ./hardware.nix
  ];
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
        vi_mode = true;
        vi_default_mode = "insert";
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
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
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
    xwayland.enable = true;
    nix-ld.enable = true;
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
  hardware = {
    sane.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
      ];
    };
  };
  users.users.carmeet = {
    isNormalUser = true;
    description = "sigma-nixos-user";
    extraGroups = [ "networkmanager" "wheel" "lp" "lpadmin" "dialout"];
    shell = pkgs.fish;
  };
  nixpkgs.config.allowUnfree = true;
  environment = {
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      GDK_BACKEND = "wayland,x11";
      QT_QPA_PLATFORM = "wayland;xcb";
    };
    variables = {
      RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
    };
    systemPackages = with pkgs; [
      #shell
      fzf
      glib
      bash
      trash-cli
      #code
      helix
      godot
      python3
      openjdk
      uv
      gcc
      pkg-config
      lldb
      clang-tools
      libGL
      libx11
      libx11.dev
      libxcursor
      libxi
      libxinerama
      libxrandr
      lld
      binutils
      arduino
      processing
      rustc
      cargo
      pyright
      gnumake
      rust-analyzer
      rustPlatform.rustLibSrc
      rustlings
      jdt-language-server
      ty
      python314Packages.python-lsp-server
      python314Packages.jedi
      ruff
      vscode-langservers-extracted
      fish-lsp
      nixd
      nil
      marksman
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
      nautilus
      xdg-utils
      mimeo
      shared-mime-info
      file
      xwayland-satellite
      fuse
      #niri
      playerctl
      wireplumber
      jq
      gtk4
      qt6Packages.qt6ct
      bc
      foot
      libnotify
      wl-clipboard
      cliphist
      pavucontrol
      brightnessctl
      #apps
      inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.freesmlauncher
      lingot
      qalculate-gtk
      evince
      gimp
      inkscape
      protonplus
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
      gnome-themes-extra
      onlyoffice-desktopeditors
      kdePackages.kdenlive
    ];
  };
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
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
      };
    };
  };
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    cursor = {
      package = bibata-cursor-gruvbox;
      name = "Bibata-Modern-Gruvbox-Dark";
      size = 24;
    };
    icons = {
      enable = true;
      package = gruvbox-papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus";
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "Jetbrains Mono Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      serif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
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
