# Package setup notes

## How it works

- `package-quickstart t` (in Custom) pre-compiles a cache so package
  activation before init.el is fast (~50ms floor).
- `(require 'package)` loads package.el to get variable definitions
  (needed because Custom defers `package-selected-packages` without it).
- The `seq-some` check avoids calling `package-install-selected-packages`
  when all packages are already installed. This matters because
  `package-install-selected-packages` triggers `package-initialize`
  internally, which costs ~170ms scanning elpa/.
- On a normal startup (nothing missing): ~120ms.
- When a package is missing: slower (refreshes archives + installs).
  Wrapped in `with-demoted-errors` so a network failure won't abort
  the rest of init.el.
- If the quickstart cache is missing, it's regenerated on startup.

## Upgrading packages

`package-install-selected-packages` only installs *missing* packages.
To upgrade to newer versions:

    M-x package-refresh-contents
    M-x package-install-selected-packages

Or interactively: `M-x list-packages`, then `U x`.

## package-quickstart

The quickstart cache lives at `~/.emacs.d/package-quickstart.el(.elc)`.
It's regenerated automatically by `package-install`. If things get weird,
delete it and restart — Emacs falls back to the slow path and
`package-install` will regenerate it.

## Why not package-initialize?

`package-initialize` costs ~170ms because it scans elpa/ and reads all
archive contents, even when quickstart already activated everything.
Calling it defeats the purpose of quickstart.
