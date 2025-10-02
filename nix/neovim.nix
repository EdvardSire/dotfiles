{
  symlinkJoin,
  neovim-unwrapped,
  makeWrapper,
  runCommandLocal,
  vimPlugins,
  lib,
  pyright,
  llvmPackages_18,
  vscode-langservers-extracted,
  bash-language-server,
  typescript-language-server,
  cmake-language-server,
  nil,
  rust-analyzer,
  ripgrep,
  lua-language-server
}:
let
  packageName = "edvard-neovim";

  startPlugins = [
    vimPlugins.plenary-nvim
    vimPlugins.telescope-nvim # search
    vimPlugins.nord-nvim # color
    vimPlugins.lualine-nvim # nice line
    vimPlugins.gitsigns-nvim # git
    vimPlugins.nvim-treesitter.withAllGrammars # pretty AST
    vimPlugins.nvim-autopairs # brackets
    vimPlugins.nvim-lspconfig 
    vimPlugins.nvim-lspconfig
    vimPlugins.nvim-cmp
    vimPlugins.cmp-path
    vimPlugins.cmp-nvim-lsp
    vimPlugins.cmp-nvim-lsp-signature-help
    vimPlugins.luasnip
  ];

  foldPlugins = builtins.foldl' (
    acc: next:
    acc
    ++ [
      next
    ]
    ++ (foldPlugins (next.dependencies or [ ]))
  ) [ ];

  startPluginsWithDeps = lib.unique (foldPlugins startPlugins);

  packpath = runCommandLocal "packpath" { } ''
    mkdir -p $out/pack/${packageName}/{start,opt}

    ${lib.concatMapStringsSep "\n" (
      plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/start/${lib.getName plugin}"
    ) startPluginsWithDeps}
  '';
in
symlinkJoin {
  meta.mainProgram = "nvim"; # for appimage bundling
  name = "nvim";
  paths = [ neovim-unwrapped ];
  nativeBuildInputs = [ makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/nvim \
      --prefix PATH : ${
        lib.makeBinPath [
          pyright
          llvmPackages_18.clang-tools
          vscode-langservers-extracted
          bash-language-server
          typescript-language-server
          cmake-language-server
          nil
          rust-analyzer
          ripgrep
          lua-language-server
        ]
      } \
      --add-flags '-u' \
      --add-flags '${./init.lua}' \
      --add-flags '--cmd' \
      --add-flags "'set packpath^=${packpath} | set runtimepath^=${packpath}'" \
      --set-default NVIM_APPNAME nvim-custom
  '';

  passthru = {
    inherit packpath;
  };
}
