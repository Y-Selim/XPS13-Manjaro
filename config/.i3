# mod key
set $mod Mod4

# Configure border style <normal|1pixel|pixel xx|none|pixel>
new_window pixel 0
new_float normal

# Hide borders
hide_edge_borders none

# change borders
bindsym $mod+u border none
bindsym $mod+y border pixel 1
bindsym $mod+n border normal

# Use Mouse+$mod to drag floating windows
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec terminal

# kill focused window
bindsym $mod+Shift+x kill

# start program launcher
bindsym $mod+space exec --no-startup-id rofi -show drun -fullscreen

################################################################################################
## sound-section - DO NOT EDIT if you wish to automatically upgrade Alsa -> Pulseaudio later! ##
################################################################################################
bindsym $mod+Ctrl+m exec terminal -e 'alsamixer'
################################################################################################

# Start Applications
bindsym $mod+Ctrl+b exec terminal -e 'bmenu'
bindsym $mod+Shift+F3 exec gksu pcmanfm
bindsym $mod+t exec --no-startup-id pkill compton
bindsym $mod+Ctrl+t exec --no-startup-id compton -b
bindsym Print exec --no-startup-id i3-scrot
bindsym $mod+Print --release exec --no-startup-id i3-scrot -w
bindsym $mod+Shift+Print --release exec --no-startup-id i3-scrot -s
bindsym $mod+Ctrl+x --release exec --no-startup-id xkill

# change focus
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split orientation
bindsym $mod+h split h;exec notify-send 'tile horizontally'
bindsym $mod+v split v;exec notify-send 'tile vertically'

# toggle fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# focus the parent container
bindsym $mod+a focus parent

#navigate workspaces next / previous
bindsym $mod+Ctrl+Right workspace next
bindsym $mod+Ctrl+Left workspace prev

# Workspace names
# something like: set $ws1 1:mail
#                 set $ws2 2:
set $ws1 1:code
set $ws2 2:terminal
set $ws3 3
set $ws4 4
set $ws5 5:
set $ws6 6:vp-chrome
set $ws7 7:firefox
set $ws8 8

# switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8

# Move focused container to workspace
bindsym $mod+Ctrl+1 move container to workspace $ws1
bindsym $mod+Ctrl+2 move container to workspace $ws2
bindsym $mod+Ctrl+3 move container to workspace $ws3
bindsym $mod+Ctrl+4 move container to workspace $ws4
bindsym $mod+Ctrl+5 move container to workspace $ws5
bindsym $mod+Ctrl+6 move container to workspace $ws6
bindsym $mod+Ctrl+7 move container to workspace $ws7
bindsym $mod+Ctrl+8 move container to workspace $ws8

# Move to workspace with focused container
bindsym $mod+Shift+1 move container to workspace $ws1; workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2; workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3; workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4; workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5; workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6; workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7; workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8; workspace $ws8

# Open applications# Open specific applications in floating mode
for_window [title="alsamixer"] floating enable border pixel 1
for_window [class="Calamares"] floating enable border normal
for_window [title="File Transfer*"] floating enable
for_window [class="Galculator"] floating enable border pixel 1
for_window [class="Nitrogen"] floating enable sticky enable border normal
for_window [class="Pavucontrol"] floating enable
for_window [class="qt5ct"] floating enable sticky enable border normal
for_window [class="Qtconfig-qt4"] floating enable sticky enable border normal
for_window [class="Skype"] floating enable border normal

# switch to workspace with urgent window automatically
for_window [urgent=latest] focus

# reload the configuration file
bindsym $mod+Shift+c reload

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart

# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# Set shut down, restart and locking features
bindsym $mod+q mode "$mode_system"
set $mode_system (l)ock, (e)xit, switch_(u)ser, (s)uspend, (h)ibernate, (r)eboot, (Shift+s)hutdown
mode "$mode_system" {
    bindsym l exec --no-startup-id i3exit lock, mode "default"
    bindsym s exec --no-startup-id i3exit suspend, mode "default"
    bindsym u exec --no-startup-id i3exit switch_user, mode "default"
    bindsym e exec --no-startup-id i3exit logout, mode "default"
    bindsym h exec --no-startup-id i3exit hibernate, mode "default"
    bindsym r exec --no-startup-id i3exit reboot, mode "default"
    bindsym Shift+s exec --no-startup-id i3exit shutdown, mode "default"

    # exit system mode: "Enter" or "Escape"
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

# Resize window (you can also use the mouse for that)
bindsym $mod+r mode "resize"
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode
        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 5 px or 5 ppt
        bindsym k resize grow height 5 px or 5 ppt
        bindsym l resize shrink height 5 px or 5 ppt
        bindsym odiaeresis resize grow width 5 px or 5 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # exit resize mode: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

# Lock screen
bindsym $mod+9 exec --no-startup-id blurlock
bindsym $mod+0 exec --no-startup-id blacklock

# Autostart applications
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
exec --no-startup-id nitrogen --restore; sleep 1; compton -b
exec --no-startup-id nm-applet
exec --no-startup-id xfce4-power-manager
exec --no-startup-id pamac-tray
exec --no-startup-id clipit
exec --no-startup-id start_conky_maia
exec --no-startup-id xautolock -time 5 -locker blurlock
exec_always --no-startup-id fix_xcursor


#############################
### settings for i3bar: ###
#############################
# Start i3bar to display a workspace bar (plus the system information i3status if available)
bar {
	status_command i3status
	position top

	bindsym button4 nop
	bindsym button5 nop
	font xft:Noto Sans 10.5
	strip_workspace_numbers yes

	colors {
		background #2B2C2B
                statusline #F9FAF9
		separator  #454947

#                                  border  backgr. text
		focused_workspace  #F9FAF9 #16A085 #2B2C2B
		active_workspace   #595B5B #353836 #FDF6E3
		inactive_workspace #595B5B #353836 #EEE8D5
		urgent_workspace   #16A085 #FDF6E3 #E5201D
	}
}

# hide/unhide i3status bar
bindsym $mod+m bar mode toggle

# Theme colors
# class                 border  backgr. text    indic.  child_border
client.focused          #808280 #808280 #80FFF9 #FDF6E3
client.focused_inactive #434745 #434745 #16A085 #454948
client.unfocused        #434745 #434745 #16A085 #454948
client.urgent           #CB4B16 #FDF6E3 #16A085 #268BD2
client.placeholder      #000000 #0c0c0c #ffffff #000000 #0c0c0c
client.background       #2B2C2B


# Manjaro Legacy Rules
bindsym $mod+Shift+d --release exec "killall dunst; exec notify-send 'restart dunst'"

#############################
### settings for i3-gaps: ###
#############################

# Set inner/outer gaps
gaps inner 10
gaps outer -4

# Additionally, you can issue commands with the following syntax. This is useful to bind keys to changing the gap size.
# gaps inner|outer current|all set|plus|minus <px>
# gaps inner all set 10
# gaps outer all plus 5

# Smart gaps (gaps used if only more than one container on the workspace)
smart_gaps on

# Smart borders (draw borders around container only if it is not the only container on this workspace) 
# on|no_gaps (on=always activate and no_gaps=only activate if the gap size to the edge of the screen is 0)
smart_borders on

# Press $mod+Shift+g to enter the gap mode. Choose o or i for modifying outer/inner gaps. Press one of + / - (in-/decrement for current workspace) or 0 (remove gaps for current workspace). If you also press Shift with these keys, the change will be global for all workspaces.
set $mode_gaps Gaps: (o) outer, (i) inner
set $mode_gaps_outer Outer Gaps: +|-|0 (local), Shift + +|-|0 (global)
set $mode_gaps_inner Inner Gaps: +|-|0 (local), Shift + +|-|0 (global)
bindsym $mod+Shift+g mode "$mode_gaps"

mode "$mode_gaps" {
        bindsym o      mode "$mode_gaps_outer"
        bindsym i      mode "$mode_gaps_inner"
        bindsym Return mode "default"
        bindsym Escape mode "default"
}
mode "$mode_gaps_inner" {
        bindsym plus  gaps inner current plus 5
        bindsym minus gaps inner current minus 5
        bindsym 0     gaps inner current set 0

        bindsym Shift+plus  gaps inner all plus 5
        bindsym Shift+minus gaps inner all minus 5
        bindsym Shift+0     gaps inner all set 0

        bindsym Return mode "default"
        bindsym Escape mode "default"
}
mode "$mode_gaps_outer" {
        bindsym plus  gaps outer current plus 5
        bindsym minus gaps outer current minus 5
        bindsym 0     gaps outer current set 0

        bindsym Shift+plus  gaps outer all plus 5
        bindsym Shift+minus gaps outer all minus 5
        bindsym Shift+0     gaps outer all set 0

        bindsym Return mode "default"
        bindsym Escape mode "default"
}
