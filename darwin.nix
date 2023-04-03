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
 
  fonts = {
    fontDir.enable = true;
    #fonts = [ pkgs.jetbrains-mono pkgs.nerdfonts ];
    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [ "FiraCode" ];
      })
    ];
  };

  system = {
    defaults = {
      NSGlobalDomain = {
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        # NSAutomaticCapitalizationEnabled = false;
        # NSAutomaticDashSubstitutionEnabled = false;
        # NSAutomaticPeriodSubstitutionEnabled = false;
        # NSAutomaticQuoteSubstitutionEnabled = false;
        # NSAutomaticSpellingCorrectionEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
      };
      dock = {
        autohide = true;
        orientation = "bottom";
        # tilesize = 16;
      };
      finder = {
        AppleShowAllExtensions = true;
        QuitMenuItem = true;
      };
      trackpad = {
        TrackpadThreeFingerDrag = true;
        Clicking = true; 
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };
  #  system.defaults.NSGlobalDomain.com.apple.swipescrolldirection = false;

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "none"; # zap;
    onActivation.upgrade = true;

    taps = [ ];

    brews = [ ];

    casks = [
      "google-chrome"
    ];

    masApps = {};

  };
}
