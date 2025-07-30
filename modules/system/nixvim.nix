{ ... }: {
  imports = [
    ./nixvim/settings.nix
    # plugins
    ./nixvim/misc.nix
    ./nixvim/lualine.nix
    ./nixvim/telescope.nix
    ./nixvim/bufferline.nix
    ./nixvim/dashboard.nix
    ./nixvim/toggleterm.nix
    ./nixvim/luasnip.nix
    ./nixvim/undotree.nix
    ./nixvim/treesitter.nix
    # completion plugins
    ./nixvim/cmp/autopairs.nix
    ./nixvim/cmp/cmp.nix
    ./nixvim/cmp/lspkind.nix
    ./nixvim/cmp/schemastore.nix
    # lsp plugins
    ./nixvim/lsp/lsp.nix
  ];
  programs.nixvim = {
    enable = true;
  };
}
