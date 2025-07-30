{ pkgs, ... }: {
  home.packages = with pkgs; [
    grim
    slurp
    brightnessctl
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      exec-once = [
        "hyprctl setcursor BreezeX-RosePine-Linux 24"
      ];
      input = {
        kb_layout = "us";
        accel_profile = "flat";
      };
      general = {
        "$mainMod" = "SUPER";
        "col.active_border" = "0xffea9a97"; #Rose
        "col.inactive_border" = "0xff6e6a86"; #Muted
        layout = "dwindle";
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        no_border_on_floating = false;
        resize_on_border = true;
      };
      misc = {
        disable_splash_rendering = true;
        disable_hyprland_logo = true;
      };
      bind = [
        "$mainMod, Return, exec, kitty"
        "$mainMod, Q, exec, firefox"
        "$mainMod, R, exec, rofi -show drun"
        "ALT, Tab, exec, rofi -show window"
        "$mainMod, F, fullscreen, 1"
        "$mainMod, C, killactive,"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"

        "$mainMod SHIFT, S, exec, grim -g \"$(slurp -d)\" - | wl-copy"
        "$mainMod, L, exec, hyprlock"
        "$mainMod, MINUS, exec, brightnessctl s 25-"
        "$mainMod, EQUAL, exec, brightnessctl s +25"
        ", code:77, exec, i2ctransfer -f -y 0 w13@0x15 0x05 0x00 0x3d 0x03 0x06 0x00 0x07 0x00 0x0d 0x14 0x03 1 0xad"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
    extraConfig = ''
      $base	          = 0xff232136
      $surface        = 0xff2a273f
      $overlay        = 0xff393552
      $muted          = 0xff6e6a86
      $subtle         = 0xff908caa
      $text           = 0xffe0def4
      $love           = 0xffeb6f92
      $gold           = 0xfff6c177
      $rose           = 0xffea9a97
      $pine           = 0xff3e8fb0
      $foam           = 0xff9ccfd8
      $iris           = 0xffc4a7e7
      $highlightLow   = 0xff2a283e
      $highlightMed   = 0xff44415a
      $highlightHigh  = 0xff56526e

    '';
  };
}
