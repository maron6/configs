{
  # note for references: `nix flake show templates`
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-nvim.url = "github:maron6/nix-nvim/main";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
      nix-nvim,
      ...
    }@inputs:
    let
      system = if builtins ? currentSystem then builtins.currentSystem else "x86_64-linux";
    in
    {
      nixpkgs.overlays = [
        nix-nvim.overlays.default
      ];
      # Please replace my-nixos with your hostname
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        #system = "x86_64-linux";
        inherit system;
        modules = [
          # Import the previous configuration.nix we used,
          # so the old configuration file still takes effect
          ./configuration.nix
          ./graphics.nix
          ./gaming.nix
          ./development.nix
          nixos-hardware.nixosModules.system76
        ];
      };
    };
}
