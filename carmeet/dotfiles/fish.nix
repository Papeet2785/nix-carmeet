{ ... }:
{
  programs.fish= {
    enable = true;
    shellAliases = {
      cp = "cp -i";
      mv = "mv -i";
      rm = "trash -v";
      mkdir = "mkdir -p";
      la = "ls -Alh";
      fetch = "fastfetch";
    };
     functions = {
      fish_greeting = "";
    };
  };
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = "$directory$character ";
    };
  };
  programs.fish.interactiveShellInit = ''
    nix-your-shell fish | source
  '';  
}
