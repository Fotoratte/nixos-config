{ config, pkgs, ... }:
let
  unstable = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/master)
    # reuse the current configuration
    { config = config.nixpkgs.config; };
in
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rex = {
    isNormalUser = true;
    description = "Rex";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      thunderbird
      telegram-desktop
      moonlight-qt
      discord
      godot_4
      unstable.jetbrains.pycharm-community
      gimp-with-plugins
      libreoffice-fresh
      nextcloud-client
      teamviewer
      filezilla
      unstable.gnomeExtensions.ddterm
    ];
  };
}
