# dotfiles by montchr

## dotfiles

Your dotfiles are how you personalize your system. These are mine.

Zach Holman (@holman) [has a lot to say][intro.01] about why you might benefit from forking someone's dotfiles and building upon them (or tearing them down)
to suit your own needs. He also explains what the hell dotfiles are:

> I'm a big fan of customizing your dotfiles. "Dotfiles" are the funky little
> files in your *nix-based home directory that allow you to customize your
> nerdery: change how your prompt looks, set up your $PATH, adjust settings
> for Ruby's IRB, completely change everything about Vim, and about a billion
> and a half other things. They're fun.

> In many ways, this loose framework is one of the most important tools you'll
> use as a developer. It dictates how you use every other tool in your
> software arsenal. And everyone has different tastes, which I find
> fascinating: sit down at a crafty programmer's shell for a minute and you'll
> find that out pretty quick.

I forked @holman's dotfiles, and spent many hours going over them –
many hours I could have used for other things. But I came out with a greater
understanding of shell scripting and what I tools I want to use as a developer.

One of my primary goals in spending so much time initially developing these
files is building a toolkit that can be forked and used to provision other
people's machines for development with little modification to the original (or
ideally with user input).

[has a lot to say]: http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/


## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.


## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you. [Fork it][],
remove what you don't use, and build on what you do use.

Here's a brief list of some of the more interesting features:

- Installs [zsh shell][], sets it as default (replacing bash).
- Integration with [oh-my-zsh][] for easy customizations
- Installs [some fixed-width fonts][]
- Installs [Homebrew][], [Node.js][], [RVM][], [Sublime Text 3][]
- Sets up basic configuration for [Git][], [Vim][], and of course ZSH
- Sets some OS X default settings
- Includes [Beets][], the command-line music library manager for the OCD
- Includes [xkcd Password Generator][]

[Fork it]: https://github.com/montchr/dotfiles/fork
[zsh shell]: http://fendrich.se/blog/2012/09/28/no/
[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh
[some fixed-width fonts]: https://github.com/Lokaltog/powerline-fonts
[Homebrew]: http://brew.sh/
[Node.js]: http://nodejs.org/
[RVM]: http://sirupsen.com/get-started-right-with-rvm/
[Sublime Text 3]: http://www.sublimetext.com/3
[Git]: http://www.git-scm.com/
[Vim]: http://en.wikipedia.org/wiki/Vim_(text_editor)
[Beets]: http://beets.radbox.org/
[xkcd Password Generator]: https://github.com/redacted/XKCD-password-generator


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

First, you'll want to take a look at the files in `.dotfiles` and make any
necessary changes.

### prune

Make sure you have at least a vague sense of what's going on here. You don't need to understand all the intricacies – they'll become clearer as you continue to work with this stuff. Trust me. ;)

Do keep in mind that your `~/.dotfiles` directory is a working Git repo! So if
you make changes, try to make them in logical chunks and commit them. Remember:

> Commit early and commit often.

Starting from the top, here's a general overview of which files you may want to
customize.

#### cask

```
.
├── basic.Caskfile
├── dev.Caskfile
├── home.Caskfile
└── install.sh
```

[Homebrew Cask][] is Homebrew for your GUI Mac apps. Take a look through the
various Caskfiles to see what comes bundled in each.

[Homebrew Cask]: http://caskroom.io/

#### git

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

#### homebrew

```
.
├── Brewfile
└── install.sh
```

Don't have Homebrew installed yet? No problem! `homebrew/install.sh` will take
care of you.

Wondering what the hell is Homebrew? [Check out this article on Tuts+][]
for a solid, plain-English explanation.

__Do you have MacPorts installed? Stop right there.__ If you run any of the
install scripts with MacPorts installed, including `homebrew/install.sh`, you
are likely to mess your system up, and the process of recovering from a
Homebrew-MacPorts collision is time-consuming and the effects will linger.
Now might be a great time to consider switching to using Homebrew and sticking
to it. It's simpler, it's well-supported, it's growing, and it has beer jargon.

Removing MacPorts is not as hard as it sounds, but make sure you take note of
all the packages you'd like to tell Homebrew to grab. `script/bootstrap` can
remove MacPorts for you, or [you can do it yourself][].

Add any things you'll always need installed first and foremost.

[Check out this article on Tuts+]: http://computers.tutsplus.com/tutorials/homebrew-demystified-os-xs-ultimate-package-manager--mac-44884
[you can do it yourself]: http://apple.stackexchange.com/questions/82806/how-to-cleanly-remove-macports

#### node

```
.
└── install.sh
```

Even if you aren't a Node.JS developer (I'm not), there's a strong chance you
will still be using something powered by Node (I still am). Like [Bower][].
Or [Grunt][].

The `node/install.sh` script will install Node for you if it's not already
installed.

Node offers a downloadable package file from its website, but I recommend you
stick with Homebrew because:

- Homebrew will auto-update your Node install
- You won't have to use `sudo`

As with Homebrew, add any additional `npm` packages you'd like installed off
the bat.

[Bower]: http://bower.io/
[Grunt]: http://gruntjs.com/

#### osx defaults

```
.
└── set-defaults.sh
```

Definitely take a close look here. Everything's pretty straightforward and
self-explanatory. None of these settings should be too earth-shattering, but
you should definitely consider whether any of them will piss you off.

If you'd like to add any more of these defaults to this file, check out
[@mathiasbynens' comprehensive dotfiles][].

[@mathiasbynens' comprehensive dotfiles]: https://github.com/mathiasbynens/dotfiles/blob/master/.osx


#### system

```
.
├── aliases.zsh
├── env.zsh
├── grc.zsh
├── keys.zsh
└── path.zsh
```

Make sure you like the aliases set up in `system/aliases.zsh`.

Add important things to your `$PATH` variable in `system/path.zsh`.

#### zsh

As mentioned above, you'll want to change some of the special directories
specified in `zsh/zshrc.symlink`, as these will probably differ in your setup.

If there are any super secret things you want to include in your shell profile,
but you don't want to commit them, throw them in `~/.localrc` and they'll be
picked up automagically.

`zsh/zshrc.symlink` symlinks to `~/.zshrc`

### goodies

#### xkcd password generator

[![](http://imgs.xkcd.com/comics/password_strength.png)][password strength]

I'm a big fan of [xkcd][]. Inside these dotfiles, you will find a Python-based xkcd
password generator, based on the idea set forth in the above comic.

Run `xkcdp` from anywhere. Check out [the generator's home on GitHub][]
for a bunch of config options. All props to @redacted.

[password strength]: http://xkcd.com/936/
[xkcd]: http://xkcd.com/
[the generator's home on GitHub]: https://github.com/redacted/XKCD-password-generator


## go

If you're all ready, run this:

```sh
git clone https://github.com/montchr/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./script/bootstrap
./script/install
```

### rundown

#### ./script/bootstrap

`./script/bootstrap` will symlink the appropriate files in `~/.dotfiles` to
your home directory. Everything is configured and tweaked within
`~/.dotfiles`. It will also install your Homebrew dependencies and oh-my-zsh for the first time.

1. If `git/gitconfig.symlink` doesn't exist, create it with your provided
   GitHub author name and email.
2. Link all files ending with `.symlink` to the home directory. Each retains
   the same name, minus the `.symlink` part.
3. Optionally set OS X defaults.
4. Install Homebrew if it's not already installed. If MacPorts is detected, you
   have the option of removing it or aborting.
5. Install the Homebrew packages listed in `homebrew/Brewfile`.
6. Install Bower packages in `lib`.
7. Install oh-my-zsh.
8. Change default shell to the Homebrew-managed zsh in `/usr/local/bin`
9. Copy Powerline-patched coding fonts to `~/Library/Fonts`.

#### ./script/install

`./script/install` will run every `install.sh` file in the subdirectories of
`~/.dotfiles`.

1. __`cask/install.sh`:__ Optionally installed bundles of recommended Mac apps.
3. __`homebrew/install.sh`:__ Steps 4–6 in `script/bootstrap` (listed above).
4. __`lib/install.sh`:__ Symlink some scripts from here to `bin`.
5. __`node/install.sh`:__ Install Node.JS and things that depend on it.
6. __`python/install.sh`:__ Install Python-based programs via pip.
7. __`ruby/install.sh`:__ Installs RVM for safely managing Ruby and its gems.
   Compiles Ruby 2.1.0 from source. Takes a while. Just let it do its thing.

### sublime

Sublime Text 3 settings are not set up automatically. You'll have to do that
after running the above scripts.

__If you've already been comfortably working with Sublime Text:__ you can run
`sublime3/copy` to import your current preferences and configuration for Package Control (installed packages list, etc.). _This will overwrite my `sublime3/User` directory, so if you want to salvage anything from there, do so now before running the copy utility._ You should then run `sublime3/setup`
immediately afterwards.

__If you just want to load my suggested configuration:__ only run `sublime3/setup`. This will back up your current ST3 preferences before installing mine.


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

- You may notice, after working with these dotfiles for some time, that `sublime3/User/Preferences.sublime-settings` changes very often without your input. This is because of two plugins:

    - [SunCycle][] changes the color scheme and theme at sunrise and sunset. I
    originally committed the file after dark, so during the day, Git sees the file has changed. You can commit those changes if you like, but you'll be
    committing those same changes over and over again, forever...

    - [SublimeLinter][] is constantly forcing the file to adhere to a certain syntax. It enforces tab indentation and it automatically adds every available setting and alphabetizes the keys. This gets annoying, especially while you're in there editing and you're told the file has changed on disk. In that case, just hit cancel and save when you're ready. Sometimes you'll also notice the "Ignored Packages" are mysteriously being re-ordered for no apparent reason...

    If these issues are too aggravating for you, definitely consider adding
    `sublime3/Preferences.sublime-settings` to `.gitignore`. But, of course, you'll lose the ability to track any future changes you make to the file yourself.

[ClamXav]: http://www.clamxav.com/
[Thanks to @yihangho for the tip]: http://www.yihangho.com/homebrew-and-clamxav/
[SunCycle]: https://github.com/smhg/sublime-suncycle
[SublimeLinter]: https://github.com/SublimeLinter/SublimeLinter3


## bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rvm` installed, for example. That
said, I do use this as *my* dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue][] on this repository and I'd love to get it fixed for you!

[open an issue]: https://github.com/montchr/dotfiles/issues


## thanks

Most heavily based on the structure set out in [@holman's dotfiles][].

I was originally using a fork of [@necolas' dotfiles][] before I
decided to go the zsh route. I did like the way he set some things up, so I've
borrowed some of those things.

@aniketpant, for his implementation of `oh-my-zsh` with @holman's dotfile
structure.

@holman:

> I forked [Ryan Bates][]' [excellent dotfiles][] for a
> couple years before the weight of my changes and tweaks inspired me to finally
> roll my own. But Ryan's dotfiles were an easy way to get into bash
> customization, and then to jump ship to zsh a bit later. A decent amount of
> the code in these dotfiles stem or are inspired from Ryan's original project.

[@holman's dotfiles]: https://github.com/holman/dotfiles
[@necolas' dotfiles]: https://github.com/necolas/dotfiles
[Ryan Bates]: http://github.com/ryanb
[excellent dotfiles]: https://github.com/ryanb/dotfiles
