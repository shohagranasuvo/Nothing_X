#!/usr/bin/env bash
# ==============================================================================
# Nothing X Mod — Device Installation Script
# Installs modified base & split APK bundle in-place to connected Android phone
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
RELEASE_DIR="${REPO_ROOT}/release"

# Find target device
DEVICES=($(adb devices | grep -w "device" | awk '{print $1}'))
if [ ${#DEVICES[@]} -eq 0 ]; then
  echo "❌ Error: No authorized Android device found via ADB."
  echo "Connect your device via USB with USB debugging enabled, then retry."
  exit 1
fi

TARGET_DEVICE="${1:-${DEVICES[0]}}"
echo "Targeting device: $TARGET_DEVICE"

echo "=== Installing Nothing X Mod Split Bundle ==="
adb -s "$TARGET_DEVICE" install-multiple -r --user 0 --no-incremental \
  "${RELEASE_DIR}/base.apk" \
  "${RELEASE_DIR}/split_config.arm64_v8a.apk" \
  "${RELEASE_DIR}/split_config.en.apk" \
  "${RELEASE_DIR}/split_config.xxhdpi.apk"

echo "=== Launching Nothing X ==="
adb -s "$TARGET_DEVICE" shell "am force-stop com.nothing.smartcenter"
sleep 1
adb -s "$TARGET_DEVICE" shell "am start -n com.nothing.smartcenter/com.nothing.smartcenter.host.MainActivity"

echo "✔ Installation complete! Nothing X is now running."
