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
    interactiveShellInit = ''
      fish_add_path --global --prepend "$HOME/.cargo/bin"
    '';
  };
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
