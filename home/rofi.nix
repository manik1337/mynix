{ pkgs, config, ... }:

let inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    terminal = "alacritty";
    extraConfig = {
      font = "Noto Sans Bold 10";
      show-icons = mkLiteral "true";
      icon-theme = "Papirus";
      display-drun = "";
      drun-display-format = "{name}";
      disable-history = mkLiteral "false";
      sidebar-mode = mkLiteral "false";
    };
    extraConfig.matching = "fuzzy";
    theme = {
      "*" = {
        background = mkLiteral "#00000060";
        background-alt = mkLiteral "#00000000";
        background-bar = mkLiteral "#f2f2f215";
        foreground = mkLiteral "#f2f2f2EE";
        accent = mkLiteral "#ffffff66";
      };

      "window" = {
        transparency = "real";
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
        border = mkLiteral "0px";
        border-color = mkLiteral "@border";
        border-radius = mkLiteral "0px";
        width = mkLiteral "100%";
        height = mkLiteral "100%";
      };

      "prompt" = {
        enabled = mkLiteral "true";
        padding = mkLiteral "0.30% 1% 0% -0.5%";
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "@foreground";
        font = "FantasqueSansMono Nerd Font 12";
      };

      "entry" = {
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "@foreground";
        placeholder-color = mkLiteral "@foreground";
        expand = mkLiteral "true";
        horizontal-align = mkLiteral "0";
        placeholder = "Search";
        padding = mkLiteral "0.10% 0% 0% 0%";
        blink = mkLiteral "true";
      };

      "inputbar" = {
        children = map mkLiteral [ "prompt" "entry" ];
        background-color = mkLiteral "@background-bar";
        text-color = mkLiteral "@foreground";
        expand = mkLiteral "false";
        border = mkLiteral "0.1%";
        border-radius = mkLiteral "6px";
        border-color = mkLiteral "@accent";
        margin = mkLiteral "0% 30% 0% 30%";
        padding = mkLiteral "1%";
      };

      "listview" = {
        background-color = mkLiteral "@background-alt";
        columns = mkLiteral "7";
        lines = mkLiteral "4";
        spacing = mkLiteral "2%";
        cycle = mkLiteral "false";
        dynamic = mkLiteral "true";
        layout = mkLiteral "vertical";
      };

      "mainbox" = {
        background-color = mkLiteral "@background-alt";
        border = mkLiteral "0% 0% 0% 0%";
        border-radius = mkLiteral "0% 0% 0% 0%";
        border-color = mkLiteral "@accent";
        children = map mkLiteral [ "inputbar" "listview" ];
        spacing = mkLiteral "8%";
        padding = mkLiteral "10% 8.5% 10% 8.5%";
      };

      "element" = {
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "@foreground";
        orientation = mkLiteral "vertical";
        border-radius = mkLiteral "0%";
        padding = mkLiteral "2.5% 0% 2.5% 0%";
      };

      "element-icon" = {
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "inherit";
        horizontal-align = mkLiteral "0.5";
        vertical-align = mkLiteral "0.5";
        size = mkLiteral "81px";
        border = mkLiteral "0px";
      };

      "element-text" = {
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "inherit";
        expand = mkLiteral "true";
        horizontal-align = mkLiteral "0.5";
        vertical-align = mkLiteral "0.5";
        margin = mkLiteral "0.5% 0.5% -0.5% 0.5%";
      };

      "element selected" = {
        background-color = mkLiteral "@background-bar";
        text-color = mkLiteral "@foreground";
        border = mkLiteral "0% 0% 0% 0%";
        border-radius = mkLiteral "12px";
        border-color = mkLiteral "@accent";
      };
    };
  };
}
