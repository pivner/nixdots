{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        exclusive = true;
        fixed-center = true;
        gtk-layer-shell = true;
        margin-bottom = 2;

        modules-left = [
          "clock"
          "hyprland/window"
        ];
        modules-center = [
          "hyprland/workspaces"          
        ];
        modules-right = [
          "pulseaudio"
          "network"
          "battery"
        ];
        "hyprland/window" = {
          format = "{class}";
        };

        # Workspaces
        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          disable-scroll = true;
          all-outputs = true;
          show-special = true;
          format-icons =  {
            "active" =  "";
            "urgent" = "";
            "default" =  "";
          };
          persistent-workspaces = { "*" = 4; };
         
        };

        clock = {
          format = "{:%a %b %d, %H:%M}";
          on-click = "kitty calcure";
          actions = {
            on-scroll-down = "shift_down";
            on-scroll-up = "shift_up";
          };
        };

        pulseaudio = {
          format = "{icon}/{format_source}";
          format-source = "󰍬";
          format-source-muted = "󰍭";
          format-muted = "󰖁 / {format_source}";
          format-icons = { default = [ "󰕿" "󰖀" "󰕾" ]; };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          on-click-right = "${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
          on-scroll-up = "${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +1%";
          on-scroll-down = "${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -1%";
          tooltip = false;
          spacing = 5;
        };

        battery = {
          format = "{icon} {capacity}%";
          format-charging = "{icon}  {capacity}%";
          format-icons = [ "" "" "" "" "" ];
          format-plugged = " {power} W";
          interval = 5;
          tooltip-format = "{timeTo}, {capacity}%\n {power} W";

          states = {
            warning = 30;
            critical = 15;
          };
        };

        network = {
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          format-wifi = "{icon}";
          format-ethernet = "󰈀"; # 󰈁
          format-disconnected = "⚠";
          tooltip-format-wifi = "WiFi: {essid} ({signalStrength}%)\n {bandwidthUpBytes}  {bandwidthDownBytes}";
          tooltip-format-ethernet = "Ethernet: {ifname}\n {bandwidthUpBytes}  {bandwidthDownBytes}";
          tooltip-format-disconnected = "Disconnected";
          on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
          interval = 5;
          spacing = 5;
        };
      }
    ];
    style = ''
              window#waybar {
                background: rgba(0,0,0,0);
                font-family: FiraCodeNerdFontMono;
              }
              #window {
                padding: 0px 10px 0px 0px;
              }
              #clock {
                padding: 0px 10px 0px 10px;
              }

              #pulseaudio {
                padding: 0px 0px 0px 10px;
              }

              #battery {
                padding: 0px 10px 0px 10px;
              }

              #network {
                padding: 0px 0px 0px 10px;
              }
              .modules-right,
              .modules-left,
              .modules-center {
                background: #393552;
                border-radius: 16px
              }
    '';
  };
}
