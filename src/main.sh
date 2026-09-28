#!/bin/bash

commit_watch() {
    local destination
    destination="./commit_watch.log"

    case "${1:-}" in
        new)
            shift
            if [ "$#" -eq 0 ]; then
                echo "usage: commit_watch new {message}" >&2
                return 1
            fi
        printf '%s: %s\n' "$(date '+(%Y-%m-%d) %H:%M')" "$*" >> "$destination"
        echo "Commit added."
        return 0
        ;;
    esac
}
