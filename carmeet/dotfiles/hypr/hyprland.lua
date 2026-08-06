---@module 'hl'
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", 1)
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", 1)
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("GDK_SCALE", 1)
hl.env("QT_SCALE_FACTOR", 1)
hl.env("MOZ_ENABLE_WAYLAND", 1)
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
--window-man binds
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("CTRL + ALT + P", hl.dsp.exec_cmd("~/.config/rofi/powermenu.sh"))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("~/.config/rofi/spotlight.sh"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind("xf86audioraisevolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/Volume.sh --inc"), { locked = true })
hl.bind("xf86audiolowervolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/Volume.sh --dec"), { locked = true })
hl.bind("xf86AudioMicMute", hl.dsp.exec_cmd("~/.config/hypr/scripts/Volume.sh --toggle-mic"), { locked = true })
hl.bind("xf86audiomute", hl.dsp.exec_cmd("~/.config/hypr/scripts/Volume.sh --toggle"), { locked = true })
hl.bind("xf86Sleep", hl.dsp.exec_cmd("systemctl suspend"), { locked = true })
hl.bind("xf86AudioPause", hl.dsp.exec_cmd("~/.config/hypr/scripts/MediaCtrl.sh --pause"), { locked = true })
hl.bind("xf86AudioPlay", hl.dsp.exec_cmd("~/.config/hypr/scripts/MediaCtrl.sh --pause"), { locked = true })
hl.bind("xf86AudioNext", hl.dsp.exec_cmd("~/.config/hypr/scripts/MediaCtrl.sh --nxt"), { locked = true })
hl.bind("xf86AudioPrev", hl.dsp.exec_cmd("~/.config/hypr/scripts/MediaCtrl.sh --prv"), { locked = true })
hl.bind("xf86audiostop", hl.dsp.exec_cmd("~/.config/hypr/scripts/MediaCtrl.sh --stop"), { locked = true })
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("~/.config/hypr/scripts/Screenshot.sh"))
hl.bind("SUPER + H", hl.dsp.focus({direction = "left"}, {repeating = true}))
hl.bind("SUPER + J", hl.dsp.focus({direction = "down"}, {repeating = true}))
hl.bind("SUPER + K", hl.dsp.focus({direction = "up"}, {repeating = true}))
hl.bind("SUPER + L", hl.dsp.focus({direction = "right"}, {repeating = true}))
hl.bind("SUPER + SHIFT + H", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + L", hl.dsp.window.swap({ direction = "r" }))
hl.bind("SUPER + CTRL + K", hl.dsp.window.swap({ direction = "u" }))
hl.bind("SUPER + CTRL + J", hl.dsp.window.swap({ direction = "d" }))
hl.bind("SUPER + CTRL + H", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + U", hl.dsp.workspace.toggle_special(nil))
hl.bind("SUPER + SHIFT + U", hl.dsp.window.move({ workspace = "special" }))
hl.bind("SUPER + code:10", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + code:11", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + code:12", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + code:13", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + code:14", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + code:15", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + code:16", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + code:17", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + code:18", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + code:19", hl.dsp.focus({ workspace = 10 }))
hl.bind("SUPER + SHIFT + code:10", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + code:11", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + code:12", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + code:13", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + code:14", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + code:15", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + code:16", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + code:17", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + code:18", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + code:19", hl.dsp.window.move({ workspace = 10 }))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + SPACE", hl.dsp.window.float())
hl.bind("SUPER + SHIFT + SPACE", hl.dsp.exec_cmd("~/.config/hypr/scripts/focuschange.sh"))
hl.bind("xf86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/hypr/scripts/Brightness.sh --dec"))
hl.bind("xf86MonBrightnessUp", hl.dsp.exec_cmd("~/.config/hypr/scripts/Brightness.sh --inc"))

--my personal binds
hl.bind("SUPER + D", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("waypaper"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("google-chrome"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("kitty -e hx ~"))
hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd("kitty -e btop"))
hl.bind("SUPER + ALT + W", hl.dsp.exec_cmd("kitty -e nmtui connect"))
hl.bind("SUPER + ALT + B", hl.dsp.exec_cmd("blueman-manager"))
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd("pkill waybar && hyprctl reload && waybar"))
hl.bind("SUPER + ALT + E", hl.dsp.exec_cmd("~/.config/hypr/scripts/RofiEmoji.sh"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("~/.config/hypr/scripts/ClipManager.sh"))
hl.config({
    general = {
        layout = "master",
        border_size = 3,
        gaps_in = 5,
        gaps_out = 10,
        resize_on_border = true,
        col = {
            active_border = "rgb(b8bb26)",
            inactive_border = "rgb(69675B)",
        },
    },
    decoration = {
        rounding = 6,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        fullscreen_opacity = 1.0,
        dim_inactive = true,
        dim_strength = 0.2,
        blur = {
            enabled = false,
        },
    },
    animations = {
        enabled = true,
    },
    input = {
        kb_layout = "us",
        repeat_rate = 50,
        repeat_delay = 300,
        sensitivity = 1.1,
        accel_profile = "flat",
        numlock_by_default = true,
        left_handed = false,
        follow_mouse = true,
        float_switch_override_focus = false,
        touchpad = {
            disable_while_typing = false,
            natural_scroll = true,
            clickfinger_behavior = true,
            middle_button_emulation = true,
            tap_to_click = true,
            drag_lock = true,
        },
    },
    master = {
        allow_small_split = true,
        mfact = 0.67,
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        mouse_move_enables_dpms = true,
        focus_on_activate = false,
        initial_workspace_tracking = 0,
        middle_click_paste = false,
    },
    binds = {
        workspace_back_and_forth = false,
        allow_workspace_cycles = true,
        pass_mouse_when_bound = false,
    },
    xwayland = {
        force_zero_scaling = true,
    },
    cursor = {
        no_hardware_cursors = true,
        enable_hyprcursor = true,
        warp_on_change_workspace = true,
        no_warps = true,
    },
})
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60",
    position = "1920x407",
    scale    = 1.0,
})
hl.on("hyprland.start", function()
    hl.exec_cmd("~/.config/hypr/initial-boot.sh")
    hl.exec_cmd("udiskie --tray")
    hl.exec_cmd("hyprsunset -t 5000")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("swaync")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("waybar")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("awww")
    hl.exec_cmd("waypaper --restore")
end)
