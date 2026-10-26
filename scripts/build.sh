#!/usr/bin/env bash
# ==============================================================================
# Nothing X Mod — Automated Build Pipeline
# Recompiles NothingXEnhancer & TestActivity, patches smali, rebuilds & signs APK
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
WORKSPACE="/home/shohag-rana/nothing_x_mod_workspace"

ANDROID_JAR="${ANDROID_JAR:-/home/shohag-rana/android-sdk/platforms/android-35/android.jar}"
BUILD_TOOLS="${BUILD_TOOLS:-/home/shohag-rana/android-sdk/build-tools/35.0.0}"
KEYSTORE="${REPO_ROOT}/release/keystore/nothing_x_mod.keystore"
KEY_ALIAS="nothingx_mod"
KEY_PASS="nothingx123"

echo "=== [1/6] Compiling Java Sources ==="
mkdir -p "${WORKSPACE}/build_classes" "${WORKSPACE}/build_dex" "${WORKSPACE}/build_smali"
rm -rf "${WORKSPACE}/build_classes"/* "${WORKSPACE}/build_dex"/* "${WORKSPACE}/build_smali"/*

javac -source 1.8 -target 1.8 \
  -bootclasspath "$ANDROID_JAR" \
  -d "${WORKSPACE}/build_classes" \
  "${REPO_ROOT}/src/com/nothing/smartcenter/patch/NothingXEnhancer.java" \
  "${REPO_ROOT}/src/com/nothing/nt_route/TestActivity.java"

echo "=== [2/6] Converting Java Bytecode to DEX ==="
"$BUILD_TOOLS/d8" \
  --lib "$ANDROID_JAR" \
  --min-api 26 \
  --output "${WORKSPACE}/build_dex" \
  $(find "${WORKSPACE}/build_classes" -name "*.class")

echo "=== [3/6] Disassembling DEX to Smali ==="
baksmali d "${WORKSPACE}/build_dex/classes.dex" -o "${WORKSPACE}/build_smali"

echo "=== [4/6] Injecting Smali Classes into APK Workspace ==="
rm -rf "${WORKSPACE}/apk_decompiled/smali_classes8/com/nothing/smartcenter/patch"
rm -rf "${WORKSPACE}/apk_decompiled/smali_classes8/com/nothing/nt_route/TestActivity"*.smali

mkdir -p "${WORKSPACE}/apk_decompiled/smali_classes8/com/nothing/smartcenter/patch"
cp -r "${WORKSPACE}/build_smali/com/nothing/smartcenter/patch/"* "${WORKSPACE}/apk_decompiled/smali_classes8/com/nothing/smartcenter/patch/"
cp -r "${WORKSPACE}/build_smali/com/nothing/nt_route/TestActivity"*.smali "${WORKSPACE}/apk_decompiled/smali_classes8/com/nothing/nt_route/"

# Sync smali to repo
cp -r "${WORKSPACE}/build_smali/com/nothing/smartcenter/patch/"* "${REPO_ROOT}/patches/smali/com/nothing/smartcenter/patch/"
cp -r "${WORKSPACE}/build_smali/com/nothing/nt_route/TestActivity"*.smali "${REPO_ROOT}/patches/smali/com/nothing/nt_route/"

echo "=== [5/6] Building APK via Apktool ==="
apktool b "${WORKSPACE}/apk_decompiled" -o "${WORKSPACE}/build_unsigned.apk"
"$BUILD_TOOLS/zipalign" -f -p 4 "${WORKSPACE}/build_unsigned.apk" "${REPO_ROOT}/release/base.apk"

echo "=== [6/6] Signing Modified APK Bundle ==="
for apk in "${REPO_ROOT}/release/"*.apk; do
  echo "Signing $apk..."
  "$BUILD_TOOLS/apksigner" sign \
    --ks "$KEYSTORE" \
    --ks-key-alias "$KEY_ALIAS" \
    --ks-pass "pass:$KEY_PASS" \
    --key-pass "pass:$KEY_PASS" \
    "$apk"
  "$BUILD_TOOLS/apksigner" verify "$apk"
done

echo "=========================================================="
echo "✔ BUILD SUCCESSFUL: Output APKs ready in ${REPO_ROOT}/release/"
echo "=========================================================="
