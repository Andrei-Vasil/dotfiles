#!/bin/bash

if pgrep waybar ; then
  pkill waybar
else
  pkill waybar
  pkill swaync
  waybar &
  swaync &
fi
