{ ... }:
{
  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 28;
      modules-right = [
        "hyprland/workspaces"
        "custom/space"
        "clock"
        "custom/space"
        "battery"
        "bluetooth"
        "wireplumber"
        "custom/notification"
        "tray"
      ];

      "custom/space" = {
        format = "|";
      };

      "battery" = {
        "states" = {
          "warning" = 20;
          "critical" = 10;
        };
        "format" = "{icon} {capacity}%";
        "format-charging" = " {capacity}%";
        "format-plugged" = "{capacity}%";
        "format-full" = " {capacity}%";
        "format-icons" = [
          " "
          " "
          " "
        ];
        "on-click" = "~/.dotfiles/scripts/bat-show-tlp.sh";
        "on-click-right" = "~/.dotfiles/scripts/bat-change-tlp.sh";
      };

      "clock" = {
        interval = 60;
        format = "{:%H:%M ~ %a %d.%m}";
        tooltip = false;
      };

      "hyprland/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        on-click = "activate";
      };

      "bluetooth" = {
        format = "";
        format-disabled = "";
        format-connected = " {num_connections}";
        tooltip-format = " {device_alias}";
        tooltip-format-connected = "{device_enumerate}";
        tooltip-format-enumerate-connected = " {device_alias}";
        on-click = "blueman-manager";
      };

      "wireplumber" = {
        format = "{icon}{volume}%";
        format-muted = " ";
        on-click = "pwvucontrol";
        on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        on-scroll-up = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
        on-scroll-down = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-";
        scroll-step = 1;
        format-icons = {
          headphone = " ";
          hands-free = " ";
          headset = " ";
          phone = " ";
          portable = " ";
          car = " ";
          default = [
            " "
            " "
            " "
          ];
        };
      };

      "custom/notification" = {
        format = "{icon} ";
        format-icons = {
          notification = "<span foreground='red'><sup></sup></span>";
          none = "";
          dnd-notification = "<span foreground='red'><sup></sup></span>";
          dnd-none = "";
          inhibited-notification = "<span foreground='red'><sup></sup></span>";
          inhibited-none = "";
          dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
          dnd-inhibited-none = "";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "sleep 0.15 && swaync-client -t -sw";
        on-click-right = "swaync-client -d -sw";
        escape = true;
      };
      "tray" = {
        icon-size = 15;
        spacing = 5;
      };
    };
  };

  programs.waybar.style = ''
    @define-color base #1e1e2e;
    @define-color mantle #181825;
    @define-color crust #11111b;

    @define-color text #cdd6f4;
    @define-color subtext0 #a6adc8;
    @define-color subtext1 #bac2de;

    @define-color surface0 #313244;
    @define-color surface1 #45475a;
    @define-color surface2 #585b70;

    @define-color overlay0 #6c7086;
    @define-color overlay1 #7f849c;
    @define-color overlay2 #9399b2;

    @define-color blue #89b4fa;
    @define-color lavender #b4befe;
    @define-color sapphire #74c7ec;
    @define-color sky #89dceb;
    @define-color teal #94e2d5;
    @define-color green #a6e3a1;
    @define-color yellow #f9e2af;
    @define-color peach #fab387;
    @define-color maroon #eba0ac;
    @define-color red #f38ba8;
    @define-color mauve #cba6f7;
    @define-color pink #f5c2e7;
    @define-color flamingo #f2cdcd;
    @define-color rosewater #f5e0dc;

    * {
      border: none;
      font-family: "CaskaydiaCove Nerd Font";
      font-weight: bold;
      font-size: 15px;
      min-height: 0px;
    }

    window#waybar {
      background: rgba(255, 255, 255, 0.0);
    }

    tooltip {
      background: @base;
      color: @text;
      border-radius: 20px;
      border-width: 0px;
    }

    #battery,
    #clock,
    #bluetooth,
    #wireplumber,
    #custom-notification,
    #custom-space,
    #workspaces,
    #tray {
      color: @text;
      background: rgba(30, 30, 46, 0.8);
      opacity: 1;
      padding: 0px;
      /* margin-top: 3px;
      margin-bottom: 2px */
    }

    #battery {
      color: @green;
      /* border-radius: 0px 20px 20px 0px; */
      border-left-width: 0px;
      padding-left: 4px;
      padding-right: 4px;
      /* margin-right: 6px; */
    }

    #clock {
      /* border-radius: 0px 0px 0px 100px; */
      padding-left: 4px;
      padding-right: 4px;
      /* margin-right: 6px; */
    }

    #workspaces {
      border-radius: 0px 0px 0px 100px;
      padding-left: 12px;
      padding-right: 4px;
      /* margin-left: 1px; */
    }

    #workspaces button {
      box-shadow: none;
      text-shadow: none;
      padding: 0px;
      border-radius: 20px;
      margin-top: 3px;
      margin-bottom: 3px;
      padding-left: 2px;
      padding-right: 2px;
      color: @text;
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.682);
    }

    #workspaces button.urgent {
      background: @red;
      color: @base;
      margin-left: 2px;
      margin-right: 2px;
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
    }

    #workspaces button.active {
      background: @text;
      color: @base;
      margin-left: 3px;
      margin-right: 3px;
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
    }

    #workspaces button:hover {
      background: @mauve;
      color: @base;
      padding-left: 2px;
      padding-right: 2px;
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
    }

    #bluetooth {
      color: @mauve;
      /* border-radius: 20px 0px 0px 20px; */
      /* margin-left: 6px; */
      padding-left: 4px;
      padding-right: 4px;
    }

    #wireplumber {
      padding-left: 4px;
      padding-right: 4px;
    }

    #tray {
      /* border-radius: 0px 20px 20px 0px; */
      padding-left: 4px;
      padding-right: 10px;
      /* margin-right: 5px; */
    }
  '';
}
