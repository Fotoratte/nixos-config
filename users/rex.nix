{ config, pkgs, ... }:
{
  imports = [ <home-manager/nixos> ];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rex = {
    isNormalUser = true;
    description = "Rex";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager =  {
    useGlobalPkgs = true;
    users.rex = { pkgs, ... }: {
      home.packages = with pkgs; [
          thunderbird
          telegram-desktop
          moonlight-qt
          discord
          godot_4
          jetbrains.pycharm-community
          gimp-with-plugins
          libreoffice-fresh
          nextcloud-client
          teamviewer
          filezilla
          gnomeExtensions.ddterm
        ];
      
      # The state version is required and should stay at the version you
      # originally installed.
      home.stateVersion = "24.05";
    };
  };
}
