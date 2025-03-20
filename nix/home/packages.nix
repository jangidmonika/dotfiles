{pkgs, ...}: let
  packages = with pkgs;
    [
      # chromedriver
      gawk
      gh
      git
      delta
      jq
      just
      nix-direnv
      silver-searcher
      tree-sitter
      vim
      zsh
      starship
      universal-ctags

      # System Tools
      unzip
      xclip
      # Tools
      bash-completion
      bash-language-server
      neovim
      neovim-remote
      tmux
      curl
      fd
      ripgrep
      fzf
      lazygit
      awscli2
      direnv
      # Runtime
      rustc
      cargo
      nodejs
      nodePackages.aws-cdk
      # Python Runtime
      (ruby.withPackages (ps: with ps; [ neovim ]))
      (python312.withPackages (ps: with ps; [ pip pyelftools click pip-tools ]))
      poetry
      tree
      coreutils
      uv
      plantuml
      zulu # java
      pre-commit
      # https://github.com/NixOS/nix/issues/730
      # FIX: bash: shopt: progcomp: invalid shell option name
      bashInteractive

    ]
    ++ (
      if pkgs.stdenv.isLinux
      then [ gcc xclip unixtools.ifconfig inotify-tools ncurses5]
      else [ ]  # darwin
    );
in {
  inherit packages;
}
