#!/usr/bin/env bash

function sync_repo() {
    local repo=$1
    local server=$2
    
    if [[ -z $repo ]]; then
        echo "Missing repository argument"
        return -1
    fi

    if [[ -z $server ]]; then
        echo "Missing server argument"
        return -1
    fi

    echo  "Syncing '$repo' into '$server'"
    local srv_path="${repo}"

    /usr/bin/rsync \
        -azP \
        --rsh=/usr/bin/ssh \
        --exclude=.git/ \
        --exclude=build/
        "{path}" \
        "${server}:${path/${HOME}/~}"
}