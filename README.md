# dotfiles by montchr

## dotfiles

Your dotfiles are how you personalize your system. These are mine.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `scripts/bootstrap`.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `scripts/bootstrap`.

## install

### git

```
.
├── aliases.zsh
├── config.zsh
├── gitconfig.symlink.example
└── gitignore.symlink
```

Check out the `git/` directory, and make sure you're comfortable with those
aliases in `aliases.zsh` and `gitconfig.symlink.example`. Don't bother renaming
`gitconfig.symlink.example`, that'll be taken care of when you run the setup
script. `gitconfig.symlink` will be symlinked to `~/.gitconfig`.

If there are any files that often end up bugging you – `.DS-Store`, for
example – now's a good time to add them to your shit list, AKA
`gitignore.symlink`. This is symlinked to `~/.gitignore`.

### homebrew

```
.
├── Brewfile
└── install.sh
```

Don't have Homebrew installed yet? No problem! `homebrew/install.sh` will take
care of you.

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

### zsh

As mentioned above, you'll want to change some of the special directories
specified in `zsh/zshrc.symlink`, as these will probably differ in your setup.

If there are any super secret things you want to include in your shell profile,
but you don't want to commit them, throw them in `~/.localrc` and they'll be
picked up automagically.

## go

If you're all ready, run this:

```sh
git clone https://github.com/montchr/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./scripts/bootstrap
./scripts/install
```

### rundown

#### ./scripts/bootstrap

`./scripts/bootstrap` will symlink the appropriate files in `~/.dotfiles` to
your home directory. Everything is configured and tweaked within
`~/.dotfiles`. It will also install your Homebrew dependencies and oh-my-zsh for the first time.

1.  If `git/gitconfig.symlink` doesn't exist, create it with your provided
    GitHub author name and email.
2.  Link all files ending with `.symlink` to the home directory. Each retains
    the same name, minus the `.symlink` part.
3.  Optionally set OS X defaults.
4.  Install Homebrew if it's not already installed. If MacPorts is detected, you
    have the option of removing it or aborting.
5.  Install the Homebrew packages listed in `homebrew/Brewfile`.
6.  Install NPM/Node packages.
7.  Install oh-my-zsh.
8.  Change default shell to the Homebrew-managed zsh in `/usr/local/bin`
9.  Copy Powerline-patched coding fonts to `~/Library/Fonts`.

#### ./scripts/install

`./scripts/install` will run every `install.sh` file in the subdirectories of
`~/.dotfiles`.

## everyday

`dot` is a simple script that installs some dependencies, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

Instead of running `brew install` to install some new thing you'd like,
consider adding it to the list of formulae in `homebrew/Brewfile`, then run
`.bin/dot`. That way, you'll have this package installed, while keeping a
record of it in your dotfiles and updating all your other brewed things.

## caveats

- If you use [ClamXav][], you may need to change owner and group on `/usr/local`, as ClamXav uses this directory as well – it's primarily used by Homebrew. When installed, ClamXav will change the owner of `/usr/local` to `root` and the group to `wheel`. It should be owned by your user and group `admin`. Still, you should change `/usr/local/clamXav` to owner `root` and group
  `wheel`. [Thanks to @yihangho for the tip][].

[clamxav]: http://www.clamxav.com/
[thanks to @yihangho for the tip]: http://www.yihangho.com/homebrew-and-clamxav/

## thanks

Most heavily based on the structure set out in [@holman's dotfiles][].

I was originally using a fork of [@necolas' dotfiles][] before I
decided to go the zsh route. I did like the way he set some things up, so I've
borrowed some of those things.

@aniketpant, for his implementation of `oh-my-zsh` with @holman's dotfile
structure.

[@holman's dotfiles]: https://github.com/holman/dotfiles
[@necolas' dotfiles]: https://github.com/necolas/dotfiles
