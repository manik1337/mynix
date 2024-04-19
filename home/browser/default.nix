{ pkgs, ... }: {
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox-wayland;
      profiles = let
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          foxyproxy-standard
          i-dont-care-about-cookies
          behave
          consent-o-matic

          # darkreader
          sidebery

          bitwarden
          onepassword-password-manager
        ];
        baseSettings = {
          # general
          "browser.startup.page" = 3; # restore session
          "font.name.serif.x-western" = "Hack"; # set my own main font
          "app.normandy.first_run" = false; # disable first run info (?)
          "browser.tabs.warnOnClose" = false; # warn on close tabs
          "browser.toolbars.bookmarks.visibility" =
            "never"; # hide bookmarks toolbar

          # search settings
          "browser.search.region" = "US";
          "browser.search.defaultenginename" = "Google";
          "browser.urlbar.placeholderName" = "Google";
          "keyword.enabled" = true; # (?)

          # privacy
          "privacy.sanitize.sanitizeOnShutdown" = false; # ?
          "dom.security.https_only_mode" = true; # HTTPS only mode
          "network.cookie.lifetimePolicy" = 0; # keep cookies between restart

          # misc
          "browser.safebrowsing.passwords.enabled" =
            true; # save passwords in safebrowsing mode
          "services.sync.engine.passwords" = false; # do not sync passwords
          "browser.sessionstore.resume_session_once" = true; # ?
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # ?

          # security
          # prevent av/malware injection
          "accessibility.force_disabled" = 1;

          # performance
          # https://www.reddit.com/r/browsers/comments/nugbaw/firefox_going_up_to_1000_mb_with_only_5_tabs_open/
          "dom.ipc.processCount" = 0;
          "dom.ipc.processPrelaunch.enabled" = false;
          "dom.ipc.keepProcessesAlive.privilegedabout" = 0;
        };
        arkenfoxUserJsSettings =
          # SEE https://github.com/arkenfox/user.js
          import ./generated-userjs.nix // baseSettings;
        userChrome = ''
          #TabsToolbar { visibility: collapse !important; }
        '';
        search = {
          default = "DuckDuckGo";
          privateDefault = "DuckDuckGo";
          force = true;
          order = [ "DuckDuckGo" "Google" "Wikipedia (en)" ];
          engines = {
            "DuckDuckGo".metaData.alias = ".d";
            "Google".metaData.alias = ".g";
            "Wikipedia (en)".metaData.alias = ".w";
            "Amazon.com".metaData.hidden = true;
            "Bing".metaData.hidden = true;

            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }];

              icon =
                "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ ".np" ];
            };

            "NixOS Options" = {
              urls = [{
                template = "https://search.nixos.org/options";
                params = [{
                  name = "query";
                  value = "{searchTerms}";
                }];
              }];

              icon =
                "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ ".no" ];
            };

            "NixOS Wiki" = {
              urls = [{
                template = "https://nixos.wiki/index.php?search={searchTerms}";
              }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ ".nw" ];
            };

            "HexDocs" = {
              urls = [{ template = "https://hexdocs.pm/{searchTerms}"; }];
              # TODO icon
              definedAliases = [ ".hd" ];
            };

            "HexDocs Elixir" = {
              urls = [{
                template = "https://hexdocs.pm/elixir/search.html";
                params = [{
                  name = "q";
                  value = "{searchTerms}";
                }];
              }];
              # TODO icon
              definedAliases = [ ".hde" ];
            };
          };
        };
      in {
        personal = {
          id = 0;
          settings = arkenfoxUserJsSettings;
          inherit userChrome extensions search;
        };
      };
    };
  };

  programs.chromium = {
    enable = true;
    extensions = [
      "gcbommkclmclpchllfjekcdonpmejbdp" # httsp everywhere
      "nkbihfbeogaeaoehlefnkodbefgpgknn" # metamask
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    ];
  };

  home.sessionVariables.BROWSER = "firefox";
}
