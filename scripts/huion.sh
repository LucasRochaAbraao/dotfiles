#!/bin/sh

# Change HDMI-1 to output from command: xrandr
MONITOR="HDMI-1"

# Find the graphics tablet with the command: input
ID_STYLUS1=(xinput | grep "HUION Huion Tablet_H950P Pen" | cut -f 2 | cut -c 4-5)
ID_STYLUS2=(xinput | grep "HUION Huion Tablet_H950P Pen Pen (0)" | cut -f 2 | cut -c 4-5)

xinput map-to-output $ID_STYLUS1 $MONITOR
xinput map-to-output $ID_STYLUS2 $MONITOR

exit 0
