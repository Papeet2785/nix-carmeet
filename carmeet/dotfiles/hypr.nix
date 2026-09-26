{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
       env = [
        "GDK_BACKEND,wayland,x11,*"
        "QT_QPA_PLATFORM,wayland;xcb"
        "CLUTTER_BACKEND,wayland"

        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"

        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_STYLE_OVERRIDE,Fusion"
        "GDK_SCALE,1"
        "QT_SCALE_FACTOR,1"

        "MOZ_ENABLE_WAYLAND,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"

        "HYPRCURSOR_THEME,Bibata-Modern-Ice"
        "HYPRCURSOR_SIZE,24"
        "XCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,24"

        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
        "GSK_RENDERER,ngl"
        "WLR_RENDERER_ALLOW_SOFTWARE,1"
      ];

      exec_cmd = [
        "noctalia --daemon"
        "polkit-gnome-authentication-agent-1"
      ];

      general = {
        layout = "master";
        gaps_in = 10;
        gaps_out = 10;
        border_size = 0;
      };

      master = {
        new_status = "slave";
        new_on_top = false;
        mfact = 0.55;
        orientation = "left";
      };

      input = {
        kb_layout = "us";
        repeat_rate = 50;
        repeat_delay = 250;
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = true;
        };
      };

      gesture = [
        { fingers = 3; direction = "horizontal"; action = "workspace"; }
      ];

      decoration = {
        rounding = 0;
      };

      bind = [
        # Applications
        "$mod, RETURN, exec, kitty"
        "$mod, ESCAPE, exec, kitty -e btop"
        "$mod, C, exec, kitty -e hx /home/carmeet"
        "$mod SHIFT, C, exec, kitty -e hx /home/carmeet/nix-carmeet"
        "$mod, B, exec, firefox"
        "$mod SHIFT, B, exec, google-chrome"
        "$mod, E, exec, nautilus"

        # Noctalia
        "$mod, D, exec, noctalia msg panel-toggle launcher"
        "$mod, V, exec, noctalia msg panel-toggle clipboard"
        "$mod, N, exec, noctalia msg panel-toggle control-center"
        "$mod, comma, exec, noctalia msg settings-toggle"
        "CTRL ALT, DELETE, exec, noctalia msg panel-toggle session"
        "$mod, W, exec, noctalia msg panel-toggle wallpaper"

        # Function Keys
        ", XF86AudioRaiseVolume, exec, noctalia msg volume-up"
        ", XF86AudioLowerVolume, exec, noctalia msg volume-down"
        ", XF86AudioMute, exec, noctalia msg volume-mute"
        ", XF86MonBrightnessUp, exec, noctalia msg brightness-up"
        ", XF86MonBrightnessDown, exec, noctalia msg brightness-down"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioStop, exec, playerctl stop"

        # Window management
        "$mod, Q, killactive"
        "$mod, SPACE, togglefloating"
        "$mod SHIFT, SPACE, focuscurrentorlast"
        "$mod, F, fullscreen, 0"

        # Focus
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        # Resize
        "$mod SHIFT, H, resizeactive, -5% 0"
        "$mod SHIFT, L, resizeactive, 5% 0"
        "$mod SHIFT, J, resizeactive, 0 5%"
        "$mod SHIFT, K, resizeactive, 0 -5%"

        # Master / stack
        "$mod CTRL, H, layoutmsg, swapprev"
        "$mod CTRL, L, layoutmsg, swapnext"
        "$mod CTRL, K, layoutmsg, rollprev"
        "$mod CTRL, J, layoutmsg, rollnext"

        # Screenshots
        "$mod SHIFT, S, exec, grimblast save area ~/Pictures/Screenshots/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png && grimblast copy area"
        ", Print, exec, grimblast save screen ~/Pictures/Screenshots/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png && grimblast copy screen"

        # Workspace binds
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod CTRL, 1, movetoworkspacesilent, 1"
        "$mod CTRL, 2, movetoworkspacesilent, 2"
        "$mod CTRL, 3, movetoworkspacesilent, 3"
        "$mod CTRL, 4, movetoworkspacesilent, 4"
        "$mod CTRL, 5, movetoworkspacesilent, 5"
        "$mod CTRL, 6, movetoworkspacesilent, 6"
        "$mod CTRL, 7, movetoworkspacesilent, 7"
        "$mod CTRL, 8, movetoworkspacesilent, 8"
        "$mod CTRL, 9, movetoworkspacesilent, 9"
        "$mod CTRL, 0, movetoworkspacesilent, 10"
      ];
    };     
  };
}
