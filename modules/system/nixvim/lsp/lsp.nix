{
  programs.nixvim.plugins = {
    lsp-lines = { enable = true; };
    lsp-format = { enable = true; };
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        bashls = { enable = true; }; #bash
        clangd = { enable = true; }; #c, c++
        html = { enable = true; }; #html
        java_language_server = { enable = true; }; #java
        jsonls = { enable = true; }; #json
        nil_ls = { enable = true; }; #nix
        pylsp = { enable = true; }; #python
        ts_ls = { enable = true; }; #typescript
        typos_lsp = { enable = true; }; #english
        yamlls = { enable = true; }; #yaml
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Go To Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>gw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>rr" = {
            action = "rename";
            desc = "Rename";
          };
        };
      };
    };
  };
}
