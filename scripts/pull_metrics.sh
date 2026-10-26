#!/usr/bin/env bash
# ==============================================================================
# Nothing X Mod — Health Metrics & Watch Diagnostics
# Dumps real-time Nothing Watch Pro 2 sync metrics and sleep timer state
# ==============================================================================
set -euo pipefail

TARGET_DEVICE="${1:-$(adb devices | grep -w "device" | head -n 1 | awk '{print $1}')}"

if [ -z "$TARGET_DEVICE" ]; then
  echo "❌ Error: No connected device found."
  exit 1
fi

echo "=========================================================="
echo " Nothing X Mod — Watch & Timer Diagnostics"
echo " Device: $TARGET_DEVICE"
echo " Time:   $(date)"
echo "=========================================================="

echo -e "\n[1] Sleep Timer Preferences State:"
adb -s "$TARGET_DEVICE" shell "cat /data/data/com.nothing.smartcenter/shared_prefs/nothing_x_sleep_timer.xml 2>/dev/null || echo 'Prefs inaccessible directly from shell; checking logs...'"

echo -e "\n[2] Recent NothingXEnhancer Logs:"
adb -s "$TARGET_DEVICE" logcat -d -s NothingXEnhancer | tail -n 35

echo -e "\n[3] Connected BLE Devices:"
adb -s "$TARGET_DEVICE" shell "dumpsys bluetooth_manager | grep -E 'connected|Bonded' | head -n 15"
