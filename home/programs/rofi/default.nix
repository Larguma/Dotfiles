{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      # HACK: temporary fix until ABI update
      (rofi-calc.override {
        rofi-unwrapped = rofi-wayland-unwrapped;
      })
    ];
    extraConfig = {
      modi = "drun";
      case-sensitive = false;
      filter = "";
      normalize-match = true;
      show-icons = true;
      icon-theme = "Papirus-Dark";
      drun-categories = "";
      drun-match-fields = "name,generic,exec,categories,keywords";
      drun-display-format = "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
      drun-show-actions = false;
      drun-url-launcher = "xdg-open";
    };
  };
}
