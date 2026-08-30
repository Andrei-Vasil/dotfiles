#!/bin/bash

if pgrep waybar ; then
  pkill waybar
else
  pkill waybar
  waybar &
fi
