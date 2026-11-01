{ ... }: {
  programs.fish = {
    enable = true;
    shellAliases = {
      cp = "cp -i";
      mv = "mv -i";
      rm = "trash -v";
      mkdir = "mkdir -p";
      la = "ls -Alh";
    };
    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
  };
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
