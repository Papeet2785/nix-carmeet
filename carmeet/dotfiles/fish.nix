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
      nixbuild = "cd nix-carmeet && sudo nixos-rebuild switch --flake .#myMachine";
      nixupgrade = "cd nix-carmeet && nix flake update && sudo nixos-rebuild switch --flake .#myMachine";
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
}
