# dotfiles by montchr

## topics

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.fish` will get automatically
sourced into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `scripts/bootstrap`.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.fish**: Any files ending in `.fish` get sourced into `config.fish` first.
- **topic/path.fish**: Any file named `path.fish` is loaded next and is
  expected to setup `$PATH` or similar.
- **topic/functions**: Added to `$fish_function_path`
- **topic/completions**: Added to `$fish_complete_path`
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `scripts/bootstrap`.


### macOS defaults

```
.
└── set-defaults.sh
```

Definitely take a close look here. Everything's pretty straightforward and
self-explanatory. None of these settings should be too earth-shattering, but
you should definitely consider whether any of them will piss you off.

If you'd like to add any more of these defaults to this file, check out
[@mathiasbynens' comprehensive dotfiles][https://github.com/mathiasbynens/dotfiles/blob/master/.osx].

### Secrets

If there are any super secret things you want to include in your shell profile,
but you don't want to commit them, throw them in `~/.localrc` and they'll be
picked up automagically.

## bootstrap

If you're all ready, run this:

```sh
git clone https://github.com/montchr/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./scripts/bootstrap
./scripts/install
```


## everyday

`bin/dot` is a simple script that installs some dependencies and keeps things updated. Occasionally run `dot` from
time to time to keep your environment fresh and up-to-date.

Instead of running `brew install` to install some new thing you'd like,
consider adding it to the list of formulae in `homebrew/Brewfile`, then run
`bin/dot`. That way, you'll have this package installed, while keeping a
record of it in your dotfiles and updating all your other brewed things.


## thanks

- https://github.com/holman/dotfiles
- https://github.com/necolas/dotfiles
- https://github.com/arbelt/fish-plugin-scmpuff
- https://github.com/ginfuru/dotfiles
- https://github.com/aniketpant/dotfiles
