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

        report)
            if [ ! -f "$destination" ]; then
                echo "A file report cannot be generated because the log file does not exist." >&2
                echo "Reason: File (commit_watch.log) not found in the current working directory." >&2
            elif [ -s "$destination" ]; then
                cat "$destination"
                printf '%s: %s\n' "$(date '+(%Y-%m-%d) %H:%M')" "A file report was accessed at this time." >> "$destination"
            fi
        return 0
        ;;
    esac
}
