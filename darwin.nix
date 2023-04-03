{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [  ];
  
  services.nix-daemon.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  #user on system / machine
  users.users.thorma = {
    name = "thorma";
    home = "/Users/thorma";
    description = "Thor Martin";
  };

  imports = [ ./home.nix ];

}
