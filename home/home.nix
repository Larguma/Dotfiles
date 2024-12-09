{
  hyprland,
  pkgs,
  ...
}:
{

  imports = [
    hyprland.homeManagerModules.default
    ./programs
    ./catppuccin.nix
  ];

  home = {
    username = "larguma";
    homeDirectory = "/home/larguma";
  };

  fonts.fontconfig.enable = true;
  gtk.enable = true;

  home.packages = (
    with pkgs;
    [
      obsidian
      vesktop
      vscode
      vivaldi
      onlyoffice-bin
      nemo-with-extensions
      nemo-fileroller
      wireguard-tools

      wl-clipboard
      iwgtk
      nixd
      nixfmt-rfc-style
      nerd-fonts.noto
      nerd-fonts.caskaydia-cove

      wget
      curl
      git
      pwvucontrol
      eza # ls replacment
      btop
      brightnessctl

      hyprshot
      hyprcursor
      hyprls
    ]
  );

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  services.blueman-applet.enable = true;
  services.cliphist.enable = true;
  services.pass-secret-service.enable = true;

  programs.home-manager.enable = true;
  programs.nix-index.enable = true;
  programs.java.enable = true;

  home.stateVersion = "24.11";
}
