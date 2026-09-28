#!/bin/bash

commit_watch() {
    local destination
    destination="unnamed"

    case "${1:-}" in
        new)
            shift
            if [ "$#" -eq 0 ]; then
                echo "usage: function new {message}" >&2
                return 1
            fi
        printf '%s: %s\n' "$(date '+(%Y-%m-%d) %H:%M')" "$*"
    esac
}
