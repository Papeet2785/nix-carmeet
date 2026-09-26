{ lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

    settings =
      let
        mkLuaInline = lib.generators.mkLuaInline;
        toLua = lib.generators.toLua;

        mkArgs = args: { _args = args; };

        bind =
          keys: dispatcher: options:
          mkArgs [
            keys
            dispatcher
            options
          ];

        dsp = {
          exec_cmd = cmd:
            mkLuaInline "hl.dsp.exec_cmd(${toLua { } cmd})";

          focus = args:
            mkLuaInline "hl.dsp.focus(${toLua { } args})";

          layout = arg:
            mkLuaInline "hl.dsp.layout(${toLua { } arg})";

          window = {
            close =
              mkLuaInline "hl.dsp.window.close()";

            float = args:
              mkLuaInline "hl.dsp.window.float(${toLua { } args})";

            fullscreen = args:
              mkLuaInline "hl.dsp.window.fullscreen(${toLua { } args})";

            move = args:
              mkLuaInline "hl.dsp.window.move(${toLua { } args})";
          };
        };
      in
      {

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

        # These must be inside "config" for the Lua backend.
        config = {
          general = {
            layout = "master";
            gaps_in = 10;
            gaps_out = 10;
            border_size = 0;
            "col.active_border" = "rgb(83a598)";
            "col.inactive_border" = "rgb(665c54)";
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

          decoration = {
            rounding = 0;

            shadow = {
              color = "rgba(1d202199)";
            };
          };

          group = {
            "col.border_active" = "rgb(83a598)";
            "col.border_inactive" = "rgb(665c54)";
            "col.border_locked_active" = "rgb(8ec07c)";

            groupbar = {
              "col.active" = "rgb(83a598)";
              "col.inactive" = "rgb(665c54)";
              "text_color" = "rgb(d5c4a1)";
            };
          };

          misc = {
            background_color = "rgb(1d2021)";
          };
        };

        gesture = {
          fingers = 3;
          direction = "horizontal";
          action = "workspace";
        };

        bind = [

          # Applications

          (bind
            "SUPER + Return"
            (dsp.exec_cmd "kitty")
            { }
          )

          (bind
            "SUPER + Escape"
            (dsp.exec_cmd "kitty -e btop")
            { }
          )

          (bind
            "SUPER + C"
            (dsp.exec_cmd "kitty -e hx /home/carmeet")
            { }
          )

          (bind
            "SUPER + SHIFT + C"
            (dsp.exec_cmd "kitty -e hx /home/carmeet/nix-carmeet")
            { }
          )

          (bind
            "SUPER + B"
            (dsp.exec_cmd "firefox")
            { }
          )

          (bind
            "SUPER + SHIFT + B"
            (dsp.exec_cmd "google-chrome")
            { }
          )

          (bind
            "SUPER + E"
            (dsp.exec_cmd "nautilus")
            { }
          )


          # Noctalia

          (bind
            "SUPER + D"
            (dsp.exec_cmd "noctalia msg panel-toggle launcher")
            { }
          )

          (bind
            "SUPER + V"
            (dsp.exec_cmd "noctalia msg panel-toggle clipboard")
            { }
          )

          (bind
            "SUPER + N"
            (dsp.exec_cmd "noctalia msg panel-toggle control-center")
            { }
          )

          (bind
            "SUPER + comma"
            (dsp.exec_cmd "noctalia msg settings-toggle")
            { }
          )

          (bind
            "CTRL + ALT + Delete"
            (dsp.exec_cmd "noctalia msg panel-toggle session")
            { }
          )

          (bind
            "SUPER + W"
            (dsp.exec_cmd "noctalia msg panel-toggle wallpaper")
            { }
          )


          # Function Keys

          (bind
            "XF86AudioRaiseVolume"
            (dsp.exec_cmd "noctalia msg volume-up")
            { }
          )

          (bind
            "XF86AudioLowerVolume"
            (dsp.exec_cmd "noctalia msg volume-down")
            { }
          )

          (bind
            "XF86AudioMute"
            (dsp.exec_cmd "noctalia msg volume-mute")
            { }
          )

          (bind
            "XF86MonBrightnessUp"
            (dsp.exec_cmd "noctalia msg brightness-up")
            { }
          )

          (bind
            "XF86MonBrightnessDown"
            (dsp.exec_cmd "noctalia msg brightness-down")
            { }
          )

          (bind
            "XF86AudioPlay"
            (dsp.exec_cmd "playerctl play-pause")
            { }
          )

          (bind
            "XF86AudioNext"
            (dsp.exec_cmd "playerctl next")
            { }
          )

          (bind
            "XF86AudioPrev"
            (dsp.exec_cmd "playerctl previous")
            { }
          )

          (bind
            "XF86AudioStop"
            (dsp.exec_cmd "playerctl stop")
            { }
          )


          # Window management

          (bind
            "SUPER + Q"
            dsp.window.close
            { }
          )

          (bind
            "SUPER + SPACE"
            (dsp.window.float { action = "toggle"; })
            { }
          )

          (bind
            "SUPER + SHIFT + SPACE"
            (dsp.focus { last = true; })
            { }
          )

          (bind
            "SUPER + F"
            (dsp.window.fullscreen {
              mode = "fullscreen";
              action = "toggle";
            })
            { }
          )


          # Focus

          (bind
            "SUPER + H"
            (dsp.focus { direction = "l"; })
            { }
          )

          (bind
            "SUPER + J"
            (dsp.focus { direction = "d"; })
            { }
          )

          (bind
            "SUPER + K"
            (dsp.focus { direction = "u"; })
            { }
          )

          (bind
            "SUPER + L"
            (dsp.focus { direction = "r"; })
            { }
          )


          # Resize

          (bind
            "SUPER + SHIFT + H"
            (dsp.exec_cmd "hyprctl dispatch resizeactive -5% 0")
            { }
          )

          (bind
            "SUPER + SHIFT + L"
            (dsp.exec_cmd "hyprctl dispatch resizeactive 5% 0")
            { }
          )

          (bind
            "SUPER + SHIFT + J"
            (dsp.exec_cmd "hyprctl dispatch resizeactive 0 5%")
            { }
          )

          (bind
            "SUPER + SHIFT + K"
            (dsp.exec_cmd "hyprctl dispatch resizeactive 0 -5%")
            { }
          )


          # Master / stack

          (bind
            "SUPER + CTRL + H"
            (dsp.layout "swapprev")
            { }
          )

          (bind
            "SUPER + CTRL + L"
            (dsp.layout "swapnext")
            { }
          )

          (bind
            "SUPER + CTRL + K"
            (dsp.layout "rollprev")
            { }
          )

          (bind
            "SUPER + CTRL + J"
            (dsp.layout "rollnext")
            { }
          )


          # Screenshots

          (bind
            "SUPER + SHIFT + S"
            (dsp.exec_cmd "grimblast save area ~/Pictures/Screenshots/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png")
            { }
          )

          (bind
            "Print"
            (dsp.exec_cmd "grimblast save screen ~/Pictures/Screenshots/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png")
            { }
          )


          # Workspace binds

          (bind
            "SUPER + 1"
            (dsp.focus { workspace = 1; })
            { }
          )

          (bind
            "SUPER + 2"
            (dsp.focus { workspace = 2; })
            { }
          )

          (bind
            "SUPER + 3"
            (dsp.focus { workspace = 3; })
            { }
          )

          (bind
            "SUPER + 4"
            (dsp.focus { workspace = 4; })
            { }
          )

          (bind
            "SUPER + 5"
            (dsp.focus { workspace = 5; })
            { }
          )

          (bind
            "SUPER + 6"
            (dsp.focus { workspace = 6; })
            { }
          )

          (bind
            "SUPER + 7"
            (dsp.focus { workspace = 7; })
            { }
          )

          (bind
            "SUPER + 8"
            (dsp.focus { workspace = 8; })
            { }
          )

          (bind
            "SUPER + 9"
            (dsp.focus { workspace = 9; })
            { }
          )

          (bind
            "SUPER + 0"
            (dsp.focus { workspace = 10; })
            { }
          )


          # Move to workspace

          (bind
            "SUPER + SHIFT + 1"
            (dsp.window.move { workspace = 1; })
            { }
          )

          (bind
            "SUPER + SHIFT + 2"
            (dsp.window.move { workspace = 2; })
            { }
          )

          (bind
            "SUPER + SHIFT + 3"
            (dsp.window.move { workspace = 3; })
            { }
          )

          (bind
            "SUPER + SHIFT + 4"
            (dsp.window.move { workspace = 4; })
            { }
          )

          (bind
            "SUPER + SHIFT + 5"
            (dsp.window.move { workspace = 5; })
            { }
          )

          (bind
            "SUPER + SHIFT + 6"
            (dsp.window.move { workspace = 6; })
            { }
          )

          (bind
            "SUPER + SHIFT + 7"
            (dsp.window.move { workspace = 7; })
            { }
          )

          (bind
            "SUPER + SHIFT + 8"
            (dsp.window.move { workspace = 8; })
            { }
          )

          (bind
            "SUPER + SHIFT + 9"
            (dsp.window.move { workspace = 9; })
            { }
          )

          (bind
            "SUPER + SHIFT + 0"
            (dsp.window.move { workspace = 10; })
            { }
          )


          # Silent move to workspace

          (bind
            "SUPER + CTRL + 1"
            (dsp.window.move {
              workspace = 1;
              follow = false;
            })
            { }
          )

          (bind
            "SUPER + CTRL + 2"
            (dsp.window.move {
              workspace = 2;
              follow = false;
            })
            { }
          )

          (bind
            "SUPER + CTRL + 3"
            (dsp.window.move {
              workspace = 3;
              follow = false;
            })
            { }
          )

          (bind
            "SUPER + CTRL + 4"
            (dsp.window.move {
              workspace = 4;
              follow = false;
            })
            { }
          )

          (bind
            "SUPER + CTRL + 5"
            (dsp.window.move {
              workspace = 5;
              follow = false;
            })
            { }
          )

          (bind
            "SUPER + CTRL + 6"
            (dsp.window.move {
              workspace = 6;
              follow = false;
            })
            { }
          )

          (bind
            "SUPER + CTRL + 7"
            (dsp.window.move {
              workspace = 7;
              follow = false;
            })
            { }
          )

          (bind
            "SUPER + CTRL + 8"
            (dsp.window.move {
              workspace = 8;
              follow = false;
            })
            { }
          )

          (bind
            "SUPER + CTRL + 9"
            (dsp.window.move {
              workspace = 9;
              follow = false;
            })
            { }
          )

          (bind
            "SUPER + CTRL + 0"
            (dsp.window.move {
              workspace = 10;
              follow = false;
            })
            { }
          )
        ];

        # Startup
        on = mkArgs [
          "hyprland.start"
          (mkLuaInline ''
            function()
              hl.exec_cmd("noctalia")
              hl.exec_cmd("polkit-gnome-authentication-agent-1")
              hl.exec_cmd("dbus-update-activation-environment --systemd DISPLAY HYPRLAND_INSTANCE_SIGNATURE WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")
            end
          '')
        ];
      };
  };
}
