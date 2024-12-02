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
      seafile-client

      wl-clipboard
      iwgtk
      nixd
      nixfmt-rfc-style

      (nerdfonts.override {
        fonts = [
          "CascadiaCode"
          "Noto"
        ];
      })

      wget
      curl
      git
      pwvucontrol
      eza # ls replacment
      btop

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

  programs.home-manager.enable = true;
  programs.nix-index.enable = true;

  home.stateVersion = "24.11";
}
