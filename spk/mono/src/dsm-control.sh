#!/bin/sh

# Package
PACKAGE="mono"
DNAME="Mono"

case $1 in
    start)
        exit 0
        ;;
    stop)
        exit 0
        ;;
    status)
        exit 0
        ;;
    log)
        exit 1
        ;;
    *)
        exit 1
        ;;
esac
