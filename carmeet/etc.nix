{ pkgs, inputs, ... }: {
  imports = [
    ./hardware.nix
    ./stylix.nix
    ./packages.nix
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
    extraGroups = [ "networkmanager" "wheel" "lp" "lpadmin" "dialout" ];
    shell = pkgs.fish;
  };
  nixpkgs.config.allowUnfree = true;
  environment = {
    sessionVariables = {
      XCURSOR_THEME = "Bibata-Modern-Classic";
      XCURSOR_SIZE = "24";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      GDK_BACKEND = "wayland,x11";
      QT_QPA_PLATFORM = "wayland;xcb";
    };
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };
  system.stateVersion = "26.05";
}

