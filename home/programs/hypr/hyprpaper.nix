{ ... }:
{
  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    ipc = "off";
    preload = [
      "~/.dotfiles/wallpaper/ghostblad_burning_rose.png"
    ];

    wallpaper = [
      ", ~/.dotfiles/wallpaper/ghostblad_burning_rose.png"
    ];
  };
}
