#!/bash/sh

# Temporary fix for the screen saver
xset s off && xset -dpms &

# Disable bell sound
xset -b &

# Set keyboard layout to latvian
setxkbmap lv &

# Start window manager
exec i3
