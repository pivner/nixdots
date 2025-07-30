{ ... }: {

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = false;
        hide_cursor = true;
      };
      background = [{
        path = "/etc/nixos/splash/rosepinelogin.png";
      }];
      label = [{
        text = "cmd[update:1000] echo \"<span>$(date '+%A, %d %B')</span>\"";
        font_size = 30;
        position = "0, 200";
        halign = "center";
        valign = "center";
      }];
      input-field = [
        {
          size = "290, 60";
          outer_color = "#2e3440";
          inner_color = "#3e8fb055";
          font_color = "#3e8fb0";
          outline_thickness = 2;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.35; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          rounding = -1;
          hide_input = false;
          position = "0, -140";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
