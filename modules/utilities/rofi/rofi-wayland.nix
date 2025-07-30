{ pkgs, ... }: {
  programs.rofi = {
    package = pkgs.rofi-wayland;
    enable = true;
    theme = ./rose-pine-moon.rasi;
  };
}
