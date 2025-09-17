{
  symlinkJoin,
  neovim-unwrapped,
  makeWrapper,
  runCommandLocal,
  vimPlugins,
  lib,
  pyright,
}: let
  packageName = "edvard-neovim";

  startPlugins = [
    vimPlugins.plenary-nvim
    vimPlugins.telescope-nvim
    vimPlugins.nord-nvim
    vimPlugins.lualine-nvim
    vimPlugins.gitsigns-nvim
    vimPlugins.nvim-treesitter.withAllGrammars
    vimPlugins.nvim-cmp
    vimPlugins.nvim-lspconfig
  ];

  foldPlugins = builtins.foldl' (
    acc: next:
      acc
      ++ [
        next
      ]
      ++ (foldPlugins (next.dependencies or []))
  ) [];

  startPluginsWithDeps = lib.unique (foldPlugins startPlugins);

  packpath = runCommandLocal "packpath" {} ''
    mkdir -p $out/pack/${packageName}/{start,opt}

    ${
      lib.concatMapStringsSep
      "\n"
      (plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/start/${lib.getName plugin}")
      startPluginsWithDeps
    }
  '';
in
  symlinkJoin {
    name = "nvim";
    paths = [neovim-unwrapped];
    nativeBuildInputs = [makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/nvim \
        --prefix PATH : ${lib.makeBinPath [ pyright]} \
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
