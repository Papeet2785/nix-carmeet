{ inputs, ... }: {
  imports = [
    inputs.areofyl-fetch.homeManagerModules.default
  ];
  programs.fetch = {
    enable = true;
    labelColor = "yellow";
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
      "cpu"
      "gpu"
      "memory"
      "battery"
    ];
    speed = 1.0;
    spin = "xy";
  };
}
