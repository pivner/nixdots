{
  programs.nixvim.plugins = {
    telescope = {
      enable = true;
      extensions = {
        file-browser.enable = true;
        fzf-native.enable = true;
      };
      settings = {
        defaults = {
          layout_config = {
            horizontal = {
              prompt_position = "top";
            };
          };
        };
      };
      keymaps = {
        "ff" = {
          action = "file_browser";
          options = {
            desc = "Find Files";
          };
        };
      };
    };
  };
}
