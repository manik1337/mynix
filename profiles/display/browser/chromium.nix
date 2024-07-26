{
  home-manager.users.dmanik = {
    programs.chromium = {
      enable = true;
      extensions = [
        "gcbommkclmclpchllfjekcdonpmejbdp" # httsp everywhere
        "nkbihfbeogaeaoehlefnkodbefgpgknn" # metamask
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
        "nngceckbapebfimnlniiiahkandclblb" # bitwarden
      ];
    };
  };
}
