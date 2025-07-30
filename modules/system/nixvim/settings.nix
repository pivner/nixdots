{
  programs.nixvim = {
    keymaps = [{
      key = ";";
      action = ":";
    }
      {
        mode = "n";
        key = "<leader>n";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = {
          desc = "Next Buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>b";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = {
          desc = "Previous Buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>d";
        action = "<cmd>bdelete<cr>";
        options = {
          desc = "Delete Buffer";
        };
      }
      {
        mode = "n";
        key = "tt";
        action = "<cmd>ToggleTerm<cr>";
        options = {
          desc = "Toggle Terminal Window";
        };
      }
      {
        mode = "n";
        key = "<leader>ut";
        action = "<cmd>UndotreeToggle<CR>";
        options = {
          silent = true;
          desc = "Undotree";
        };
      }];
    colorschemes.rose-pine = {
      enable = true;
      settings = {
        contrast = true;
        variant = "moon";
      };
    };
    clipboard = {
      providers.wl-copy.enable = true;
    };
    opts = {
      autoindent = true;
      number = true;
      relativenumber = true;
      splitbelow = true;
      splitright = true;
      scrolloff = 4;
      clipboard = "unnamedplus";
      expandtab = true;
      shiftwidth = 2;
      smartindent = true;
      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      ignorecase = true;
      smartcase = true;
      swapfile = false;
      undofile = true;
      cursorline = true;
    };
  };
}
