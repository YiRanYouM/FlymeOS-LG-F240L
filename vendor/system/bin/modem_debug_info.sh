#!/system/bin/sh

if [ -d /data/logger ]; then
    if [ ! -f /data/logger/modem_debug_info ]; then
        targetswversion=`getprop ro.lge.swversion`
        if [ $targetswversion ]; then
            targetfactoryversion=`getprop ro.lge.factoryversion`
            if [ $targetfactoryversion ]; then
                targetserialno=`getprop ro.serialno`
                if [ $targetserialno ]; then
                    echo "SW VER: $targetswversion" >> /data/logger/modem_debug_info
                    echo "Factory VER: $targetfactoryversion" >> /data/logger/modem_debug_info
                    echo "Serial No: $targetserialno" >> /data/logger/modem_debug_info
                    chmod 664 /data/logger/modem_debug_info
                fi
            fi
        fi
    fi
fi