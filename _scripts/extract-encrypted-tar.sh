#! /usr/bin/env bash

set -eu

usage_exit() {
        echo "Usage: $0 [-K AES_KEY] [-v AES_IV] encrypted-tar-file [patternes]" 1>&2
        exit 1
}

while getopts K:iv:h OPT
do
    case $OPT in
        K)  AES_KEY=$OPTARG
            ;;
        i)
            ;;
        v)  AES_IV=$OPTARG
            ;;
        h)  usage_exit
            ;;
        \?) usage_exit
            ;;
    esac
done

shift $((OPTIND - 1))

if [[ $# -eq 0 ]]; then
    usage_exit
fi
if [[ ! -v AES_KEY || ! -v AES_IV ]]; then
    echo "Error: -K and -v are required options." 1>&2
    usage_exit
fi

ENC_TAR=$1
shift
PATTERNS="$@"

raw_tar=$(mktemp -d /tmp/XXXXXXXXX)/secret.tar

openssl aes-256-cbc -K $AES_KEY -iv $AES_IV -in $ENC_TAR -out $raw_tar -d
tar xf $raw_tar $PATTERNS
rm $raw_tar
rmdir $(dirname $raw_tar)
