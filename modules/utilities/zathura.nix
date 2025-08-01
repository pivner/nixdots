{ ... }: {
  programs.zathura = {
    enable = true;
    extraConfig = ''
      # https://github.com/rose-pine/rose-pine-theme
      # Soho vibes for Zathura: Rosé Pine Moon
      #
      # Usage:
      # Copy contents of this file to ~/.config/zathura/zathurarc
      #
      # Change 'recolor' and 'recolor-keephue' to true to change
      # the document colors for a more uniform viewing experience.
      
      set default-bg                  "#232136"
      set default-fg                  "#e0def4"
      
      set statusbar-fg                "#e0def4"
      set statusbar-bg                "#59546d"
      
      set inputbar-bg                 "#817c9c"
      set inputbar-fg                 "#232136"
      
      set notification-bg             "#817c9c"
      set notification-fg             "#232136"
      
      set notification-error-bg       "#817c9c"
      set notification-error-fg       "#ea9a97"
      
      set notification-warning-bg     "#817c9c"
      set notification-warning-fg     "#f6c177"
      
      set highlight-color             "rgba(0x3e, 0x8f, 0xb0, 0.5)"
      set highlight-active-color      "rgba(0x9c, 0xcf, 0xd8, 0.5)"
      
      set completion-bg               "#817c9c"
      set completion-fg               "#9ccfd8"
      
      set completion-highlight-fg     "#e0def4"
      set completion-highlight-bg     "#9ccfd8"
      
      set recolor-lightcolor          "#232136"
      set recolor-darkcolor           "#e0def4"
      
      set recolor                     "false"
      set recolor-keephue             "false"
    '';
  };
}
