{ pkgs, lib, ... }:

{
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      QT_QPA_PLATFORMTHEME = lib.mkForce "qt5ct";
      QT_QPA_PLATFORMTHEME_QT6 = lib.mkForce "qt6ct";
      PKG_CONFIG_PATH = "${pkgs.raylib}/lib/pkgconfig";
    };
  };
  services = {
    displayManager.ly = {
      enable = true;
      settings = {
        save = true;
        numlock = true;
        bigclock = true;
        animation = "matrix";
        clear_password = true;
        vi_mode = true;
        vi_default_mode = "insert";
      };
    };
    upower.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
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
