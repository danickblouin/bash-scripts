#!/bin/bash

# Device IDs
DEVICE_SONY="94-db-56-6e-d9-34"
DEVICE_NOTHING="2c-be-eb-0b-1c-ee"
BLUEUTIL_CMD="blueutil"

# Check if blueutil is installed
if ! command -v $BLUEUTIL_CMD &> /dev/null; then
    echo "$BLUEUTIL_CMD could not be found."
    read -p "Do you want to install blueutil? (y/n) " answer
    case ${answer:0:1} in
        y|Y )
            echo "Installing blueutil..."
            brew install blueutil
            if [ $? -ne 0 ]; then
                echo "Installation failed. Please install blueutil manually."
                exit 1
            fi
            ;;
        * )
            echo "blueutil is required to run this script."
            exit 1
            ;;
    esac
fi

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

