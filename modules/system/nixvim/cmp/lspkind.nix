{
  programs.nixvim.plugins = {
    lspkind = {
      enable = true;
      extraOptions = {
        maxWidth = 50;
        ellipsis_char = "...";
      };
    };
  };
}
