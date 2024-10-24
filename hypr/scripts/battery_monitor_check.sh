#!/bin/bash

# Set the sleep interval (in seconds)
SLEEP_INTERVAL=300

while true; do
    # Get the battery percentage
    battery_percentage=$(cat /sys/class/power_supply/BAT0/capacity)

    # Check if battery is less than or equal to 20%
    if [ "$battery_percentage" -le 20 ]; then
        # Show notification
        notify-send "Battery Low" "Battery is at $battery_percentage%. Please charge your laptop."

        # Lower brightness (adjust this value as needed)
        brightnessctl set 20%
    fi

    # Sleep for the specified interval
    sleep $SLEEP_INTERVAL
done
