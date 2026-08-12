
{ config, pkgs, lib, ... }: {
  xdg.desktopEntries.arduino = {
    name = "Arduino IDE";
    exec = "env GDK_BACKEND=x11 _JAVA_AWT_WM_NONREPARENTING=1 arduino %F";
    terminal = false;
    categories = [ "Development" "IDE" ];
  };  
   xdg.desktopEntries.processing = {
    name = "Processing";
    exec = "env _JAVA_AWT_WM_NONREPARENTING=1 GDK_BACKEND=x11 processing %F";
    terminal = false;
    categories = [ "Development" "IDE" ];
  };  
  home.file.".local/share/applications/helix-terminal.desktop".text = ''
    [Desktop Entry]
    Name=Helix
    Comment=Helix in Kitty
    Exec=kitty -e hx %F
    Terminal=false
    Type=Application
    MimeType=text/plain;text/markdown;text/x-c;text/x-java;text/html;text/css;text/javascript;application/json;text/x-python;text/x-nix;
  '';
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Browser
      "text/html" = "google-chrome.desktop";
      "x-scheme-handler/http" = "google-chrome.desktop";
      "x-scheme-handler/https" = "google-chrome.desktop";
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
      # PDF
      "application/pdf" = "org.gnome.Evince.desktop";
      # LibreOffice Writer
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" =
        "writer.desktop";
      "application/msword" =
        "writer.desktop";

      # LibreOffice Calc
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" =
        "calc.desktop";
      "application/vnd.ms-excel" =
        "calc.desktop";

      # LibreOffice Impress
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" =
        "impress.desktop";
      "application/vnd.ms-powerpoint" =
        "impress.desktop";        
      # Media
      "audio/mpeg" = "vlc.desktop";
      "audio/mp4" = "vlc.desktop";
      "audio/x-wav" = "vlc.desktop";
      "audio/flac" = "vlc.desktop";
      "video/mp4" = "vlc.desktop";
      "video/x-matroska" = "vlc.desktop";
      "video/webm" = "vlc.desktop";
      "video/mpeg" = "vlc.desktop";
    };
  };
}
