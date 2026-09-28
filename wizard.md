```plaintext
How does the `shift` operator work in bash? I notice that, without it, the `printf` call will include the case term **new** in the print output.
```

## How `shift` works in bash

`shift` removes the first positional parameter from the shell’s argument list.

- Before `shift`: `$1`, `$2`, `$3`, ...
- After `shift`: The value of argument `$1` is dropped, and the other arguments shift over.
    - /dev/null <- $1
    -        $1 <- $2
    -        $2 <- $3, etc.

In your script, the case operator is checking the first argument:

```bash
case "${1:-}" in
    new)
```

That means when you call the function with:

```bash
commit_watch new "fix login"
```

the shell still sees:

- `$1 = new`
- `$2 = fix login`

If you do not call `shift`, then `"$*"` still includes `new` as the first item, so the print output starts with `new`:

```bash
printf '%s: %s\n' ... "$*"
# => ... new fix login
```

After:

```bash
shift
```

the positional parameters become:

- `$1 = fix login`
- `$2 = ...` (if more args)

So `"$*"` becomes just the real message text, without the `new` case label.
