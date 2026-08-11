
{ config, pkgs, lib, inputs, ... }: {
  home.username = "carmeet";
  home.homeDirectory = "/home/carmeet";
  home.stateVersion = "26.11";

  programs.noctalia = {
    enable = true;
  };

  programs.ghostty = {
    enable = true;
    settings = {
      confirm-close-surface = false;
      font-family = "MesloLGM Nerd Font";
      font-size = 12;
    };
  };
  stylix.targets.btop.enable = false;
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "gruvbox_dark";
    };
  };
  imports = [
    ./dotfiles/fish.nix
  ];
  home.file = {
  ".config/helix".source = ./dotfiles/helix;
  ".config/fastfetch".source = ./dotfiles/fastfetch;
  ".config/niri".source = ./dotfiles/niri;
  ".config/noctalia".source = ./dotfiles/noctalia;

  ".local/share/applications/helix-terminal.desktop".text = ''
    [Desktop Entry]
    Name=Helix
    Comment=Helix in Ghostty
    Exec=ghostty -e hx %F
    Terminal=false
    Type=Application
    Categories=Development;TextEditor;
  '';

  ".local/share/mime/packages/carmeet-mime.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
      <mime-type type="text/x-arduino">
        <comment>Arduino Sketch</comment>
        <glob pattern="*.ino"/>
      </mime-type>

      <mime-type type="text/x-processing">
        <comment>Processing Sketch</comment>
        <glob pattern="*.pde"/>
      </mime-type>
    </mime-info>
  '';
  };

  xdg.desktopEntries.arduino = {
    name = "Arduino IDE";
    exec = "appimage-run /home/carmeet/Applications/arduino-ide_2.3.10_Linux_64bit.AppImage %F";
    terminal = false;
    categories = [ "Development" "IDE" ];
    mimeType = [ "text/x-arduino" ];
  };

  xdg.desktopEntries.processing = {
    name = "Processing";
    exec = "env _JAVA_AWT_WM_NONREPARENTING=1 GDK_BACKEND=x11 /home/carmeet/Applications/Processing/bin/Processing %F";
    icon = "/home/carmeet/Applications/Processing/lib/Processing.png";
    terminal = false;
    categories = [ "Development" "IDE" ];
    mimeType = [ "text/x-processing" ];
  };

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # Browser
      # Text / programming
      "text/plain" = "helix-terminal.desktop";
      "text/markdown" = "helix-terminal.desktop";
      "text/x-c" = "helix-terminal.desktop";
      "text/x-java" = "helix-terminal.desktop";
      "text/x-python" = "helix-terminal.desktop";
      "text/x-nix" = "helix-terminal.desktop";
      "text/css" = "helix-terminal.desktop";
      "text/javascript" = "helix-terminal.desktop";
      "application/json" = "helix-terminal.desktop";

      # Images
      "image/png" = "org.gnome.Shotwell-Viewer.desktop";
      "image/jpeg" = "org.gnome.Shotwell-Viewer.desktop";
      "image/gif" = "org.gnome.Shotwell-Viewer.desktop";
      "image/webp" = "org.gnome.Shotwell-Viewer.desktop";
      "image/tiff" = "org.gnome.Shotwell-Viewer.desktop";
      "image/bmp" = "org.gnome.Shotwell-Viewer.desktop";

      # Arduino
      "text/x-arduino" = "arduino.desktop";

      # Processing
      "text/x-processing" = "processing.desktop";

      # Images
      "application/pdf" = "org.gnome.Evince.desktop";

      # Directories
      "inode/directory" = "org.gnome.Nautilus.desktop";

      # Microsoft Office documents
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "onlyoffice-desktopeditors.desktop";
      "application/msword" = "onlyoffice-desktopeditors.desktop";

      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.ms-excel" = "onlyoffice-desktopeditors.desktop";

      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.ms-powerpoint" = "onlyoffice-desktopeditors.desktop";
    };
  };
}
