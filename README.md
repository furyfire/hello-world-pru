# Instructions
1. Grab http://debian.beagleboard.org/images/bone-debian-9.3-iot-armhf-2018-01-28-4gb.img.xz
2. Program a microSD card with that image using http://etcher.io
3. Boot it on a BeagleBone
4. Get connected to the Internet
5. Run the following in the shell
```sh
cd
git clone https://github.com/furyfire/hello-world-pru 
cd hello-world-pru
make
echo none > /sys/class/leds/beaglebone\:green\:usr0/trigger
sudo config-pin overlay cape-universala
sudo config-pin p9.30 pruout
sudo make run
```

You will see USR0 blinking 1 time a second (on 10ms/off 990ms). 
Modify hello-world-pru1.c as desired.

You will see P9.30 toggling as fast as possible (Frequency very close to 100MHz)
The last missing frequency is due to the extra instructions for each while loop
Modify hello-world-pru0.c as desired

# Notes

* sudo perl /opt/scripts/device/bone/show-pins.pl -v
* config-pin --help
* Bug tracker: http://bugs.elinux.org/projects/debian-image-releases
* http://elinux.org/EBC_Exercise_30_PRU_via_remoteproc_and_RPMsg
* http://elinux.org/EBC_Exercise_11b_gpio_via_mmap
* https://docs.google.com/presentation/d/1yMuyQwkYKU48LeMYnQj4sspnsbXf9niojWe_jr4BWjw/edit?usp=sharing
* http://processors.wiki.ti.com/images/3/34/Sitara_boot_camp_pru-module1-hw-overview.pdf
* http://processors.wiki.ti.com/index.php/PRU_Assembly_Instructions
* http://theduchy.ualr.edu/?p=996
* http://processors.wiki.ti.com/index.php/PRU_Projects

# Version

Debian Stretch BeagleBoard.org BeagleBone IoT Image
```sh
sudo /opt/scripts/tools/version.sh
git:/opt/scripts/:[ea6ea9fca05f36f5044398884375b0231348d6e2]
eeprom:[A335BNLT00C03317BBBK1646]
model:[TI_AM335x_BeagleBone_Black]
dogtag:[BeagleBoard.org Debian Image 2018-01-28]
bootloader:[microSD-(push-button)]:[/dev/mmcblk0]:[U-Boot 2018.01-00002-g9aa111a004]
bootloader:[eMMC-(default)]:[/dev/mmcblk1]:[U-Boot 2017.09-00002-g0f3f1c7907]
kernel:[4.9.78-ti-r94]
nodejs:[v6.13.0]
uboot_overlay_options:[enable_uboot_overlays=1]
uboot_overlay_options:[enable_uboot_cape_universal=1]
pkg:[bb-cape-overlays]:[4.4.20180126.0-0rcnee0~stretch+20180126]
pkg:[bb-wl18xx-firmware]:[1.20170829-0rcnee2~stretch+20180104]
pkg:[firmware-ti-connectivity]:[20170823-1rcnee0~stretch+20170830]
groups:[debian : debian adm kmem dialout cdrom floppy audio dip video plugdev users systemd-journal i2c bluetooth netdev cloud9ide gpio pwm eqep admin spi tisdk weston-launch xenomai]
dmesg | grep pinctrl-single
[    1.416818] pinctrl-single 44e10800.pinmux: 142 pins at pa f9e10800 size 568
END
```
