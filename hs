#!/bin/bash

# Device IDs
DEVICE_SONY="94-db-56-6e-d9-34"
DEVICE_NOTHING="2c-be-eb-0b-1c-ee"
BLUEUTIL_CMD="blueutil"

# Function to connect to a device
connect_device() {
    if [ `$BLUEUTIL_CMD --is-connected $2` -eq 0 ]; then
        echo "Connecting to $1..."
        $BLUEUTIL_CMD --connect $2
    else
        echo "$1 is already connected."
    fi
}

# Function to disconnect a device
disconnect_device() {
    if [ `$BLUEUTIL_CMD --is-connected $2` -eq 1 ]; then
        echo "Disconnecting $1..."
        $BLUEUTIL_CMD --disconnect $2
    else
        echo "$1 is already disconnected."
    fi
}

# Main logic using case statement
case $1 in
    "-cs")
        connect_device "Sony" $DEVICE_SONY
        ;;
    "-cn")
        connect_device "Nothing" $DEVICE_NOTHING
        ;;
    "-ds")
        disconnect_device "Sony" $DEVICE_SONY
        ;;
    "-dn")
        disconnect_device "Nothing" $DEVICE_NOTHING
        ;;
    *)
        echo "Invalid option. Use -cs, -cn, -ds, or -dn."
        ;;
esac

