#!/usr/bin/env bash

case "$1" in
        start)
            echo "starting..." 
            ./4.sh
            ;;
         
        stop)
            killall 4.sh && echo "Has stopped." || echo "There were some problems with exit."
            ;;
         
        *)
            echo $"Usage: $0 {start|stop}"
            exit 1
esac