{ config, pkgs, ... }:
{
  imports = [ <home-manager/nixos> ];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rex = {
    isNormalUser = true;
    description = "Rex";
    extraGroups = [
      "networkmanager"
      "dialout"
      "wheel"
      "docker"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
  };
}
