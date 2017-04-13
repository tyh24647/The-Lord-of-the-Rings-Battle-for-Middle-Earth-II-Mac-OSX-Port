#!/bin/bash

######################################
# Applies default resolution of the user
##################

DEFAULT_RES="1280 x 800"
800X600="800 x 600"
1024X768="1024 x 768"
1280X800="1280 x 800"
1280X1024="1280 x 1024"
1680X1050="1680 x 1050"
1440X900="1440 x 900"
1920X1080="1920 x 1080"
CUSTOM_USR_RES=""
CURRENT_USR_RES=""

grabCurrentRes() {
    TMP=$(system_profiler SPDisplayDataType | grep Resolution)
}

init() {
    if [ $CURRENT_USR_RESOLUTION -eq "" && $CUSTOM_USR_RES -eq "" ]; then
        grabCurrentRes
        init
    elif [ $CURRENT_USR_RESOLUTION -eq "" ]; then
        CURRENT_USR_RES=$CUSTOM_USR_RES
    fi
}

main() {
    init
}

main

