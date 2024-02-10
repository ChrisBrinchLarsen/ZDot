#ifndef masterConfig_H_   /* Include guard */
#define masterConfig_H_

// Colorscheme
// static const char mainColorLight[8]     = "#30FFA4";
// static const char mainColorLessLight[8] = "#5FBE92";
// static const char mainColorLessDark[8]  = "#044B4A";
// static const char mainColorDark[8]      = "#031624";

static const char mainColorLight[8]     = "#a8a8a8";
static const char mainColorLessLight[8] = "#4a4a4a";
static const char mainColorLessDark[8]  = "#1a1a1a";
static const char mainColorDark[8]      = "#070707";

// Fonts
static const char dwmFont[]      = "RobotoMono Nerd Font Propo:style=Bold:size=13"; // Shouldn't this be pixelsize?
static const char dmenuFont[]    = "RobotoMono Nerd Font:style=Bold:pixelsize=16:antialias=true:autohint=true";
static const char stFont[]       = "JetBrains Mono Medium:pixelsize=16:antialias=true:autohint=true";
static char *backUpFonts[] = {
    "Noto Color Emoji:pixelsize=16:antialias=true:autohint=true",        // Emojies and icons
    // "Hack Nerd Font Propo:pixelsize=19:antialias=true:autohint=true", // Nerd Icons, already included in the emoji fonts, only uncomment this if we use nvim powerline at some point
    // "Source Han Sans JP:pixelsize=16:antialias=true:autohint=true",   // Japanese
    // "OpenMoji Color:pixelsize=16:antialias=true:autohint=true",       // Other emoji variants
    // Twemoji:pixelsize=16:antialias=true:autohint=true",               // Other emoji variants
    // "JoyPixels:pixelsize=16:antialias=true:autohint=true",            // Other emoji variants
};

// Opacity (Picom has to be running)
static const unsigned int dwmAlpha   = 0xED; // 93%
static const unsigned int dmenuAlpha = 0xA6; // 65%
static const float stFocused   = 0.9;
static const float stUnfocused = 0.7;

// dwm configuration
static const int barEnabled          = 1; // 1 for having the bar enabled, 0 for no bar
static const int barAtTop            = 1; // 1 for bar at top, 0 for bar at bottom
static const unsigned int borderSize = 3; // Size of the border of each window
static const unsigned int gapSize    = 8; // Size of the gap between windows
static const unsigned int snapTicks  = 5; // Interval of snapping position when in floating mode
static const char ws1[] = "";
static const char ws2[] = "";
static const char ws3[] = "";
static const char ws4[] = "󰺵";
static const char ws5[] = "󰙯";
static const char ws6[] = "󰎆";
static const char ws7[] = "";
static const char ws8[] = "";
static const char ws9[] = "";
static const char tiledIcon[] = "󰝘";
static const char floatingIcon[] = "󱨈";
static const char monocleIcon[]  = "[M]";
// TODO: Add support for window rules

// Keybinds
static const char terminal[] = "st";        // alt+shift+enter
static const char browser[]  = "librewolf"; // alt+b
// TODO: Add support for choosing the actual binding key as well

// dmenu configuration
static const int topOrBottom      = 1;   // 1 for top, 0 for bottom (doesn't matter if centered enabled)
static const int dmenuCentered    = 1;   // 0 for non centered, 1 for centered
static const int dmenuMinWidth    = 250; // Minimum width of dmenu
static const int dmenuLines       = 5;   // amount of horizontal lines in menu
static const int dmenuBorderWidth = 2;   // Width of the dmenu border                               
// TODO: Add support for the partly highlighted colors, they're just yellow rn

// st configuration
static const int stborderpx = 1; // Pixels from text to edge
static const unsigned int cursorType = 2; // 2 = "█", 4 = "_", 6 = "|", 7 = "☃"


// slstatus configuration
static const unsigned int updateInterval    = 1000; // Update interval tick rate
static const char pathToHome[]       = "/home/zupreme/"; // Used to display disk-space
static const char pathToPkgCountTXT[] = "/home/zupreme/suckless/slstatus/pkgCount.txt"; // Used to display amount of currently downloaded packages
// TODO: Add support for choosing icons for the individual status elements

#endif
