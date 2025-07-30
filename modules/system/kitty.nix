{ ... }: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "rose-pine-moon";
    settings = {
      confirm_os_window_close = 0;
      #      font_family = "FiraCodeNerdFontMono";
      font_size = 11;
      background_opacity = "0.6";
      enable_audio_bell = false;
      cursor_shape = "beam";
    };
  };
}
