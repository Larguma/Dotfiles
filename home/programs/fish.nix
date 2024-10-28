{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellAliases = {
      l = "eza -1 --group-directories-first";
      ls = "eza -l --group-directories-first";
      lt = "eza -lT --group-directories-first";
      ll = "eza -la --group-directories-first";

      gitconfig = "git config user.name 'Larguma' && git config user.email 'larguma@hotmail.fr'";

      yy = "sudo nix flake update --flake ~/.dotfiles && sudo nixos-rebuild switch --flake ~/.dotfiles/.#warp --upgrade-all && nix store diff-closures /run/*-system";
      rb = "sudo nixos-rebuild switch --flake ~/.dotfiles/.#warp && nix store diff-closures /run/*-system";
      delme = "sudo nix-collect-garbage -d";
    };
    plugins = [
      {
        name = "tide";
        src = pkgs.fetchFromGitHub {
          owner = "IlanCosman";
          repo = "tide";
          rev = "a34b0c2809f665e854d6813dd4b052c1b32a32b4";
          sha256 = "sha256-ZyEk/WoxdX5Fr2kXRERQS1U1QHH3oVSyBQvlwYnEYyc=";
        };
      }
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge;
      }
      {
        name = "plugin-sudope";
        src = pkgs.fishPlugins.plugin-sudope;
      }
      {
        name = "pisces";
        src = pkgs.fishPlugins.pisces;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done;
      }
      {
        name = "fish-you-should-use";
        src = pkgs.fishPlugins.fish-you-should-use;
      }
    ];
  };
}
