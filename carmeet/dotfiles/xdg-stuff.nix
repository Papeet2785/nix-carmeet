{  ... }: {
  # Ensure the desktop MIME database and application caches are generated properly
  xdg.mime.enable = true;

  xdg.desktopEntries = {
    arduino = {
      name = "Arduino IDE";
      exec = "env GDK_BACKEND=x11 _JAVA_AWT_WM_NONREPARENTING=1 arduino %F";
      terminal = false;
      categories = [ "Development" "IDE" ];
      icon = "arduino";
    };  
    
    processing = {
      name = "Processing";
      exec = "env _JAVA_AWT_WM_NONREPARENTING=1 GDK_BACKEND=x11 processing %F";
      terminal = false;
      categories = [ "Development" "IDE" ];
      icon = "processing";
    };

    helix-terminal = {
      name = "Helix";
      comment = "Helix";
      exec = "ghostty -e hx %F";
      terminal = false;
      type = "Application";
      mimeType = [
        "text/plain"
        "text/markdown"
        "text/x-c"
        "text/x-java"
        "text/html"
        "text/css"
        "text/javascript"
        "application/json"
        "text/x-python"
        "text/x-nix"
      ];
    };
  };  

  xdg.mimeApps = {
    enable = true;
    defaultApplications = 
      let
        mapMimeTypes = app: mimes: 
          builtins.listToAttrs (map (mime: { name = mime; value = app; }) mimes);
      in
        {
          "x-scheme-handler/http" = "firefox.desktop";
          "x-scheme-handler/https" = "firefox.desktop";
        }
        // mapMimeTypes "firefox.desktop" [
          "text/html"
        ]
        // mapMimeTypes "helix-terminal.desktop" [
          "text/plain"
          "text/markdown"
          "text/x-c"
          "text/x-java"
          "text/x-python"
          "text/x-nix"
          "text/css"
          "text/javascript"
          "application/json"
        ]
        // mapMimeTypes "org.gnome.Evince.desktop" [
          "application/pdf"
        ]
        // mapMimeTypes "onlyoffice-desktopeditors.desktop" [
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
          "application/msword"
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
          "application/vnd.ms-excel"
          "application/vnd.openxmlformats-officedocument.presentationml.presentation"
          "application/vnd.ms-powerpoint"
          "application/wps-office.docx"
          "application/wps-office.doc"
          "application/wps-office.xlsx"
          "application/wps-office.xls"
          "application/wps-office.pptx"
          "application/wps-office.ppt"
          "application/vnd.oasis.opendocument.text"
          "application/vnd.oasis.opendocument.spreadsheet"
          "application/vnd.oasis.opendocument.presentation"
          "application/zip"
        ]
        // mapMimeTypes "vlc.desktop" [
          "audio/mpeg"
          "audio/mp4"
          "audio/x-wav"
          "audio/flac"
          "video/mp4"
          "video/x-matroska"
          "video/webm"
          "video/mpeg"
        ]
        // mapMimeTypes "org.gnome.Loupe.desktop" [
          "image/jpeg"
          "image/png"
          "image/gif"
          "image/webp"
          "image/tiff"
          "image/bmp"
          "image/x-icon"
          "image/heif"
          "image/avif"
        ];
  };
}
