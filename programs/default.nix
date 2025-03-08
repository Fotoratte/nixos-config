{ config, pkgs, ... }:
{
    virtualisation.docker.enable = true;
      # Some programs need SUID wrappers, can be configured further or are
      # started in user sessions.
      # programs.mtr.enable = true;
      # programs.gnupg.agent = {
      #   enable = true;
      #   enableSSHSupport = true;
      # };

    # enable zsh and oh my zsh
    programs = {
      # Install firefox.
      firefox.enable = true;

      # Install steam
      steam.enable = true;

      git.enable = true;

      yubikey-touch-detector.enable = true;

      nano = {
        enable = true;
        syntaxHighlight = true;
        nanorc = ''
      set nowrap
      set tabstospaces
      set tabsize 4
    '';
      };

      tmux = {
        enable = true;
        shortcut = "a";
    };

       zsh.enable = true;
    };

services.openssh = {
  enable = true;
  ports = [ 22 ];
  settings = {
    PasswordAuthentication = true;
    AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
    UseDns = true;
    X11Forwarding = false;
    PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
  };
};
}
