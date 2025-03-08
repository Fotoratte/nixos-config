# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:
{
  imports =
    [
      ../../home/default.nix
      "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/lenovo/thinkpad/p51"
      # Include the results of the hardware scan.
      ./hardware.nix
    ];

  hardware.nvidia-container-toolkit.enable = true;
  hardware.nvidia.prime = {
    sync.enable = lib.mkForce true;
    offload.enable = lib.mkForce false;
  };


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModprobeConfig = "options thinkpad_acpi fan_control=1";

  networking.hostName = "powerRats"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  services.thinkfan = {
    enable = true;
  };
}
