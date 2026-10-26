# Reverse Engineering & APK Patching Guide

This guide details how the stock Nothing X APK was decompiled, patched, and rebuilt.

---

## 1. Prerequisites & Tools

- **Apktool** 2.7.0+
- **Android SDK Build-Tools** 35.0.0 (`d8`, `zipalign`, `apksigner`)
- **Java Development Kit** (OpenJDK 17 or OpenJDK 21)
- **Baksmali** / **Smali** 2.5.2+
- **ADB** (Android Debug Bridge)

---

## 2. Decompilation Workflow

The base split APK (`com.nothing.smartcenter`, v3.10.1, versionCode `3100105`) was pulled from the device:
```bash
adb shell pm path com.nothing.smartcenter
adb pull /data/app/.../base.apk
apktool d base.apk -o apk_decompiled -r
```
*Note: The `-r` flag prevents decoding binary resources into raw XML when only bytecode patching is needed.*

---

## 3. Bytecode Injection Points

### Hook 1: Activity Lifecycle & Custom Card Docking
In `apk_decompiled/smali_classes7/com/nothing/smartcenter/host/MainActivity.smali`:
```smali
.method public onPostResume()V
    .locals 1

    invoke-static {p0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->attachToMainActivity(Landroid/app/Activity;)V

    .line 362
    :try_start_0
    invoke-super {p0}, Lio/flutter/embedding/android/FlutterActivity;->onPostResume()V
```

### Hook 2: Background Keep-Alive Broadcast Receiver
In `apk_decompiled/smali_classes6/com/nothing/nt_lifecycle/receiver/KeepAliveReceiver.smali`:
```smali
    invoke-static {v4, v0}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->handleBroadcast(Landroid/content/Context;Landroid/content/Intent;)Z
    move-result v3
    if-eqz v3, :cond_sleep_timer_pass
    return-void

    :cond_sleep_timer_pass
```

### Hook 3: Device Reboot Recovery Receiver
In `apk_decompiled/smali_classes6/com/nothing/foreground/service/RebootReceiver.smali`:
```smali
    invoke-static {p1, p2}, Lcom/nothing/smartcenter/patch/NothingXEnhancer;->handleRebootBroadcast(Landroid/content/Context;Landroid/content/Intent;)V
```

---

## 4. Recompilation, Alignment, and Signing

```bash
# 1. Compile Java enhancements
javac -source 1.8 -target 1.8 -bootclasspath $ANDROID_JAR -d build_classes src/.../*.java

# 2. Convert to DEX
d8 --lib $ANDROID_JAR --min-api 26 --output build_dex build_classes/**/*.class

# 3. Disassemble DEX to Smali
baksmali d build_dex/classes.dex -o build_smali

# 4. Inject smali into smali_classes8
cp -r build_smali/com/nothing/* apk_decompiled/smali_classes8/com/nothing/

# 5. Rebuild APK
apktool b apk_decompiled -o build_unsigned.apk

# 6. Zipalign (4-byte alignment)
zipalign -f -p 4 build_unsigned.apk release/base.apk

# 7. V2/V3 Signature
apksigner sign --ks release/keystore/nothing_x_mod.keystore \
  --ks-key-alias nothingx_mod \
  --ks-pass pass:nothingx123 \
  release/base.apk
```

---

## 5. In-Place Installation to Device
Since Nothing X is installed as a multi-split APK bundle (`base.apk`, `split_config.arm64_v8a.apk`, `split_config.en.apk`, `split_config.xxhdpi.apk`), updates must be pushed using `adb install-multiple -r`:
```bash
adb install-multiple -r --user 0 --no-incremental \
  release/base.apk \
  release/split_config.arm64_v8a.apk \
  release/split_config.en.apk \
  release/split_config.xxhdpi.apk
```
This updates the application binary in-place without wiping paired Bluetooth devices or user accounts.
