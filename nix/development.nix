{
  config,
  pkgs,
  inputs,
  ...
}: {
  /*
  # For usage of overlay, need to read up into flakes more and get a better understanding of what's actually going on in there.
     environment.systemPackages = with pkgs; [
         nvim-pkg # default from overlay
  #ollama # use as a service instead
  #wl-clipboard # in main configuration since potentially useful outside of neovim
     ];
  */

  # Note: in nvim - `:!nixfmt %<ENTER>`

  environment.systemPackages = with pkgs; [
    wget
    unzip
    gcc
    zig
    zellij
    python314 # Neovim plugins? Potentially needed, going through healthcheck...
    # pip:
    # rustup # for this one, can likely just use nix-shell
    luajitPackages.luarocks-nix
    stylua
    helix
    lazygit
    duckdb
  ];

  /*
  services.ollama = {
    enable = true;
    # Optional: preload models, see https://ollama.com/library
    loadModels = [
      # "deepseek-r1:1.5b" # Did not find particularly useful
      "gemma3:1b"
      # "gemma3:4b"
      "codegemma:2b"
    ];
    acceleration = "cuda";
  };
  */

  # toDo: Look into nixvim - https://github.com/nix-community/nixvim
  /*
  let
  	  luaConfig = builtins.readFile ./init.lua
  	in {
  */
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withPython3 = true;
    #configure= {
    #customLuaRC= luaConfig;
    #};
  };

  /*
  programs.nixvim = {
    enable = true;
    coloschemes.catpuccin.enable = true;
    plugins.lualine.enable = true;
    clipboard = {
  	providers = {
  		wl-copy.enable = true; # wayland
  	};

    };

  };
  */
}
