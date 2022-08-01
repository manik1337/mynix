{ pkgs, ... }:

{
  programs = {
    chromium = {
      extensions = [
        "gcbommkclmclpchllfjekcdonpmejbdp" # httsp everywhere
        "nkbihfbeogaeaoehlefnkodbefgpgknn" # metamask
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      ];
    };
    firefox = {
      enable = true;
      package = pkgs.firefox-wayland;
      profiles.dmanik = {
        id = 0;
        name = "dmanik";
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

          "extensions.autoDisableScopes" = 0;

          "browser.search.defaultenginename" = "Google";
          "browser.search.selectedEngine" = "Google";
          "browser.urlbar.placeholderName" = "Google";

          "browser.search.region" = "US";

          "browser.uidensity" = 1;
          "browser.search.openintab" = true;
          "xpinstall.signatures.required" = false;
          "extensions.update.enabled" = false;

          "media.videocontrols.picture-in-picture.enabled" = true;

          "widget.non-native-theme.enabled" = false;

          "font.name.monospace.x-western" = "IBM Plex Mono";
          "font.name.sans-serif.x-western" = "IBM Plex Sans";
          "font.name.serif.x-western" = "IBM Plex Serif";

          "browser.newtabpage.enabled" = false;
          "browser.startup.homepage" = "about:blank";

          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.ping-centre.telemetry" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.updatePing.enabled" = false;

          "experiments.activeExperiment" = false;
          "experiments.enabled" = false;
          "experiments.supported" = false;
          "network.allow-experiments" = false;
        };
        userChrome = ''
          #TabsToolbar { visibility: collapse !important; }
        '';
      };
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        # privacy
        https-everywhere
        ublock-origin
        foxyproxy-standard

        # ui
        darkreader
        sidebery
      ];
    };
  };

  home.packages = with pkgs; [ chromium ];

  home.sessionVariables.BROWSER = "chromium";
}
