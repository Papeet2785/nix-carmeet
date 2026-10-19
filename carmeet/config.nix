{ config, pkgs, lib, inputs, ... }: {
  imports = [ ./hardware.nix ];
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
        vi_default_mode = "normal";
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
      auto-optimize-store = true;
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
  hardware = {
    sane.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
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
      python3
      openjdk
      uv
      clang
      gcc
      clang-tools
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
      jdt-language-server
      ruff
      vscode-langservers-extracted
      fish-lsp
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
      gimp
      loupe
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
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "Jetbrains Mono Nerd Font";
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
