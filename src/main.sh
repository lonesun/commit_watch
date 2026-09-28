#!/bin/bash

commit_watch() {
    local destination
    destination="unnamed"

    case "${1:-}" in
        new)
            if [ "$#" -eq 0 ]; then
                echo "usage: function new {message}" >&2
                return 1
            fi
        printf "$*"
    esac
}
