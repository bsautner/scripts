#!/bin/bash
git fetch
adb kill-server
adb start-server
$ANDROID_HOME/emulator/emulator @Pixel_3_XL_API_29

