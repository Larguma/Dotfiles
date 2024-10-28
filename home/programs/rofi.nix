{ config, pkgs, ... }:
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
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        # /*****----- Global Properties -----*****/
        "*" = {
          font = "NotoSans Nerd Font 11";
          background = mkLiteral "#1e1e2e";
          background-alt = mkLiteral "#282839";
          foreground = mkLiteral "#cdd6f4";
          selected = mkLiteral "#cba6f7";
          active = mkLiteral "#a6e3a1";
          urgent = mkLiteral "#f38ba8";
        };

        # /*****----- Main Window -----*****/
        "window" = {
          transparency = "real";
          location = mkLiteral "center";
          anchor = mkLiteral "center";
          fullscreen = false;
          width = mkLiteral "50%";
          x-offset = mkLiteral "0px";
          y-offset = mkLiteral "-50px";

          enabled = true;
          border-radius = mkLiteral "7px";
          background-color = mkLiteral "@background";
          cursor = "default";
        };

        # /*****----- Main Box -----*****/
        "mainbox" = {
          enabled = true;
          spacing = mkLiteral "0px";
          background-color = mkLiteral "transparent";
          orientation = mkLiteral "vertical";
          children = mkLiteral "[ inputbar, listbox ]";
        };
        "listbox" = {
          spacing = mkLiteral "20px";
          padding = mkLiteral "20px";
          background-color = mkLiteral "transparent";
          orientation = mkLiteral "vertical";
          children = mkLiteral "[ message, listview ]";
        };

        # /*****----- Inputbar -----*****/
        "inputbar" = {
          enabled = true;
          spacing = mkLiteral "10px";
          padding = mkLiteral "40px 10px";
          background-image = mkLiteral "url('~/.dotfiles/wallpaper/rofi.jpg', width)";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
          orientation = "hotizontal";
          children = mkLiteral "[entry]";
        };
        "entry" = {
          enabled = true;
          expand = false;
          width = mkLiteral "300px";
          padding = mkLiteral "12px 16px";
          border-radius = mkLiteral "7px";
          background-color = mkLiteral "@background-alt";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "text";
          placeholder = "Search...";
          placeholder-color = mkLiteral "inherit";
        };

        # /*****----- Listview -----*****/
        "listview" = {
          enabled = true;
          columns = 2;
          lines = 10;
          cycle = true;
          dynamic = false;
          scrollbar = false;
          layout = mkLiteral "vertical";
          fixed-height = true;
          fixed-columns = false;

          spacing = mkLiteral "5px";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
          cursor = "default";
        };

        # /*****----- Elements -----*****/
        "element" = {
          enabled = true;
          padding = mkLiteral "4px";
          border-radius = mkLiteral "7px";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@foreground";
          cursor = mkLiteral "pointer";
        };
        "element normal.normal" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        "element normal.urgent" = {
          background-color = mkLiteral "@urgent";
          text-color = mkLiteral "@foreground";
        };
        "element normal.active" = {
          background-color = mkLiteral "@active";
          text-color = mkLiteral "@foreground";
        };
        "element selected.normal" = {
          background-color = mkLiteral "@selected";
          text-color = mkLiteral "@background";
        };
        "element selected.urgent" = {
          background-color = mkLiteral "@urgent";
          text-color = mkLiteral "@foreground";
        };
        "element selected.active" = {
          background-color = mkLiteral "@urgent";
          text-color = mkLiteral "@foreground";
        };
        "element-icon" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          size = mkLiteral "0px";
          cursor = mkLiteral "inherit";
        };
        "element-text" = {
          font = "NotoSansMono Nerd Font 11";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "inherit";
          padding = mkLiteral "0 0 0 20px";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
        };

        # /*****----- Message -----*****/
        "message" = {
          background-color = mkLiteral "transparent";
        };
        "textbox" = {
          padding = mkLiteral "12px";
          border-radius = mkLiteral "7px";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "@foreground";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
        };
        "error-message" = {
          padding = mkLiteral "12px";
          border-radius = mkLiteral "7px";
          background-color = mkLiteral "@background";
          text-color = mkLiteral "@foreground";
        };
      };
  };
}
