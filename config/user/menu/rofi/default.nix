{ pkgs, config, ... }:

{
    # stylix.targets.rofi.enable = false;
    programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        extraConfig = {
            font = "Iosevka Nerd Font Medium 15";
            modi = "drun,run,window";
            display-drun = "[ ]";
            display-run = "[ ]";
            display-window = "[ ]";
        };
        theme =
            let 
              inherit (config.lib.formats.rasi) mkLiteral;
            in {
            "*" = {
                # bg = mkLiteral "#${config.stylix.base16Scheme.base00}";
                # bg-alt = mkLiteral "#${config.stylix.base16Scheme.base00}";
                # fg = mkLiteral "#${config.stylix.base16Scheme.base06}";
                # fg-alt = mkLiteral "#${config.stylix.base16Scheme.base03}";

                border = mkLiteral "0px";
                margin = mkLiteral "0px";
                spacing = mkLiteral "0px";
                padding = mkLiteral "0px";

                # background-color = mkLiteral "@bg";
                # separatorcolor = mkLiteral "@fg";
                # text-color = mkLiteral "@fg";
            };

            "#window" = {
                width = mkLiteral "45%";
                height = mkLiteral "39.5%";
            };

            "#mainbox" = {
                children = map mkLiteral [
                "inputbar"
                "listview"
                ];
            };

            "#inputbar" = {
                children = map mkLiteral [
                "prompt"
                "entry"
                ];
                # background-color = mkLiteral "@bg-alt";
            };

            "#entry" = {
                padding = mkLiteral "12px";
            };

            "#prompt" = {
                padding = mkLiteral "12px";
            };

            "#listview" = {
                lines = mkLiteral "8";
                # background-color = mkLiteral "@bg";
            };

            "#element" = {
                children = map mkLiteral [
                "element-text"
                ];
            };

            "#element-text" = {
                padding = mkLiteral "12px";
                # text-color = mkLiteral "@fg-alt";
            };

            "#element-text selected" = {
                # text-color = mkLiteral "@fg";
            };
        };
    };

    home.file.".config/rofi/leave.sh".source = ./leave.sh;
    home.file.".config/rofi/music.sh".source = ./music.sh;
}
