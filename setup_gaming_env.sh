#!/usr/bin/env bash

# IMPORTANT/USEFUL LINKS
# [Linux HDR Guide](https://github.com/DXC-0/Linux-HDR-Guide)
# [Arch Gaming Wikik](https://wiki.archlinux.org/title/Gaming)
# [Custom Proten GE](https://github.com/GloriousEggroll/proton-ge-custom)

# HOW TO USE:
# $ chmod 755 ./rhl_gmaing.sh
# $ ./rhl_gmaing.sh
##########################################################################

##########################################################################
# This section creates a gaming.conf file with some basic proton flags.
# This is a one time setup... 
##########################################################################

# Simple indexed array holding the exact lines to write. Could get fancier with the array but meh..
# Add your other flags, # comment, FLAG, then "" in that order...
GAMING_FLAGS=(
    "# Native Wayland is great, but watch for game-specific crashes"
    "PROTON_ENABLE_WAYLAND=1"
    ""
    "# Excellent when combined with Gamescope"
    "PROTON_ENABLE_HDR=1"
    ""
    "# Harmless if kernel support is present"
    "PROTON_USE_NTSYNC=1"
)

TARGET_FILE="$HOME/.config/environment.d/gaming.conf"
mkdir -p "$(dirname "$TARGET_FILE")"

if [ ! -f "$TARGET_FILE" ]; then
    echo "Creating $TARGET_FILE..."
    
    # Print each element of the array directly into the file
    printf "%s\n" "${GAMING_FLAGS[@]}" > "$TARGET_FILE"

    echo -e "\nDone! :D - The contents of gaming.conf are currently:\n"
    cat "$TARGET_FILE"
else
    echo "Config file already exists at $TARGET_FILE. Skipping..."
fi

