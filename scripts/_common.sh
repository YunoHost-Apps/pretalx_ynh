#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

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
