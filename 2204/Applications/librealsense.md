# Install RealSense SDK & librealsense
From [librealsense/doc/installation.md](https://github.com/IntelRealSense/librealsense/blob/master/doc/installation.md)

## Install dependencies
1. Make Ubuntu up-to-date including the lastest stable kernel
```(bash)
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade
```

2. Install the core packages required to build librealsense binaries and the affected kernel modules
```(bash)
sudo apt-get install libssl-dev libusb-1.0-0-dev libudev-dev pkg-config libgtk-3-dev
```

3. Install build tools
```(bash)
sudo apt-get install git wget camke build-essential
```

4. Prepare Linux Backend and the Dev. Environment
   - Unplug any connected Intel RealSense camera and run
        ```(bash)
        sudo apt-get install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev at
        ```

## Install librealsense2
1. Clone or download the latest stable version of librealsense2
   - Clone the *librealsens2* repo
        ```(bash)
        git clone https://github.com/IntelRealSense/librealsense.git
        ```
   - Download and unzip the latest stable *librealsense2* version from `master` branch
        [IntelRealSense.zip](github.com/IntelRealSense/lilbrealsense/archive/master.zip)

2. Run Intel RealSense permissions script from *librealsense2* root directory
    ```(bash)
    ./scripts/setup_udev_rules.sh
    ```
3. Build and apply patched kernel modules for:
   - Ubuntu 20/22 (focal/jammy) with LTS kernel 5.13, 5.15, 5.19, 6.2, 6.5
        `./scripts/patch-realsense-ubuntu-lts-hwe.sh`
**Note:** what the `*.sh` script perform? The script above will download, patch and build realsense-affected kernel modules (drivers).
Then it will attempt to insert the patched module instead of the active one. If failed the original uvc modules will be restored.
> Check the patched modules installation by examining the generateed log as well as inspecting the latest entries in kernel log: `sudo dmesg | tail -n 50`
> The log should indicate that a new *uvcvideo* driver has been registered.
> Refer to **Troubleshooting** in case of errors/warning reports.

## Building librealsense2 SDK
- Navigate to *librealsense2* root dicrectory and run
    ```(bash)
    mkdir build && cd build
    ```

- Run cmake configure step, here are some cmake configure examples: The default build is set to produce the core shared object and unit-tests binaries in Debug mode. Use `-DCMAKE_BUILD_TYPE=Release` to build with optimizations.
    ```(bash)
    cmake ../
    ```

    Builds *librealsense2* along with the demos and tutorials
    ```(bash)
    cmake ../ -DBUILD_EXAMPLES=true
    ```

    For systems without OpenGL or X11 build only textual examples
    ```(bash)
    cmake ../ -DBUILD_EXAMPLES=true -DBUILD_GRAPHICAL_EXAMPLES=false
    ```
- Recompile and install *librealsense2* binaries
    ```(bash)
    sudo make uninstall && make clean && make && sudo make install
    ```

    **Note:** Only relevant to CPUs with more than 1core: use `make -j$(($(nproc))-1) install` allow parallel compilation.
    **Note:** The shared object will be installed in `/usr/local/lib`, header files in `/usr/local/inclue`.
    The binary demos, tutorials and test files will be copied into `usr/local/bin`.
    **Note:** Linux build configuration is presently configured to use the V4L2 backend by default.
    **Note:** If you encounter the following error during compilation `gcc: internal compiler error` it might indicate that you do not have enough memory or swap space on your machine.
    Try closing memory consuming applications, and if you are running inside a VM, increase available RAM to at least 2GB.
    **Note:** You can find more information about the available configuration options on [this wiki page](https://github.com/IntelRealSense/librealsense/wiki/Build-Configuration).