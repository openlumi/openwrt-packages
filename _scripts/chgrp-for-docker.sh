#! /usr/bin/env bash

set -eu

usage_exit() {
        echo "Usage: $0 [-g OPENWRT_GID] [-R] TARGET" 1>&2
        exit 1
}

CHGRP_OPT=""
CHMOD_OPT=""

while getopts g:Rh OPT
do
    case $OPT in
        g)  OPENWRT_GID=$OPTARG
            ;;
        R)  CHGRP_OPT="-R"
            CHMOD_OPT="-R"
            ;;
        h)  usage_exit
            ;;
        \?) usage_exit
            ;;
    esac
done

shift $((OPTIND - 1))

if [[ ! -v OPENWRT_GID ]] ; then
    echo "Error: -g is required option." 1>&2
    usage_exit
fi

TARGET=$1

if [[ ! -e $TARGET ]] ; then
    echo "Error: '$TARGET' not exists." 1>&2
    usage_exit
fi

if [[ -z $(getent group $OPENWRT_GID) ]] ; then
    sudo groupadd -g $OPENWRT_GID openwrt
    sudo chgrp $CHGRP_OPT openwrt $TARGET
else
    sudo chgrp $CHGRP_OPT "$(getent group $OPENWRT_GID | cut -d: -f1)" $TARGET
fi
sudo chmod $CHMOD_OPT g+ws $TARGET
