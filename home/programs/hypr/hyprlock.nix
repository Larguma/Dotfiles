{ ... }:
{
  programs.hyprlock.enable = true;
  programs.hyprlock.settings = {
    general = {
      no_fade_in = false;
      grace = 0;
      disable_loading_bar = true;
    };

    background = [
      {
        monitor = "";
        path = "~/.dotfiles/wallpaper/ghostblad_burning_rose.png";
        blur_size = 0; # 4
        blur_passes = 0; # 3
        noise = 1.17e-2;
        contrast = 1.3;
        brightness = 0.8;
        vibrancy = 0.21;
        vibrancy_darkness = 0.0;
      }
    ];

    input-field = [
      {
        monitor = "";
        size = "250, 60";
        outline_thickness = 2;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8;
        dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0;
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.5)";
        font_color = "rgb(200, 200, 200)";
        fade_on_empty = true;
        placeholder_text = "<i><span foreground='##cdd6f4'>Password...</span></i>";
        hide_input = false;
        position = "0, -120";
        halign = "center";
        valign = "center";
      }
    ];

    label = [
      {
        monitor = "";
        text = "cmd[update:1000] echo '$TIME'";
        color = "rgba(255, 255, 255, 0.6)";
        font_size = 120;
        font_family = "NotoSans Nerd Font ExtraBold";
        position = "0, -300";
        halign = "center";
        valign = "top";
      }
    ];
  };
}
