#!/bin/bash

#####################################################################
#
#   Rise of the Witch King Expansion Installer
#
#   This software must only be used by users with a valid
#   license key. I am not responsible for any misuse of this script
#   and/or the installation products
#
#   Type "install-rotwk-expansion --help" for usage details
#
#   AUTHOR:     tylero056
#   VERSION:    02/24/17
#
#####################################################################

INSTALLATION_DIR="$1"
USR_PRODUCT_KEY="$2"
NUM_FLAGS=$#
PROD_KEY="7FRR-P794-5MGC-X5MC-GRLD" #For testing purposes only!
DIR=cd "${BASH_SOURCE[0]}" ..
DEFAULT_ROTWK_DMG_PATH="/Volumes/ROTWK.dmg"

mv_files_to_tmp_dir() {
    if [ -d ${DEFAULT_ROTWK_DMG_PATH} ]; then
        #TODO
    fi


}

init_defaults() {
    if [ -d ${INSTALLATION_DIR} ]; then
        if [ -d ${DIR} ]; then
            #TODO
        fi
    else
        echo "ERROR: BFME2 files not found in the specified directory"
    fi
}

execute() {
    mv_files_to_tmp_dir
    
    if [ ${NUM_FLAGS} -eq 0 ]; then
        init_defaults
    elif [ ${NUM_FLAGS} -eq 1 ]; then
        config_custom_dir
    elif [ ${NUM_FLAGS} -eq 2 ]; then
        config_custom_dir
        usr_prod_key
    else
        echo "ERROR: Invalid option. You may only enter up to two parameters"
    fi
}

execute

