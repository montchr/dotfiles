# montchr does dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you.
[Fork it](https://github.com/montchr/dotfiles/fork), remove what you don't
use, and build on what you do use.

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
  symlinked in when you run `script/bootstrap`.

## install

First, you'll want to take a look at the files in `.dotfiles` and make any necessary changes.

To get started:

```sh
git clone https://github.com/montchr/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

## prune

You weren't just going to do everything I told you to do, right? Make sure you have some sense of what's going on here. You don't need to understand all the intricacies – they'll become clearer as you work with this stuff. Trust me. ;)

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

### git

Check out the `git/` directory, and make sure you're comfortable with those aliases in `aliases.zsh` and `gitconfig.symlink.example`. Don't bother renaming `gitconfig.symlink.example`, that'll be taken care of when you run the setup script. `gitconfig.symlink` will be symlinked to `~/.gitconfig`.

If there are any files that often end up bugging you – `.DS-Store`, for example – now's a good time to add them to your shit list, AKA `gitignore.symlink`. This is symlinked to `~/.gitignore`.

### homebrew

Don't have Homebrew installed yet? No problem! `homebrew/install.sh` will take care of you.

Wondering what the hell is Homebrew? [Check out this article on Tuts+](http://computers.tutsplus.com/tutorials/homebrew-demystified-os-xs-ultimate-package-manager--mac-44884) for a solid, plain-English explanation.

Do you have MacPorts installed? If so, now might be a great time to consider switching to using Homebrew...

Add any things you'll always need installed first and foremost. Or just run `brew install` as needed later on.

### node

Even if you aren't a Node.JS developer (I'm not), there's a strong chance you will still be using something powered by Node (I still am). Like [Bower](http://bower.io/). Or [Grunt](http://gruntjs.com/).

The `node/install.sh` script will install Node for you if it's not already installed.

As with Homebrew, add any additional `npm` packages you'd like installed off the bat.

### osx defaults

Definitely take a close look here. Everything's pretty straightforward and self-explanatory. None of these settings should be too earth-shattering, but you should definitely consider whether any of them will piss you off.

### sublime

This is geared up for ST3 since that's what I'm using. But switching this stuff to ST2 is as easy as replacing all occurrences of `sublime3` with `sublime3` (including the directory!) and replacing `Sublime\ Text\ 3` with `Sublime\ Text\ 2`.

If you've already been comfortably working with Sublime Text, you can run `sublime3/copy` to import your current preferences and configuration for Package Control (installed packages list, etc.). This will overwrite my `sublime3/User` directory, so if you want to salvage anything from there, do so now before running the copy utility. You should then run `sublime3/setup` immediately afterwards.

Make sure the symlink settings are correct in `sublime3/setup`. Also, install any alternative theme (like Soda) using the same format as in the file currently.

### system

Make sure you like the aliases set up in `system/aliases.zsh`.

Add important things to your `$PATH` variable in `system/path.zsh`.

### zsh

As mentioned above, you'll want to change some of the special directories specified in `zsh/zshrc.symlink`, as these will probably differ in your setup.

If there are any super secret things you want to include in your shell profile, but you don't want to commit them, throm them in `~/.localrc` and they'll be picked up automagically.

`zsh/zshrc.symlink` symlinks to `~/.zshrc`

## go

If you're all ready, run this from `~/.dotfiles`:

```sh
./script/bootstrap
./script/install
```

`./script/bootstrap` will symlink the appropriate files in `.dotfiles` to your home directory. Everything is configured and tweaked within `~/.dotfiles`.

`./script/install` will run every `install.sh` file in the subdirectories of `~/.dotfiles`.

## everyday

`dot` is a simple script that installs some dependencies, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## caveats

- If you use ClamXav, you may need to change owner and group on `/usr/local`, as ClamXav uses this directory as well – it's primarily used by Homebrew. When installed, ClamXav will change the owner of `/usr/local` to `root` and the group to `wheel`. It should be owned by your user and group `admin`. Still, you should change `/usr/local/clamXav` to owner `root` and group `wheel`. [Read more here](http://www.yihangho.com/homebrew-and-clamxav/). Thanks to @yihangho for the tip.

## bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rbenv` installed, for example. That
said, I do use this as *my* dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/montchr/dotfiles/issues) on this repository
and I'd love to get it fixed for you!

## thanks

I forked [Ryan Bates](http://github.com/ryanb)' excellent
[dotfiles](http://github.com/ryanb/dotfiles) for a couple years before the
weight of my changes and tweaks inspired me to finally roll my own. But Ryan's
dotfiles were an easy way to get into bash customization, and then to jump ship
to zsh a bit later. A decent amount of the code in these dotfiles stem or are
inspired from Ryan's original project.
