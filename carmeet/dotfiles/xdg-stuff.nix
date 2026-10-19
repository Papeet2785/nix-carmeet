{ ... }: {
  home.file.".local/share/applications/helix-terminal.desktop".text = ''
    [Desktop Entry]
    Name = Helix
    Comment = Helix in Ghostty
    Exec = ghostty -e hx %F
    Terminal = false
    Type = Application
    MimeType = text/plain;text/markdown;text/x-c;text/x-java;text/css'textjavascript;application/json;text/x-python;text/x-nix;
  '';
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "text/plain" = "helix-terminal.desktop";
      "text/markdown" = "helix-terminal.desktop";
      "text/x-c" = "helix-terminal.desktop";
      "text/x-java" = "helix-terminal.desktop";
      "text/x-python" = "helix-terminal.desktop";
      "text/x-nix" = "helix-terminal.desktop";
      "text/css" = "helix-terminal.desktop";
      "text/javascript" = "helix-terminal.desktop";
      "application/json" = "helix-terminal.desktop";
      "application/pdf" = "org.gnome.Evince.desktop";
      "audio/mpeg" = "vlc.desktop";
      "audio/mp3" = "vlc.desktop";
      "audio/x-wav" = "vlc.desktop";
      "audio/flac" = "vlc.desktop";
      "video/mp4" = "vlc.desktop";
      "video/x-matroska" = "vlc.desktop";
      "video/webm" = "vlc.desktop";
      "video/mpeg" = "vlc.desktop";
    };
  };
}
