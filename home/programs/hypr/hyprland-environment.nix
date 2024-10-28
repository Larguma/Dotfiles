{ ... }:

{
  home = {
    sessionVariables = {
      EDITOR = "micro";
      BROWSER = "vivaldi";
      TERMINAL = "kitty";

      XCURSOR_SIZE = "24";
      GDK_BACKEND = "wayland,x11,*";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";

      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_QPA_PLATFORMTHEME = "qt5ct";

      # Dev
      MODRINTH_TOKEN = "mrp_IpCXvwP4CKOu7T1Mv3TITSdTmBGnfz5NG3DFbWnNNLwxVpylxiUTMzZLVcav";
      PATH = "$PATH:$HOME/.dotnet/tools:$HOME/go/bin";
    };
  };
}
