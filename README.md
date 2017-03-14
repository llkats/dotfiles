# Dotfiles
Largely pulled from [Paul Miller's dotfiles repo](https://github.com/paulmillr/dotfiles).

Installation is done with simple command set (see “building system from scratch” for setup of new system):

```
curl --silent https://raw.githubusercontent.com/llkats/dotfiles/master/install.sh | sh
```

## Disclaimer
![I have no idea what I'm doing](https://dl.dropbox.com/u/37968874/img//no-idea.jpg)

## Building system from scratch

1. Create `~/Developer/`
1. Install Consolas and Fantasque Sans Mono font.
1. Install XCode.
1. Change default shell to fish: `chsh -s /usr/local/bin/fish`.
1. Clone:
    * this project (dotfiles) and run `sh bootstrap-new-system.sh`

## Features


## Structure
* `bin` — files that are symlinked to any directory with binaries in `$PATH`
* `etc` — various stuff like osx text substitutions / hosts backup
* `git-extras` — useful git functions, defined in `home/gitconfig`. Don't forget to change your git author to a proper name.
* `home` — files that are symlinked to `$HOME` directory
* `sublime` — sublime text 2 theme & settings
* `terminal` — terminal theme & prompt

## Building system from scratch (reminder)

* Clone this project (dotfiles **RECURSIVELY** `--recursive`) and run `sh bootstrap-new-system.sh`
* Install Sublime packages with Package Control: "Seti UI"

## License

[MIT](https://github.com/paulmillr/mit) (c) 2016 Paul Miller (http://paulmillr.com)
