# atomic-fish

A theme for the fish shell designed to work well with the Atom text editor and GitHub.

## Aliases

- `$ a [file]` => `$ atom [file]`
- `$ ..` => `$ cd ..`
- `$ gad` => `$ git add .`
- `$ gkm [MESSAGE]` => `$ git commit -m [MESSAGE]`
- `$ gst` => `$ git status`

## Potential key bindings

It may be handy to bind the "End" key's functionality to Caps Lock.
That way, the caps lock button can auto-complete commands in fish.
You can also set this up so that `shift+caps lock` has the normal caps lock functionality.

These commands can either go in /etc/rc.local (with some modifications) or in fish.config.
Note that this changes the mapping on your machine until the next restart,
or until you change it again.

```bash

xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keycode 66 = End Caps_Lock"

```
