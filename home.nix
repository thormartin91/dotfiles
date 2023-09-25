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
        zsh = {
          enableCompletion = true;
          enableAutosuggestions = true;
          enable = true;
          shellAliases = {
            ls = "ls --color";
            ll = "ls -la --color";
          };
        };
        git = {
          enable = true;
          userName = "Thor Martin Abrahamsen";
          userEmail = "thorma91@gmail.com";
          aliases = {
            prettylog = "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
          };
          extraConfig = {
            github.user = "thormartin91";
            color.ui = true;
          };
        };
        ssh = {
          enable = true;
          matchBlocks = {
            gondolin = {
              hostname = "thormart.in";
              user = "thorma";
              port = 22;
            };
          };
        };
        starship.enable = true;
        vim.enable = true;
      };
    };
    #extraSpecialArgs = { inherit machine; };
  };
}
