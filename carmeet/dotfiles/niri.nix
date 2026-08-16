{ config, pkgs, lib, inputs, ... }:
{
  programs.niri.settings = {
    spawn-at-startup = [
      { argv = [ "noctalia" "--daemon" ]; }
      { argv = [ "polkit-gnome-authentication-agent-1" ]; }
    ];
    prefer-no-csd = true;
    debug = {
      honor-xdg-activation-with-invalid-serial = true;
    };
    input = {
      keyboard = {
        xkb.layout = "us";
        repeat-rate = 50;
        repeat-delay = 250;
      };
      touchpad = {
        tap = true;
        natural-scroll = true;
        dwt = true;
        accel-speed = 1.0;
        accel-profile = "flat";
      };
      mouse = {
        accel-speed = 1.0;
        accel-profile = "flat";
      };
    };
    layout = {
      gaps = 10;
      border = {
        enable = true;
        active.color = "#83a598";
        inactive.color = "#d3869b";
        width = 4;
      };
      focus-ring = { enable = false; };
      preset-column-widths = [
        { proportion = 0.50; }
        { proportion = 1.00; }
      ];
      default-column-width = { proportion = 1.00; };
    };
    window-rules = [
      {
        geometry-corner-radius = {
          top-left = 12.0;
          top-right = 12.0;
          bottom-left = 12.0;
          bottom-right = 12.0;
        };
        clip-to-geometry = true;
        draw-border-with-background = true;
      }
      {
        matches = [
          { app-id = "dev.noctalia.Noctalia"; }
        ];
        open-floating = true;
        default-column-width = {
          fixed = 1080;
        };
        default-window-height = {
          fixed = 920;
        };
        geometry-corner-radius = {
          top-left = 12.0;
          top-right = 12.0;
          bottom-left = 12.0;
          bottom-right = 12.0;
        };
        clip-to-geometry = true;
        draw-border-with-background = true;
      }
    ];
    binds = {
      # Applications
      "Mod+Return".action.spawn = "ghostty";
      "Mod+Escape".action.spawn = [ "ghostty" "-e" "btop" ];
      "Mod+Tab".action.toggle-overview = {};
      "Mod+C".action.spawn = [ "ghostty" "-e" "hx" "~" ];
      "Mod+B".action.spawn = "google-chrome";
      "Mod+E".action.spawn = "nautilus";
      "Mod+R".action.spawn = [ "niri" "msg" "action" "load-config-file" ];
      # Noctalia
      "Mod+D".action.spawn-sh = "noctalia msg panel-toggle launcher";
      "Mod+V".action.spawn-sh = "noctalia msg panel-toggle clipboard";
      "Mod+N".action.spawn-sh = "noctalia msg panel-toggle control-center";
      "Mod+Comma".action.spawn-sh = "noctalia msg settings-toggle";
      "Control+Alt+Delete".action.spawn-sh = "noctalia msg panel-toggle session";
      "XF86AudioRaiseVolume".action.spawn-sh = "noctalia msg volume-up";
      "XF86AudioLowerVolume".action.spawn-sh = "noctalia msg volume-down";
      "XF86AudioMute".action.spawn-sh = "noctalia msg volume-mute";
      "XF86MonBrightnessUp".action.spawn-sh = "noctalia msg brightness-up";
      "XF86MonBrightnessDown".action.spawn-sh = "noctalia msg brightness-down";
      # Media
      "XF86AudioPlay".action.spawn = [ "playerctl" "play-pause" ];
      "XF86AudioNext".action.spawn = [ "playerctl" "next" ];
      "XF86AudioPrev".action.spawn = [ "playerctl" "previous" ];
      "XF86AudioStop".action.spawn = [ "playerctl" "stop" ];
      "Mod+W".action.spawn-sh = "noctalia msg panel-toggle wallpaper";
      # Window management
      "Mod+Q".action.close-window = {};
      "Mod+Space".action.toggle-window-floating = {};
      "Mod+Shift+Space".action.switch-focus-between-floating-and-tiling = {};
      "Mod+Shift+F".action.switch-preset-column-width = {};
      "Mod+F".action.fullscreen-window = {};
      # Focus
      "Mod+H".action.focus-column-left = {};
      "Mod+J".action.focus-window-down = {};
      "Mod+K".action.focus-window-up = {};
      "Mod+L".action.focus-column-right = {};
      # Move windows
      "Mod+Shift+H".action.set-column-width = "-10%";
      "Mod+Shift+L".action.set-column-width = "+10%";
      "Mod+Shift+J".action.set-window-height = "+10%";
      "Mod+Shift+K".action.set-window-height = "-10%";
      "Mod+Control+H".action.consume-or-expel-window-left = {};
      "Mod+Control+L".action.consume-or-expel-window-right = {};
      "Mod+Control+K".action.move-window-up = {};
      "Mod+Control+J".action.move-window-down = {};
      # Screenshots
      "Mod+Shift+S".action.spawn = [ "noctalia" "msg" "screenshot-region" ];
      # Workspaces
      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+5".action.focus-workspace = 5;
      "Mod+6".action.focus-workspace = 6;
      "Mod+7".action.focus-workspace = 7;
      "Mod+8".action.focus-workspace = 8;
      "Mod+9".action.focus-workspace = 9;
      "Mod+0".action.focus-workspace = 10;
      "Mod+Shift+1".action.move-window-to-workspace = [ { focus = false; } 1 ];
      "Mod+Shift+2".action.move-window-to-workspace = [ { focus = false; } 2 ];
      "Mod+Shift+3".action.move-window-to-workspace = [ { focus = false; } 3 ];
      "Mod+Shift+4".action.move-window-to-workspace = [ { focus = false; } 4 ];
      "Mod+Shift+5".action.move-window-to-workspace = [ { focus = false; } 5 ];
      "Mod+Shift+6".action.move-window-to-workspace = [ { focus = false; } 6 ];
      "Mod+Shift+7".action.move-window-to-workspace = [ { focus = false; } 7 ];
      "Mod+Shift+8".action.move-window-to-workspace = [ { focus = false; } 8 ];
      "Mod+Shift+9".action.move-window-to-workspace = [ { focus = false; } 9 ];
      "Mod+Shift+0".action.move-window-to-workspace = [ { focus = false; } 10 ];
      "Mod+Ctrl+1".action.move-window-to-workspace = 1;
      "Mod+Ctrl+2".action.move-window-to-workspace = 2;
      "Mod+Ctrl+3".action.move-window-to-workspace = 3;
      "Mod+Ctrl+4".action.move-window-to-workspace = 4;
      "Mod+Ctrl+5".action.move-window-to-workspace = 5;
      "Mod+Ctrl+6".action.move-window-to-workspace = 6;
      "Mod+Ctrl+7".action.move-window-to-workspace = 7;
      "Mod+Ctrl+8".action.move-window-to-workspace = 8;
      "Mod+Ctrl+9".action.move-window-to-workspace = 9;
      "Mod+Ctrl+0".action.move-window-to-workspace = 10;
    };
  };
}
