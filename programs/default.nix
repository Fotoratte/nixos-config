{ config, pkgs, ... }:
{
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
}
