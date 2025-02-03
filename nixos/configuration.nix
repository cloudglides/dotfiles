{ config, pkgs, system, inputs, ... }:

 {
  imports = [
    ./hardware-configuration.nix
  ];
 
  home-manager.users.cloudglides = import /home/cloudglides/dotfiles/home-manager;
  programs.nix-ld.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  hardware.enableAllFirmware = true;
  networking.hostName = "nixos";
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
        scaling_min_freq = 400000;
        scaling_max_freq = 3800000;
      };
      charger = {
        governor = "performance";
        turbo = "auto";
        scaling_max_freq = 4000000;
      };
    };
  };

 

  services.power-profiles-daemon.enable = false;
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_IN";

  services.xserver = {
    enable = true;
    xkb = { layout = "us"; };
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.fish.enable = true;

  users.users.cloudglides = {
    isNormalUser = true;
    description = "cloudglides";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };


  

environment.systemPackages = with pkgs; [
fish
vesktop
brave
git
neovim
gnome-tweaks
miru
auto-cpufreq
zsh
zig
unzip
clang
gcc
p7zip
spicetify-cli
spotify
home-manager
wl-clipboard
fastfetch
oh-my-zsh
wakatime-cli
lua-language-server
pokeget-rs
btop
superfile
exiftool
gh
obsidian
curl
nodejs_22
gnome-keyring
libdrm
inputs.zen-browser.packages."${system}".default
  ];

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
}
