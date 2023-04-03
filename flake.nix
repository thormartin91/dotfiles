{
  description = "mac";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11"; 

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, home-manager }: { 

    # darwin-rebuild switch --flake .#mac
  
    darwinConfigurations."mac" = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules = [ home-manager.darwinModules.home-manager ./darwin.nix ];
    };
  };

}
