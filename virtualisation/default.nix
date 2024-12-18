{ pkgs, ... }:

{
  virtualisation = {
    docker.enable = true;
  };

  users.groups.docker.members = [ "larguma" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
