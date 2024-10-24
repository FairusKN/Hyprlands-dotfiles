#!/bin/bash

#Rus

# Idle time in seconds
IDLE_TIME=240

# idle time in seconds
while true; do
    # Check the idle time using `xprintidle`
    IDLE=$(xprintidle)

    # If the idle time is greater than or equal to $IDLE_TIME, suspend
    if [ "$IDLE" -ge "$((IDLE_TIME * 1000))" ]; then
        systemctl suspend
    fi

    # Sleep for a short duration before checking again 
    # Note : This make a tiny bit of cpu saved because not checking it again and again
    sleep 60
done

