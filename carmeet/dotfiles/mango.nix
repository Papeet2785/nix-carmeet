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
      bordercolor = "0x458588aa";
      border_radius = 12;
      bind = [
        "SUPER, Shift, r, reload_config"
        "Super, d, spawn, noctalia msg panel-toggle launcher"
        "Super, Shift, c, spawn, foot -e hx ~/nix-carmeet"
        "Super, c, spawn, foot -e hx ~"
        "Super, b, spawn, firefox"
        "Super, Shift, b, spawn, google-chrome"
        "Super, e, spawn, nautilus"
        "Super, Return, spawn, foot"
        "Super, Escape, spawn, foot -e btop"
      ];
    };
  };
}
