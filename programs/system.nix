{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

#  hardware.spacenavd.enable = true;

  # auto update
  system.autoUpgrade.enable  = true;
  #system.autoUpgrade.allowReboot  = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
#    nvidia-docker
#    docker
    unstable.jetbrains.webstorm
    unstable.jetbrains.pycharm-community-bin
    unstable.moonlight-qt
    distrobox
    btop
    nodejs
    wget
    ntfs3g
    sshfs
    pkgs.gnome-screenshot
    (python3Full.withPackages (subpkgs: with subpkgs; [
        pip
        setuptools
    ]))
    wakelan
    lm_sensors
    ffmpeg-full
  ];
}
