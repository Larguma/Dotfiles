{ ... }:

{
  imports = [
    ./hyprland-environment.nix
    ./hyprpaper.nix
    ./hyprlock.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      monitor = [
        "eDP-1, 1920x1080, 0x0, 1"
        "HDMI-A-1, preferred, -1920x0, 1"
      ];

      exec-once = [
        "waybar"
        "iwgtk -i"
        "seafile-applet"
      ];

      input = {
        kb_layout = "ch";
        kb_variant = "fr";

        follow_mouse = 1;
        special_fallthrough = true;
        accel_profile = "adaptive";

        touchpad = {
          natural_scroll = "no";
          drag_lock = false;
          disable_while_typing = true;
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      device = [
        {
          name = "logitech-mx-anywhere-3";
          sensitivity = -0.4;
        }

        {
          name = "logitech-mx-anywhere-3-1";
          sensitivity = -0.4;
        }
      ];

      misc = {
        enable_swallow = true;
        swallow_regex = "^(kitty)$";
        disable_hyprland_logo = true;
      };

      cursor = {
        inactive_timeout = 3;
        zoom_factor = 1; # changed by scripts/zoom_in.sh and scripts/zoom_out.sh TODO
      };

      general = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 2;
        gaps_out = 4;
        border_size = 0;
        "col.active_border" = "rgba(cba6f7cc) rgba(89b4facc) 45deg";
        "col.inactive_border" = "rgba(7f849ccc) rgba(45475acc) 45deg";

        layout = "dwindle";
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        rounding = 15;
        active_opacity = 0.98;
        inactive_opacity = 0.9;
        fullscreen_opacity = 1;
      };

      animations = {
        enabled = "yes";

        bezier = [
          "myBezier, 0, 0, 0, 0"
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
          "linear, 0.0, 0.0, 1.0, 1.0"
        ];

        animation = [
          "border, 1, 10, default"
          "borderangle, 1, 100, linear, loop"
          "windows, 1, 2, myBezier, slide"
          "windowsOut, 1, 2, myBezier, popin 20%"
          "fade, 1, 2, myBezier"
          "workspaces, 1, 2, myBezier, slidevert"
        ];
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = "yes"; # you probably want this
      };

      gestures = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = "on";
        workspace_swipe_invert = false;
      };

      # ====================
      # Rules
      # ====================

      # Example windowrule v1
      #windowrule = unset,^(firefox)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

      windowrulev2 = [
        "float,class:^(blueman-manager)$"
        "float,class:^(nemo)"
        "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "float,class:^(zenity)$"
        "float,class:^([Yy]ad)$"
        "float,class:^(com.cisco.anyconnect.gui)$"
        "float,class:^(org.prismlauncher.PrismLauncher)$"
        "float,class:^(org.twosheds.iwgtk)$"
        "float,class:^(com.saivert.pwvucontrol)$"
        "move onscreen cursor -50% 0% float, class:^(galendae)$"

        "float,class:^(xdg-desktop-portal-gtk)$"
        "float,class:^(steam)$"
        "float,class:^(calibre)"
        "float,title:^([Oo]pen)"
        "float,title:^(feh)"
        "float,class:^(org.gnome.FileRoller)"
        "bordersize 2, floating:1"

        "forcergbx,floating:1"

        "float,class:^(org.kde.*)"
        "size 1000 600,class:^(org.kde.*)"
        "pseudo,class:^(org.kde.*)"
        "center 1,class:^(org.kde.*)"

        "size 1000 600,class:^(kitty)"
        "float,class:^(kitty)"
        "center 1,class:^(kitty)$ # moves kitty to the center of the cursor"

        "float,title:^(Bitwarden - Vivaldi)$"
        "size 350 400,title:^(Bitwarden - Vivaldi)$"

        "workspace special:magic, class:^(kitty)$"
        "workspace 2, class:^([Vv]ivaldi)"
        "workspace 3, class:^(Code)$"
        "workspace 3, class:^(code-url-handler)$"
        "workspace 4, class:^(obsidian)$"
        "workspace 9, class:^(Spotify)$"
        "workspace 10, class:^(vesktop)$"

        "suppressevent maximize, class:.*"
      ];

      # ====================
      # Binds
      # ====================

      "$term" = "kitty";
      "$mainMod" = "SUPER";
      "$scriptsDir" = "~/.dotfiles/scripts";

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      # Apps
      bind = [
        "$mainMod, return, exec, $term"
        "$mainMod, E, exec, nemo"
        "$mainMod, W, exec, vivaldi"
        "$mainMod, period, exec, code ~/.dotfiles"
        "CONTROL SHIFT, ESCAPE, exec, $scriptsDir/top_launch.sh"

        # rofi
        "ALT, SPACE, exec, rofi -show drun"
        "$mainMod, C, exec, rofi -show calc -modi calc -no-show-match -no-sort -no-persist-history -automatic-save-to-history"
        "$mainMod, V, exec, rofi -modi clipboard:~/.dotfiles/scripts/cliphist-rofi-img.sh -show clipboard -show-icons"

        # Workflow
        "$mainMod, SPACE, togglefloating, "
        "$mainMod, J, togglesplit,"
        "$mainMod, F, fullscreen,"
        "$mainMod, Q, killactive,"
        "$mainMod, L, exec, hyprlock"
        "$mainMod, ESCAPE, exec, wlogout"
        "$mainMod, P, pseudo, # dwindle"

        ", PRINT, exec, hyprshot -m region --clipboard-only"
        "$mainMod, PRINT, exec, hyprshot -m region -o ~/Pictures/Screenshot"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Move windows with mainMod + arrows
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"

        # Special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
        "$mainMod SHIFT ALT, 1, movetoworkspace, 1"
        "$mainMod SHIFT ALT, 2, movetoworkspace, 2"
        "$mainMod SHIFT ALT, 3, movetoworkspace, 3"
        "$mainMod SHIFT ALT, 4, movetoworkspace, 4"
        "$mainMod SHIFT ALT, 5, movetoworkspace, 5"
        "$mainMod SHIFT ALT, 6, movetoworkspace, 6"
        "$mainMod SHIFT ALT, 7, movetoworkspace, 7"
        "$mainMod SHIFT ALT, 8, movetoworkspace, 8"
        "$mainMod SHIFT ALT, 9, movetoworkspace, 9"
        "$mainMod SHIFT ALT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e-1"
        "$mainMod, mouse_up, workspace, e+1"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
    };
  };

  home.file.".config/hypr/colors".text = ''
    $rosewaterAlpha = fff5e0dc
    $flamingoAlpha  = fff2cdcd
    $pinkAlpha      = fff5c2e7
    $mauveAlpha     = ffcba6f7
    $redAlpha       = fff38ba8
    $maroonAlpha    = ffeba0ac
    $peachAlpha     = fffab387
    $yellowAlpha    = fff9e2af
    $greenAlpha     = ffa6e3a1
    $tealAlpha      = ff94e2d5
    $skyAlpha       = ff89dceb
    $sapphireAlpha  = ff74c7ec
    $blueAlpha      = ff89b4fa
    $lavenderAlpha  = ffb4befe

    $textAlpha      = ffcdd6f4
    $subtext1Alpha  = ffbac2de
    $subtext0Alpha  = ffa6adc8

    $overlay2Alpha  = ff9399b2
    $overlay1Alpha  = ff7f849c
    $overlay0Alpha  = ff6c7086

    $surface2Alpha  = ff585b70
    $surface1Alpha  = ff45475a
    $surface0Alpha  = ff313244

    $baseAlpha      = ff1e1e2e
    $mantleAlpha    = ff181825
    $crustAlpha     = ff11111b

    $rosewater = 0xfff5e0dc
    $flamingo  = 0xfff2cdcd
    $pink      = 0xfff5c2e7
    $mauve     = 0xffcba6f7
    $red       = 0xfff38ba8
    $maroon    = 0xffeba0ac
    $peach     = 0xfffab387
    $yellow    = 0xfff9e2af
    $green     = 0xffa6e3a1
    $teal      = 0xff94e2d5
    $sky       = 0xff89dceb
    $sapphire  = 0xff74c7ec
    $blue      = 0xff89b4fa
    $lavender  = 0xffb4befe

    $text      = 0xffcdd6f4
    $subtext1  = 0xffbac2de
    $subtext0  = 0xffa6adc8

    $overlay2  = 0xff9399b2
    $overlay1  = 0xff7f849c
    $overlay0  = 0xff6c7086

    $surface2  = 0xff585b70
    $surface1  = 0xff45475a
    $surface0  = 0xff313244

    $base      = 0xff1e1e2e
    $mantle    = 0xff181825
    $crust     = 0xff11111b
  '';
}
