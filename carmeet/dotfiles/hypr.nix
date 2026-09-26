{ lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

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

        {
          _args = [
            "SUPER + Return"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("kitty")'')
          ];
        }

        {
          _args = [
            "SUPER + Escape"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("kitty -e btop")'')
          ];
        }

        {
          _args = [
            "SUPER + C"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("kitty -e hx /home/carmeet")'')
          ];
        }

        {
          _args = [
            "SUPER + SHIFT + C"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("kitty -e hx /home/carmeet/nix-carmeet")'')
          ];
        }

        {
          _args = [
            "SUPER + B"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("firefox")'')
          ];
        }

        {
          _args = [
            "SUPER + SHIFT + B"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("google-chrome")'')
          ];
        }

        {
          _args = [
            "SUPER + E"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("nautilus")'')
          ];
        }


        # Noctalia

        {
          _args = [
            "SUPER + D"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg panel-toggle launcher")'')
          ];
        }

        {
          _args = [
            "SUPER + V"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard")'')
          ];
        }

        {
          _args = [
            "SUPER + N"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg panel-toggle control-center")'')
          ];
        }

        {
          _args = [
            "SUPER + comma"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg settings-toggle")'')
          ];
        }

        {
          _args = [
            "CTRL + ALT + Delete"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg panel-toggle session")'')
          ];
        }

        {
          _args = [
            "SUPER + W"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg panel-toggle wallpaper")'')
          ];
        }


        # Function Keys

        {
          _args = [
            "XF86AudioRaiseVolume"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg volume-up")'')
          ];
        }

        {
          _args = [
            "XF86AudioLowerVolume"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg volume-down")'')
          ];
        }

        {
          _args = [
            "XF86AudioMute"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg volume-mute")'')
          ];
        }

        {
          _args = [
            "XF86MonBrightnessUp"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg brightness-up")'')
          ];
        }

        {
          _args = [
            "XF86MonBrightnessDown"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg brightness-down")'')
          ];
        }

        {
          _args = [
            "XF86AudioPlay"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl play-pause")'')
          ];
        }

        {
          _args = [
            "XF86AudioNext"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl next")'')
          ];
        }

        {
          _args = [
            "XF86AudioPrev"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl previous")'')
          ];
        }

        {
          _args = [
            "XF86AudioStop"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl stop")'')
          ];
        }


        # Window management

        {
          _args = [
            "SUPER + Q"
            (lib.generators.mkLuaInline ''hl.dsp.window.close()'')
          ];
        }

        {
          _args = [
            "SUPER + SPACE"
            (lib.generators.mkLuaInline ''hl.dsp.window.float({ action = "toggle" })'')
          ];
        }

        {
          _args = [
            "SUPER + SHIFT + SPACE"
            (lib.generators.mkLuaInline ''hl.dsp.focus({ last = true })'')
          ];
        }

        {
          _args = [
            "SUPER + F"
            (lib.generators.mkLuaInline ''hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })'')
          ];
        }


        # Focus

        {
          _args = [
            "SUPER + H"
            (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "l" })'')
          ];
        }

        {
          _args = [
            "SUPER + J"
            (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "d" })'')
          ];
        }

        {
          _args = [
            "SUPER + K"
            (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "u" })'')
          ];
        }

        {
          _args = [
            "SUPER + L"
            (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "r" })'')
          ];
        }


        # Resize

        {
          _args = [
            "SUPER + SHIFT + H"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("hyprctl dispatch resizeactive -5% 0")'')
          ];
        }

        {
          _args = [
            "SUPER + SHIFT + L"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("hyprctl dispatch resizeactive 5% 0")'')
          ];
        }

        {
          _args = [
            "SUPER + SHIFT + J"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 5%")'')
          ];
        }

        {
          _args = [
            "SUPER + SHIFT + K"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -5%")'')
          ];
        }


        # Master / stack

        {
          _args = [
            "SUPER + CTRL + H"
            (lib.generators.mkLuaInline ''hl.dsp.layout("swapprev")'')
          ];
        }

        {
          _args = [
            "SUPER + CTRL + L"
            (lib.generators.mkLuaInline ''hl.dsp.layout("swapnext")'')
          ];
        }

        {
          _args = [
            "SUPER + CTRL + K"
            (lib.generators.mkLuaInline ''hl.dsp.layout("rollprev")'')
          ];
        }

        {
          _args = [
            "SUPER + CTRL + J"
            (lib.generators.mkLuaInline ''hl.dsp.layout("rollnext")'')
          ];
        }


        # Screenshots

        {
          _args = [
            "SUPER + SHIFT + S"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("grimblast save area ~/Pictures/Screenshots/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png && grimblast copy area")'')
          ];
        }

        {
          _args = [
            "Print"
            (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("grimblast save screen ~/Pictures/Screenshots/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png && grimblast copy screen")'')
          ];
        }


        # Workspace binds

        {
          _args = [
            "SUPER + 1"
            (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = 1 })'')
          ];
        }

        {
          _args = [
            "SUPER + 2"
            (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = 2 })'')
          ];
        }

        {
          _args = [
            "SUPER + 3"
            (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = 3 })'')
          ];
        }

        {
          _args = [
            "SUPER + 4"
            (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = 4 })'')
          ];
        }

        {
          _args = [
            "SUPER + 5"
            (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = 5 })'')
          ];
        }

        {
          _args = [
            "SUPER + 6"
            (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = 6 })'')
          ];
        }

        {
          _args = [
            "SUPER + 7"
            (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = 7 })'')
          ];
        }

        {
          _args = [
            "SUPER + 8"
            (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = 8 })'')
          ];
        }

        {
          _args = [
            "SUPER + 9"
            (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = 9 })'')
          ];
        }

        {
          _args = [
            "SUPER + 0"
            (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = 10 })'')
          ];
        }


        # Move to workspace

        {
          _args = [
            "SUPER + SHIFT + 1"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 1 })'')
          ];
        }

        {
          _args = [
            "SUPER + SHIFT + 2"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 2 })'')
          ];
        }

        {
          _args = [
            "SUPER + SHIFT + 3"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 3 })'')
          ];
        }

        {
          _args = [
            "SUPER + SHIFT + 4"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 4 })'')
          ];
        }

        {
          _args = [
            "SUPER + SHIFT + 5"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 5 })'')
          ];
        }

        {
          _args = [
            "SUPER + SHIFT + 6"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 6 })'')
          ];
        }

        {
          _args = [
            "SUPER + SHIFT + 7"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 7 })'')
          ];
        }

        {
          _args = [
            "SUPER + SHIFT + 8"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 8 })'')
          ];
        }

        {
          _args = [
            "SUPER + SHIFT + 9"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 9 })'')
          ];
        }

        {
          _args = [
            "SUPER + SHIFT + 0"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 10 })'')
          ];
        }


        # Silent move to workspace

        {
          _args = [
            "SUPER + CTRL + 1"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 1, follow = false })'')
          ];
        }

        {
          _args = [
            "SUPER + CTRL + 2"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 2, follow = false })'')
          ];
        }

        {
          _args = [
            "SUPER + CTRL + 3"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 3, follow = false })'')
          ];
        }

        {
          _args = [
            "SUPER + CTRL + 4"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 4, follow = false })'')
          ];
        }

        {
          _args = [
            "SUPER + CTRL + 5"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 5, follow = false })'')
          ];
        }

        {
          _args = [
            "SUPER + CTRL + 6"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 6, follow = false })'')
          ];
        }

        {
          _args = [
            "SUPER + CTRL + 7"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 7, follow = false })'')
          ];
        }

        {
          _args = [
            "SUPER + CTRL + 8"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 8, follow = false })'')
          ];
        }

        {
          _args = [
            "SUPER + CTRL + 9"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 9, follow = false })'')
          ];
        }

        {
          _args = [
            "SUPER + CTRL + 0"
            (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = 10, follow = false })'')
          ];
        }
      ];

      # Startup
      on = {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline ''
            function()
              hl.exec_cmd("dbus-update-activation-environment --systemd DISPLAY HYPRLAND_INSTANCE_SIGNATURE WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")
            end
          '')
        ];
      };
    };
  };
}
