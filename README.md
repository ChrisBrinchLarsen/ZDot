# Introduction
This is a very comprehensive Arch Linux installation guide (using archinstall) as well as how to set up my dotfiles (term for "." prefixed configuration files for the confused). Feel free to use the table of contents to skip part any part that is trivial or unnecessary for you. I'm a newcomer to Linux myself and would've loved a super comprehensive guide, so that's why some of the steps might seem very basic to people well-versed in Linux and operating systems in general.

# DISCLAIMER
I am very much a novice when it comes to everything programming and Linux related, this guide is mostly written for myself to help nail down my understanding of the vast amount of information I've needed to consume in a short amount of time to get me as far as I've come with my system. Some information in here may be plain wrong, bad decisions etc. which I fully expect, take everything with a grain of salt and I strongly encourage you do your own research at all times.

# What are you getting?
Add screenshots/showcase video.

# Table of contents
Need to make a table of contents here

# Arch Installation
## Creating a bootable USB
First, you'll want to find the most recent arch ISO file from the [archlinux.org](https://archlinux.org/download/) downloads page. It's possible to obtain an image file from a direct mirror server download, but it's generally not recommended as these are independent distributors and could've altered the release. Generally, I would recommend downloading [qBittorrent](https://www.qbittorrent.org/) and downloading the iso via the provided torrent. From there it's possible to do a hash sum verification to make sure you have the correct ISO (I usually can't be bothered).

Once you have the ISO file on hand, you'll need to turn a USB device (4 GiB is plenty) into a bootable USB with any tool you have available, common tools include [Rufus](https://rufus.ie/en/) and [UNetbootin](https://unetbootin.github.io/). These allow you to turn a regular USB device into a device that the master boot record will be able to recognize as a device to boot from. 

## Booting from USB
### Entering BIOS/UEFI
After hopefully backing up all your important files from your previously installed system that you don't want to lose (there will be no going back soon) we're ready to boot from the USB that we formatted in the previous section. We will need to enter what's known as the BIOS (**B**asic **I**nput/**O**utput **S**ystem) or UEFI (**U**nified **E**xtensible **F**irmware **I**nterface) environment. To enter this environment you will need to know the required key input during the regular boot process, this differs depending on your specific motherboard model. You can either do some research to figure out which key is correct for your motherboard, but more often than not the correct key is displayed during a logo screen during the booting process. If all else fails you can try to spam some of the common keys, these are DELETE, ESCAPE, F1, F2, F10, F12. 

### Changing boot order
Once inside the bios menu, you need to locate a list of bootable drives, this list is usually fairly easy to identify. It'll have your main drives and additionally the name of the bootable USB device you have plugged in. When you've identified the list, you wanna drag the USB to the top of the priority list, this tells your system from which drive to first attempt to boot from. When you've moved it to the top, accept your changes and continue the boot process, leaving the BIOS/UEFI.

## Setting up an internet connection
Skip this section if you're already connected via Ethernet. This section is purely for configuring a wireless connection, as that will be paramount to being able to continue the installation. My method here is directly inspired by the [archwiki](https://wiki.archlinux.org/title/Network_configuration/Wireless#iw) page on the topic.

First we need to get the name of your wireless interface using the command `$ iw dev`, this should hopefully provide you with an interface name starting with 'wl', something like 'wlan0' is typical. From now on we will call the name you just found your *interface*. Some cards require to be set up, as such we should execute `# ip link set [interface] up` to be sure (omit the brackets and replace your interface). 
TODO: Finish the wifi section

## Archinstall Script
In 2021, the [archinstall script](https://wiki.archlinux.org/title/archinstall) was introduced as an easy alternative for a quick Arch installation without all the hassle required since 2002. We will be making use of this script too, to engage it, run `$ archinstall`. You should be greeted with a list of options, I will be going through each of them now.
* Archinstall Language - If you're reading this guide you're likely to just keep this as English.
* Mirrors - Scroll down the list or press '/' to initiate a search for your country, this will ensure faster downloads (select using space).
* Locales - Choose your keyboard layout and your system language
* Disk configuration - Choose the disk you would like to format and install Arch Linux on, then you're greeted with a choice for a filesystem type, I usually go with ext4 because it's what I've gotten used to, but if you want to be able to create full snapshots of your system using tools like [Timeshift](https://teejeetech.com/timeshift/) you need to choose btrfs. I'm really completely ignorant on this point and should do some more research myself on it. Feel free to choose whichever one you deem better from taking a quick look around.
* Disk Encryption - I haven't messed with this one, but it might be useful if you're keeping sensitive data on your device and fear loosing your device could be deeply compromising.
* Bootloader - I choose systemd here, but Grub seems good as well.
* Swap - Leave as true.
* Hostname - You can change this if you want, but I usually keep it as archlinux.
* Root Password - I usually leave this empty for a personal computer.
* User Account - Create your account and choose a password, make sure to allow yourself sudo privileges (**s**uper-**u**ser **do**)
* Profile - We're going to be using DWM as a desktop manager, which is an [X11](https://en.wikipedia.org/wiki/X_Window_System) based application, so we can choose xorg as our profile here, this will do some of our setup for us. If you're on an nvidia card, you can usually choose nvidia proprietary drivers in the following menu, but this choice may vary depending on your card, see the [nvidia](https://wiki.archlinux.org/title/NVIDIA) section of the arch wiki for more information.
* Audio - Choose pipewire
* Kernels - Leave as Linux for now
* Additional Packages - Here we can provide a space separated list of packages we want to install during the arch installation process. If you're feeling up for it, you can copy the following packages to the list: git fastfetch nano neovim firefox base-devel linux-headers thunar ttf-roboto-mono-nerd ttf-jetbrains-mono noto-fonts-emoji
* Network configuration - Choose copy from ISO if you're on Ethernet and NetworkManager if you're on WiFi.
* Timezone - Search for your timezone
* Optional Repositories - Enable the multilib repository, this allows us to find official packages for 32-bit applications not available in the regular core or extra repositories.

Once you're confident in your option selection, go ahead and press 'Install', you then need to press enter to confirm your options a final time before reformatting your selected drive. Congratulations you're now installing Arch Linux, go grab a snack while we wait for the installation.
