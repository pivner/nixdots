{ ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "/etc/nixos/splash/rosepinewp.png"
      ];
      wallpaper = [
        ", /etc/nixos/splash/rosepinewp.png"
      ];
    };
  };
}
