How to build CyanogenMod 7.2 for the Samsung Galaxy Player 4.2 EU/US (YP-GI1)

This is a short guide for compiling CM7 (Android 2.3.7) for the YP-GI1 on your computer.
Please don't forget to commit ALL changes you did!
If you get errors while compiling: Search on Google -> Ask at XDA
This guide requires that a full CyanogenMod 7 build environment is setten up on your PC
[To setup a build environment:
 1. Follow all steps for Linux: http://source.android.com/source/initializing.html
 2. Then follow these steps: http://www.zimbio.com/Linux/articles/ugafotvIwWk/How+build+CyanogenMod+source (Step 1-5)]

1. Add the following lines to <source_path>/.repo/manifest.xml
  <project name="androthan/android_device_samsung_hugo" path="device/samsung/hugo" remote="github" revision="master" />
  <project name="zaclimon/android_vendor_samsung_hugo" path="vendor/samsung/hugo" remote="github" revision="gingerbread" />

2. Open terminal
  - cd <source_path>
  - repo sync

3. Build
  - source build/envsetup.sh
  - ./vendor/cyanogen/get-rommanager
  - breakfast hugo
  - brunch hugo          ### This will start your build

4. After your build completed open your output zip and direct to META-INF/com/google/android/updater-script and replace:

assert(package_extract_file("boot.img", "/tmp//dev/block/mmcblk0p5.img"),
      write_raw_image("/tmp//dev/block/mmcblk0p5.img", "/dev/block/mmcblk0p5"),
      delete("/tmp//dev/block/mmcblk0p5.img"));

through:
assert(package_extract_file("boot.img", "/tmp/boot.img"),
      write_raw_image("/tmp/boot.img", "/dev/block/mmcblk0p5"),
      delete("/tmp/boot.img"));

5. Save 

Install an open-source build
1. Rename <source_path>/out/target/product/hugo/boot.img to normalboot.img
2. Pack this normalboot.img into a tar-file
3. Flash this tar-file via ODIN3 to your device
4. Reboot device into ClockworkMod (HOME + POWER + VOL+ ; release POWER when you see the Samsung logo)
5. Do a factory reset 
6. Mount USB storage on PC and copy your CyanogenMod-7.2 zip
7. Unmount device from PC and install this zip-file
8. Reboot and enjoy!

//GI1
