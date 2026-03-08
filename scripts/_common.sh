#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

debian_maj_version=$(sed 's/\..*//' /etc/debian_version)

if [ "$debian_maj_version" -eq 9 ] ; then
    pypath="python3.5"
elif [ "$debian_maj_version" -eq 10 ] ; then
    pypath="python3.7"
elif [ "$debian_maj_version" -eq 11 ] ; then
    pypath="python3.9"
elif [ "$debian_maj_version" -eq 12 ] ; then
    pypath="python3.11"
elif [ "$debian_maj_version" -eq 13 ] ; then
    pypath="python3.13"
elif [ "$debian_maj_version" -eq 14 ] ; then
    pypath="python3.15"
fi



############################################
# Function to lock a Redis database by setting a dummy key
############################################

redis_lock() {
    local db=$1
    redis-cli -n "$db" SET "ynh_lock" "locked" > /dev/null
}
############################################
# Function to unlock a Redis database by deleting the dummy key
############################################

redis_unlock() {
    local db=$1
    redis-cli -n "$db" DEL "ynh_lock" > /dev/null
}
