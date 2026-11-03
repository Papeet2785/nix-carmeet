{ inputs, ... }: {
  imports = [
    inputs.mango.hmModules.mango
  ];
  wayland.windowManager.mango = {
    enable = true;
    settings = {
      exec_once = [
        "noctalia --daemon"
        "polkit-gnome-authentication-agent-1"
        "xwayland-satellite"
      ];
      animations = 1;
      animation_type_open = "zoom";
      animation_type_close = "slide";
      animation_duration_open = 200;
      animation_duration_close = 200;
      animation_curve = {
        open = "0.46,1.0,0.29,1";
        close = "0.46,1.0,0.29,1";
      };
      border_radius = 12;
      border_px = 3;
      focus_color = "0x458588ff";
      border_color = "0x3c3836ff";
      root_color = "0x1d2021ff";
      enable_border_resize = 1;
      border_resize_size = 10;
      gap_inner_horizontal = 10;
      gap_inner_vertical = 10;
      gap_outer_horizontal = 10;
      gap_outer_vertical = 10;
      new_is_master = 1;
      default_master_count = 1;
      default_master_factor = 0.5;
      circle_layout = "tile,scroller";
      tag_num = 10;
      tag_rule = [
        "id:*,layout_name:tile"
      ];
      scroller_proportion_preset = "0.5,0.7,0.85,1.0";
      scroller_default_proportion = 1.0;
      scroller_focus_center = 1;
      xkb_rules_layout = "us";
      repeat_rate = 50;
      repeat_delay = 250;
      tap_to_click = 1;
      trackpad_natural_scrolling = 1;
      trackpad_disable_while_typing = 1;
      trackpad_accel_speed = 1.0;
      trackpad_accel_profile = 1;
      mouse_accel_speed = 1.0;
      mouse_accel_profile = 1;
      gesture_live = 1;
      gesturebind = [
        "NONE,right,4,viewtoleft"
        "NONE,left,4,viewtoright"
        "NONE,left,3,focusdir,left"
        "NONE,right,3,focusdir,right"
      ];
      bind = [
        "SUPER,Return,spawn,foot"
        "SUPER,Escape,spawn,foot -e btop"
        "SUPER,c,spawn,foot -e hx ~"
        "SUPER+SHIFT,c,spawn,foot -e hx ~/nix-carmeet"
        "SUPER,b,spawn,firefox"
        "SUPER+SHIFT,b,spawn,google-chrome"
        "SUPER,e,spawn,nautilus"
        "SUPER+SHIFT,r,reload_config"
        "SUPER,d,spawn,noctalia msg panel-toggle launcher"
        "SUPER,v,spawn,noctalia msg panel-toggle clipboard"
        "SUPER,n,spawn,noctalia msg panel-toggle control-center"
        "SUPER,Comma,spawn,noctalia msg settings-toggle"
        "CTRL+ALT,Delete,spawn,noctalia msg panel-toggle session"
        "SUPER,w,spawn,noctalia msg panel-toggle wallpaper"
        "SUPER,Tab,toggleoverview"
        "SUPER+ALT,l,switch_layout"
        "SUPER,q,killclient"
        "SUPER,space,togglefloating"
        "SUPER+SHIFT,f,togglefullscreen"
        "SUPER,h,focusdir,left"
        "SUPER,j,focusdir,down"
        "SUPER,k,focusdir,up"
        "SUPER,l,focusdir,right"
        "SUPER+SHIFT,h,setmfact,-0.05"
        "SUPER+SHIFT,l,setmfact,+0.05"
        "SUPER+ALT,h,resizewin,-30,0"
        "SUPER+ALT,l,resizewin,+30,0"
        "SUPER+ALT,j,resizewin,0,+30"
        "SUPER+ALT,k,resizewin,0,-30"
        "SUPER+CTRL,h,move_client,left"
        "SUPER+CTRL,j,move_client,down"
        "SUPER+CTRL,k,move_client,up"
        "SUPER+CTRL,l,move_client,right"
        "SUPER,f,switch_proportion_preset"
        "SUPER,1,view,1"
        "SUPER,2,view,2"
        "SUPER,3,view,3"
        "SUPER,4,view,4"
        "SUPER,5,view,5"
        "SUPER,6,view,6"
        "SUPER,7,view,7"
        "SUPER,8,view,8"
        "SUPER,9,view,9"
        "SUPER,0,view,10"
        "SUPER+SHIFT,1,tagsilent,1"
        "SUPER+SHIFT,2,tagsilent,2"
        "SUPER+SHIFT,3,tagsilent,3"
        "SUPER+SHIFT,4,tagsilent,4"
        "SUPER+SHIFT,5,tagsilent,5"
        "SUPER+SHIFT,6,tagsilent,6"
        "SUPER+SHIFT,7,tagsilent,7"
        "SUPER+SHIFT,8,tagsilent,8"
        "SUPER+SHIFT,9,tagsilent,9"
        "SUPER+SHIFT,0,tagsilent,10"
        "SUPER+CTRL,1,tag,1"
        "SUPER+CTRL,2,tag,2"
        "SUPER+CTRL,3,tag,3"
        "SUPER+CTRL,4,tag,4"
        "SUPER+CTRL,5,tag,5"
        "SUPER+CTRL,6,tag,6"
        "SUPER+CTRL,7,tag,7"
        "SUPER+CTRL,8,tag,8"
        "SUPER+CTRL,9,tag,9"
        "SUPER+CTRL,0,tag,10"
        "NONE,XF86AudioRaiseVolume,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        "NONE,XF86AudioLowerVolume,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        "NONE,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        "NONE,XF86MonBrightnessUp,spawn,brightnessctl set +5%"
        "NONE,XF86MonBrightnessDown,spawn,brightnessctl set 5%-"
        "NONE,XF86AudioPlay,spawn,playerctl play-pause"
        "NONE,XF86AudioNext,spawn,playerctl next"
        "NONE,XF86AudioPrev,spawn,playerctl previous"
        "NONE,XF86AudioStop,spawn,playerctl stop"
      ];
    };
  };
}
