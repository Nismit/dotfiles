{ pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./git.nix
    ./wezterm.nix
    ./editorconfig.nix
    ./nvim.nix
  ];

  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    tree
    neovim
    ripgrep
    ffmpeg
    deno
    mosh
    tmux
  ];
}
