# dotfiles
[Nix](https://nixos.org) 
[nix-darwin](https://github.com/LnL7/nix-darwin)
[home-manager](https://github.com/nix-community/home-manager)

## Usage
Clone to `~/.nixpkgs` and rebuild system with
```
darwin-rebuild switch --flake .#mac
```

- `flake.nix`: entrypoint 
- `darwin.nix`: system (macOS) and machine specific config 
- `home.nix`: user specific config.

## Prerequisites
- Nix
- Brew
