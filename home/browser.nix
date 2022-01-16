{ pkgs, ... }:

{
  programs = {
    firefox = {
      enable = true;
    #   extensions = with pkgs.firefox-addons; [

    #     # privacy
    #     ublock-origin
    #     foxyproxy-standard
    #     smart-referer
    #     skip-redirect
    #     change-timezone-time-shift
    #     behave

    #     # wallets
    #     solflare-wallet
    #     ether-metamask

    #     # ui
    #     tree-style-tab

    #     # work
    #     plantuml-visualizer
    #   ];
    };
    chromium = {
      enable = true;
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
        "aapbdbdomjkkjkaonfhkkikfgjllcleb" # translate
        "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
      ];
    };
  };

  home.packages = with pkgs; [
    torbrowser
  ];

  home.sessionVariables.BROWSER = "firefox";
}
