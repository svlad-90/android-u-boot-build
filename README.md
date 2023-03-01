# How to build Android u-boot?

For many people it is a mystery how to build Android u-boot on the local machine.

The one which is developed here:

https://android.googlesource.com/platform/external/u-boot/

Now you'll have a working answer:

- Create a fork of this repository
- Go to https://ci.android.com/builds/branches/aosp_u-boot-mainline/grid?
- Select the u-boot build, which you would like to build locally. Open it's artifacts.
- Inside the artifacts open the **BUILD_INFO** artifact
- Inside the BUILD_INFO JSON file find the **"parsed_manifest"** JSON object
- Manually convert all items inside the "parsed_manifest" section into the repo XML syntax and replace the conent of the **[default.xml](./default.xml)**
- Commit the changes
- Call ./build.sh inside this repository in the following way:

  ```
  ./build.sh <BUILD_DIR> <MANIFEST_URL> <MANIFEST_BRANCH> <U_BOOT_BUILD_CONFIG>
  ```

  |Parameter|Meaning|
  |---|---|
  |BUILD_DIR|Target build directory.|
  |MANIFEST_GIT_URL|URL of your fork of this repo.|
  |MANIFEST_GIT_BRANCH|The branch within the MANIFEST_GIT_URL, which you would like to use.|
  |U_BOOT_BUILD_TARGET|The **&lt;target&gt;\_&lt;arch&gt;** literal, e.g. **qemu_aarch64** or **crosvm_x86_64**|

  All parameters are mandatory. No default values applied.

  The **build.sh** script will trigger "repo init" + "repo sync" + "bazel build"

  As a quickstart, here is an example of calling a script, which should work even without a fork, right after cloning this repo:
  
  ```
  ./build.sh /mnt/manual_android_uboot_build https://github.com/svlad-90/android-u-boot-build.git master qemu_aarch64
  ```

- The resulting artifacts will bе located in **something-like-this** directory:

  ```
  ${BUILD_DIR}/out/dist/${U_BOOT_BUILD_TARGET}
  ```

I hope this small repo will help you in case if you'll decide to develop the Android u-boot.

Have a nice day! ))
