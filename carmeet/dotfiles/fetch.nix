{ inputs, ... }: {
  imports = [
    inputs.areofyl-fetch.homeManagerModules.default
  ];
  programs.fetch = {
    enable = true;
    labelColor = "magenta";
    info = [
      "os"
      "host"
      "kernel"
      "uptime"
      "packages"
      "shell"
      "wm"
      "theme"
      "icons"
      "font"
      "terminal"
      "display"
      "cpu"
      "gpu"
      "disk"
      "memory"
      "battery"
      "locale"
      "colors"
    ];
    speed = 1.0;
    spin = "xy";
  };
}
