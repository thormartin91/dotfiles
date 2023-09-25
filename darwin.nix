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
        AppleKeyboardUIMode = 3;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        "com.apple.swipescrolldirection" = true;
      };
      LaunchServices = {
        LSQuarantine = false;
      };
      dock = {
        autohide = true;
        expose-group-by-app = true;
        orientation = "bottom";
        tilesize = 64;
      };
      finder = {
        AppleShowAllExtensions = true;
        QuitMenuItem = true;
        _FXShowPosixPathInTitle = true;
      };
      trackpad = {
        Clicking = true; 
        TrackpadThreeFingerDrag = true;
      };
      CustomUserPreferences = {
        "com.apple.dock" = {
          showAppExposeGestureEnabled = true;
        };
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "none"; # zap;
    onActivation.upgrade = true;

    taps = [ ];

    brews = [ ];

    casks = [
      "rectangle"
      "obsidian"
      "google-chrome"
      "discord"
      "visual-studio-code"
      "docker"
      "balenaetcher"
      "postman"
      "openttd"
    ];

    masApps = {
      pages = 409201541;
      numbers = 409203825;
      keynote = 409183694;
      xcode = 497799835;
      amphetamine = 937984704;
      tailscale = 1475387142;
    };

  };
}
