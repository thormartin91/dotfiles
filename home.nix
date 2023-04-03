{ config
, pkgs
, lib
, ...
}: {
  
  home-manager = {
    verbose = true;
    backupFileExtension = "hm_bak~";
    useUserPackages = true;
    useGlobalPkgs = true;
    users.thorma = {
      home.stateVersion = "22.11";
      home.packages = with pkgs; [
        htop
        tree
        nmap
        bat
        wget
        azure-cli
      ];
      programs = {
        home-manager.enable = true;  
      };
    };
  };
}
