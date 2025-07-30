{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    autosuggestion.enable = true;
    shellAliases = {
      "rebuild" = "sudo nixos-rebuild switch --flake /etc/nixos";
      "cdconf" = "cd /etc/nixos/";
      "fetch" = "fastfetch";
      "vi" = "nvim";
      "nixcg" = "sudo nix-collect-garbage";
      "c" = "clear";
    };
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];
    initContent = "
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      eval \"$(ssh-agent -s)\" > /dev/null
      ssh-add ~/.ssh/git 2> /dev/null
    ";
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    colors = {
      fg = "#908caa";
      bg = "-1";
      hl = "#ea9a97";
      "fg+" = "#e0def4";
      "bg+" = "#393552";
      "hl+" = "#ea9a97";
      border = "#44415a";
      header = "#3e8fb0";
      gutter = "#232136";
      spinner = "#f6c177";
      info = "#9ccfd8";
      pointer = "#c4a7e7";
      marker = "#eb6f92";
      prompt = "#908caa";
    };
  };
}
