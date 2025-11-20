{...}: let
  monitor_name = "eDP-1";

  screenshotCommand = "flameshot gui";
  ocrCommand = "screenshot-ocr.sh";
  sciName = import ../../../values/sci-name.nix;
in {
  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
    settings = {
      monitor = "${monitor_name},preferred,auto,auto";
      xwayland = {
        force_zero_scaling = true;
      };
      "$mod" = "SUPER";
      bind = [
        "$mod,T,exec,kitty" # Run `kitty`.
        ",F1,exec,kitty" # Run `kitty`.
        "$mod,P,exec,hyprlock" # Lock.
        "ALT,SPACE,exec,fuzzel" # Run `fuzzel`.
        # Run area screenshot.
        "$mod,S,exec,${screenshotCommand}"
        ",Print,exec,${screenshotCommand}"
        # Run OCR screenshot.
        "$mod,O,exec,${ocrCommand}"
        "$mod,N,exec,neovide" # Run `Neovide`.
        "$mod,E,exec,nemo" # Run `Nemo`.
        "$mod,Q,killactive" # Kill current process.
        # Move focus.
        "$mod,H,movefocus,l"
        "$mod,J,movefocus,d"
        "$mod,K,movefocus,u"
        "$mod,L,movefocus,r"
        # Switch workspace.
        "$mod,period,workspace,e+1"
        "$mod,comma,workspace,e-1"
        "$mod,1,workspace,1"
        "$mod,2,workspace,2"
        "$mod,3,workspace,3"
        "$mod,4,workspace,4"
        "$mod,5,workspace,5"
        "$mod,6,workspace,6"
        "$mod,7,workspace,7"
        "$mod,8,workspace,8"
        "$mod,9,workspace,9"
        "$mod,TAB,exec,hyprctl dispatch togglespecialworkspace"
        # Move the window to workspace.
        "$mod,bracketright,movetoworkspace,+1"
        "$mod,bracketleft,movetoworkspace,-1"
        # Make the window full screen.
        "$mod,F,fullscreen,0"
        # Toggle float window.
        "$mod,SPACE,togglefloating"
        # Toupad operations.
        "ALT,T,exec,disable_touchpad.sh"
        "ALT_SHIFT,T,exec,enable_touchpad.sh"
        # Key binds of `playerctl`.
        "CTRL_ALT,SPACE,exec,playerctl play-pause"
        "CTRL_ALT,N,exec,playerctl next"
        "CTRL_ALT,P,exec,playerctl previous"
      ];
      bindm = [
        "$mod,mouse:272,movewindow" # Move window.
        "$mod, mouse:273,resizewindow" # Resize window.
      ];
      bindl = [
        # Volume control.
        ",XF86AudioRaiseVolume,exec,pamixer -i 5"
        ",XF86AudioLowerVolume,exec,pamixer -d 5"
        ",XF86AudioMute,exec,pamixer --toggle-mute"
        # Brightness control.
        ",XF86MonBrightnessUp,exec, brightnessctl set +5%"
        ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
      ];
      exec-once = [
        "fcitx5-remote -r"
        "fcitx5 -d --replace &"
        "fcitx5-remote -r"
        "hyprpaper"
        "disable_touchpad.sh"
        "thunderbird"
        "keepassxc"
        "strawberry"
        "random_wallpaper.sh"
        "syncthing --no-browser"
        sciName
      ];
      general = {
        border_size = 3;
        gaps_in = 8;
        gaps_out = 14;
        "col.active_border" = "rgba(5e9bf388)";
        "col.inactive_border" = "rgba(ffffff22)";
      };
      decoration = {
        active_opacity = 1.0;
        inactive_opacity = 0.96;
        fullscreen_opacity = 1.0;
        rounding = 12;
        blur = {
          enabled = true;
          size = 11;
          passes = 3;
          ignore_opacity = false;
          new_optimizations = true;
          noise = 0.03;
          contrast = 0.9;
          brightness = 1.0;
          vibrancy = 0.15;
          vibrancy_darkness = 0.1;
        };
        shadow = {
          enabled = true;
          range = 18;
          render_power = 3;
          offset = "0, 4";
          scale = 0.97;
          ignore_window = false;
          color = "rgba(00000066)";
        };
      };
      input = {
        numlock_by_default = true;
      };
      cursor = {
        inactive_timeout = 4;
        hide_on_key_press = true;
      };
      windowrulev2 = [
        "workspace special, class:^(thunderbird)$|.*strawberry.*|.*keepassxc.*|.*${sciName}.*"
        "rounding 12, class:.* "
      ];
      ecosystem = {
        no_donation_nag = true;
        no_update_news = true;
      };
      bezier = [
        "macReal, 0.26, 0.06, 0.22, 1.00"
      ];
      animation = [
        "windowsIn,1,3.8,macReal,popin 95%"
        "windowsOut,1,3.0,macReal,popin"
        "windows,1,4.5,macReal,slide"
        "windowsMove,1,4.5,macReal,slide"
        "workspaces,1,5.2,macReal,slide"
        "specialWorkspace,1,5,macReal,slidevert"
        "fade,1,6,macReal"
        "fadeDim,0"
        "layers,1,4.5,macReal,slide"
        "border,1,8,default"
        "borderangle,0"
      ];
    };
  };

  home.file.".local/bin/disable_touchpad.sh" = {
    text = ''
      #!/usr/bin/env bash
      hyprctl keyword "device[uniw0001:00-093a:0274-touchpad]:enabled" false
      notify-send "Touchpad Disabled!"
    '';
    executable = true;
  };

  home.file.".local/bin/enable_touchpad.sh" = {
    text = ''
      #!/usr/bin/env bash
      hyprctl keyword "device[uniw0001:00-093a:0274-touchpad]:enabled" true
      notify-send "Touchpad Enabled!"
    '';
    executable = true;
  };
}
