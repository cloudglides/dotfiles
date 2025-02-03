{pkgs, ...}: {
  home.file = {
    ".config" = {
      recursive = true;
      source = "/home/cloudglides/dotfiles/pkgs/neovim";
    };
  };

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
      withPython3 = true;
      withNodeJs = true;
    };
  };

  home = {
    packages = with pkgs; [
      gcc
      neovide

      # nix
      nil # Language Server
      statix # Lints and suggestions
      deadnix # Find and remove unused
      alejandra # Code Formatter

      # lua
      luarocks

      # ts
      typescript

      gdu
      ripgrep
    ];
  };
}
