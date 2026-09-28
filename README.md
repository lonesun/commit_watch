## Overview

`commit_watch` is a short terminal function that I recently re-wrote from scratch. It is useful for taking timestamped notes while in the midst of working on something. The idea came to me because a neighbour asked for my help archiving her old photo albums, and I needed a way to log my efforts.

### What It Does

The program declares a **local variable**, `destination`, and defines it as a file in the current working directory called `commit_watch.log`.

```bash
commit_watch() {
    local destination
    destination="./commit_watch.log"
}
```

Current, the function accepts two arguments, `new` and `report`:

```bash
commit_watch() {
    # ... omitted code ...

    case "${1:-}" in
        new)
            # Implementation for `new` argument
            ;;
        report)
            # Implementation for `report` argument
            ;;
        *)
            # Handles any unknown commands
    esac
}
```

Note: There is a pretty interesting and manually curated write-up at commit `2ee083b` on the `shift` macro in Bash, which made this reinvention worthwhile.

# Installation

I don't know how to install shellscripts someplace like `~/bin/` or `/usr/local/bin/` yet, so what I have been doing is appending my local `.bashrc` file:

```bash
# source commit_watch function
for file in "path/to/commit_watch/src/main.sh; do
    [ -f "$file" ] && source "$file"
done
```

There is probably a more elegant way of doing this, but I don't know what it is yet. Obviously, the destination needs to reflect wherever you clone/unzip the repo.

To check if the function is available, you can either open up a new terminal, or add this hot-reload function to `.bashrc` as well:

```bash
# hot-reload bashrc
reload_bashrc() {
    source "/home/$USER/.bashrc"
    echo "--------------------------------------"
    echo ".bashrc was hot-reloaded successfully."
}
```

If everything went smoothly, then you will be able to use the function `commit_watch` from the terminal.
