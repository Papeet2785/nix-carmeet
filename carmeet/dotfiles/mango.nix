{ inputs, ... }: {
  imports = [
    inputs.mango.hmModules.mango
  ];
  wayland.windowManager.mango = {
    enable = true;
    settings = {
      animations = 1;
      animation_type_open = "zoom";
      animation_type_close = "slide";
      animation_duration_open = 200;
      animation_duration_close = 200;
      animation_curve = {
        open = "0.46,1.0,0.29,1";
        close = "0.46,1.0,0.29,1";
      };
      border_color = "0x458588aa";
      border_radius = 12;
      bind = [
        "SUPER, shift_l, r, reload_config"
        "SUPER, d, spawn, noctalia msg panel-toggle launcher"
        "SUPER, shift_l, c, spawn, foot -e hx ~/nix-carmeet"
        "SUPER, c, spawn, foot -e hx ~"
        "SUPER, b, spawn, firefox"
        "SUPER, shift_l, b, spawn, google-chrome"
        "SUPER, e, spawn, nautilus"
        "SUPER, Return, spawn, foot"
        "SUPER, Escape, spawn, foot -e btop"
      ];
    };
  };
}
