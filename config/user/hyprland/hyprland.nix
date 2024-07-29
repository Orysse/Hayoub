{... }:
{
    imports = [ ./waybar.nix ./swaylock.nix ];
    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        settings = {
            exec-once = "waybar";
            # Environment variables
            env = [
                    # Enable Ozone support for NixOS
                    "NIXOS_OZONE_WL, 1"

                    # Allow unfree packages in Nixpkgs
                    "NIXPKGS_ALLOW_UNFREE, 1"

                    # Set the current desktop environment to Hyprland
                    "XDG_CURRENT_DESKTOP, Hyprland"

                    # Set the session type to Wayland
                    "XDG_SESSION_TYPE, wayland"

                    # Set the GDK backend to Wayland and X11
                    "GDK_BACKEND, wayland, x11"
                        
                    # Set the Qt platform to Wayland and XCB
                    "QT_QPA_PLATFORM=wayland;xcb"

                    # Disable window decoration in Qt for Wayland
                    "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"

                    # Enable automatic screen scale factor in Qt
                    "QT_AUTO_SCREEN_SCALE_FACTOR, 1"

                    # Set the SDL video driver to X11
                    "SDL_VIDEODRIVER, x11"

                    # Enable Wayland support in Mozilla applications
                    "MOZ_ENABLE_WAYLAND, 1"
                    ];

            #Binds
            "$mainMod" = "SUPER";
            bind = [
                    # Launch terminal
                    "$mainMod, Return, exec, alacritty"

                    # Window management
                    "$mainMod, Q, killactive"
                    "$mainMod, M, exit"
                    "$mainMod, E, exec, alacritty --class floating -e ranger"
                    "$mainMod, V, togglefloating"
                    "$mainMod, D, exec, rofi -show drun"
                    "ALT, Tab, exec, rofi -show window"
                    "$mainMod, P, exec, sh ~/.config/rofi/leave.sh"
                    "$mainMod, J, togglesplit"
                    "$mainMod, S, exec, wayshot"

                    # Move focus with arrow keys
                    "$mainMod, left, movefocus, l"
                    "$mainMod, right, movefocus, r"
                    "$mainMod, up, movefocus, u"
                    "$mainMod, down, movefocus, d"

                    # Switch workspaces with numbers
                    "$mainMod, 1, workspace, 1"
                    "$mainMod, 2, workspace, 2"
                    "$mainMod, 3, workspace, 3"
                    "$mainMod, 4, workspace, 4"
                    "$mainMod, 5, workspace, 5"
                    "$mainMod, 6, workspace, 6"
                    "$mainMod, 7, workspace, 7"
                    "$mainMod, 8, workspace, 8"
                    "$mainMod, 9, workspace, 9"
                    "$mainMod, 0, workspace, 10"

                    # Move active window to a workspace with SHIFT + numbers
                    "$mainMod SHIFT, 1, movetoworkspace, 1"
                    "$mainMod SHIFT, 2, movetoworkspace, 2"
                    "$mainMod SHIFT, 3, movetoworkspace, 3"
                    "$mainMod SHIFT, 4, movetoworkspace, 4"
                    "$mainMod SHIFT, 5, movetoworkspace, 5"
                    "$mainMod SHIFT, 6, movetoworkspace, 6"
                    "$mainMod SHIFT, 7, movetoworkspace, 7"
                    "$mainMod SHIFT, 8, movetoworkspace, 8"
                    "$mainMod SHIFT, 9, movetoworkspace, 9"
                    "$mainMod SHIFT, 0, movetoworkspace, 10"

                    ];

            bindm = [
                # Move/resize windows with mouse
                "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
            ];

            input = {
                follow_mouse = false;
                touchpad = {
                    natural_scroll = "yes";
                    scroll_factor = 0.3;
                };
                # sensitivity = 1;  # Commented out as -1.0 - 1.0 range
            };

            # xwayland options
            xwayland.force_zero_scaling = true;
            # monitor=",highres,auto,2";

            # General options
            general = {
                gaps_in = 5;
                gaps_out = 8;
                border_size = 2;
                layout = "dwindle";
            };

            # Decoration options
            decoration = {
                rounding = 5;
                blur = {
                    enabled = true;
                    size = 3;
                    passes = 1;
                };
                drop_shadow = "yes";
                shadow_range = 4;
                shadow_render_power = 3;
            };

            # Animation options
            animations = {
                enabled = "yes";
                bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
                animation = [
                    "windows, 1, 6, myBezier"
                    "windowsOut, 1, 7, default, popin 80%"
                    "border, 1, 10, default"
                    "borderangle, 1, 8, default" 
                    "fade, 1, 7, default"
                    "workspaces, 1, 6, default"
                ];
            };

            # Dwindle layout options
            dwindle = {
                pseudotile = "yes";
                preserve_split = "yes";
            };

            # Gesture options
            gestures = {
                workspace_swipe = "on";
            };
        };
    };
}
