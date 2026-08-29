{ pkgs, ... }:
let
  slstatus = pkgs.slstatus.overrideAttrs (finalAttrs: previousAttrs: {
    src = ./dotfiles/slstatus;
  });
in
{
  services = {
    displayManager.ly = {
      enable = true;
      settings = {
        save = true;
        numlock = true;
        clear_password = true;
        vi_mode = true;
        vi_default_mode = "insert";
      };
    };
    dunst.enable = true;
    upower.enable = true;
    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
        tapping = true;
      };
    };
    xserver = {
      enable = true;
      excludePackages = [
        pkgs.xterm
      ];
      xkb = {
        layout = "us";
      };
      autoRepeatDelay = 250;
      autoRepeatInterval = 50;
      displayManager.sessionCommands = ''
        ${slstatus}/bin/slstatus &
      '';
      windowManager.dwm = {
        enable = true;
        package = pkgs.dwm.overrideAttrs (finalAttrs: previousAttrs: {
          src = ./dotfiles/dwm;
          buildInputs = previousAttrs.buildInputs ++ [ pkgs.libXcursor ];
        });
      };
    };
    picom = {
      enable = true;
      package = pkgs.picom-pijulius;
      settings = {
        backend = "glx";
        vsync = true;
        active-opacity = 1.0;
        inactive-opacity = 1.0;
        frame-opacity = 1.0;
        shadow = false;
        corner-radius = 0;
        fading = false;
        use-damage = true;
        glx-copy-from-front = false;
      };
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
}
