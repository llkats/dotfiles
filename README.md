# Dotfiles
Forked from [Paul Miller's dotfiles repo](https://github.com/paulmillr/dotfiles). I'm keeping the faith for `fish shell` though.

Installation is done with simple command set (see “building system from scratch” for setup of new system):

```
curl --silent https://raw.githubusercontent.com/llkats/dotfiles/master/install.sh | sh
```

## Disclaimer
![I have no idea what I'm doing](https://dl.dropbox.com/u/37968874/img//no-idea.jpg)

## Structure
* `etc` — various stuff like osx text substitutions, hosts backup, and fish config
* `git-extras` — useful git functions, defined in `home/gitconfig`. Don't forget to change your git author to a proper name.
* `home` — files that are symlinked to `$HOME` directory
* `sublime` — sublime text 3 themes & settings
* `terminal` — terminal theme & prompt

## Building system from scratch

1. Create `~/Developer/`
1. Install Consolas and Fantasque Sans Mono font.
1. Install XCode.
1. Clone:
    * this project (dotfiles) and run `sh bootstrap-new-system.sh`


## Additional Steps

* Set up fish, nvm, and node.
    1. Install [nvm](https://github.com/creationix/nvm#install-script) through bash
    1. Install [bass](https://github.com/edc/bass)
    1. Change default shell to fish: `chsh -s /usr/local/bin/fish`
    1. Copy `etc/config.fish` to `~/.config/fish/config.fish`
    1. Run `nvm install stable`
* Install Sublime packages with Package Control
    * babel
    * emmett
    * file navigator
    * fish shell
    * fuzzy filepath
    * html-css-js prettify
    * jsx
    * less
    * material theme
    * material theme-white panels
    * origami
    * sftp
    * sublimelinter-contrib-standard
    * sublimelinter-contrib-eslint
    * trailing spaces

## License

[MIT](https://github.com/paulmillr/mit) (c) 2016 Paul Miller (http://paulmillr.com)
