#!/usr/bin/env bash

# Get the connected monitors
CONNECTED_MONITORS=$(xrandr --query | awk '/ connected/ {print $1}')

if [ $(echo "$CONNECTED_MONITORS" | wc -l) -gt 1 ]; then
    echo_info "Multiple monitors detected:"
    echo_info "$CONNECTED_MONITORS"
    MONITOR=$(echo "$CONNECTED_MONITORS" | shuf -n 1)
    echo_info "Randomly mapping the graphics tablet to '$MONITOR'."
else
    MONITOR=$CONNECTED_MONITORS
    echo_info "Monitor detected on: $MONITOR."
fi

# Find the graphics tablet and map it to the active monitor
STYLUS1_ID=$(xinput | grep "HUION Huion Tablet_H950P Pen" | cut -f 2 | cut -c 4-5)
STYLUS2_ID=$(xinput | grep "HUION Huion Tablet_H950P Pen Pen (0)" | cut -f 2 | cut -c 4-5)

if test -n "$STYLUS1_ID"; then
    echo_info "Mapping huion tablet to monitor '$MONITOR'."
    xinput map-to-output $STYLUS1_ID $MONITOR
fi

if test -n "$STYLUS2_ID"; then
    echo_info "Mapping huion tablet to monitor '$MONITOR'."
    xinput map-to-output $STYLUS2_ID $MONITOR
fi

if ! [ -n "$STYLUS1_ID" ] && ! [ -n "$STYLUS2_ID" ]; then
    echo_warn "Couldn't find any graphics tablet or stylus. Make sure it's plugged in correctly and check 'xinput'."
else
    echo_info "Possible Stylus IDs. In case you want to change the active monitor (current:$MONITOR), run:"
    echo_info "xinput map-to-output [$STYLUS1_ID or $STYLUS2_ID] [a monitor from the list above]"
fi
