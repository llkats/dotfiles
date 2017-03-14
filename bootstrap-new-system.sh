#!/usr/bin/env bash

# A simple script for setting up OSX dev environment.

dev="$HOME/Developer"
pushd .
mkdir -p $dev
cd $dev

echo 'Enter new hostname of the machine (e.g. macbook-llkats)'
  read hostname
  echo "Setting new hostname to $hostname..."
  scutil --set HostName "$hostname"
  compname=$(sudo scutil --get HostName | tr '-' '.')
  echo "Setting computer name to $compname"
  scutil --set ComputerName "$compname"
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$compname"

pub=$HOME/.ssh/id_rsa.pub
echo 'Checking for SSH key, generating one if it does not exist...'
  [[ -f $pub ]] || ssh-keygen -t rsa

echo 'Copying public key to clipboard. Paste it into your Github account...'
  [[ -f $pub ]] && cat $pub | pbcopy
  open 'https://github.com/account/ssh'

# If we on OS X, install homebrew and tweak system a bit.
if [[ `uname` == 'Darwin' ]]; then
  which -s brew
  if [[ $? != 0 ]]; then
    echo 'Installing Homebrew...'
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      brew update
      brew install fish ffmpeg htop ruby
  fi

  # errored out here, then what?
  echo 'Tweaking OS X...'
    source 'etc/osx.sh'

  # http://github.com/sindresorhus/quick-look-plugins
  echo 'Installing Quick Look plugins...'
    brew tap phinze/homebrew-cask
    brew install caskroom/cask/brew-cask
    brew cask install suspicious-package quicklook-json qlmarkdown qlstephen qlcolorcode

  echo 'Downloading some apps...'
    brew cask install firefox google-chrome iterm2 spotify sublime-text vlc
fi

echo 'Installing doge'
  pip install doge

echo 'Applying sublime config...'
  st=$(pwd)/sublime/Packages
  as="$HOME/Library/Application Support/Sublime Text 3/Packages"
  asprefs="$as/User/Preferences.sublime-settings"
  if [[ -d "$as" ]]; then
    for theme in $st/Theme*; do
      cp -r $theme $as
    done
    rm $asprefs
    cp -r $st/Snippets $as
  else
    echo "Install Sublime Text http://www.sublimetext.com"
  fi

open_apps() {
  echo 'Install apps:'
  echo '1Password'
  open https://agilebits.com/downloads
  echo 'Alfred:'
  open http://www.alfredapp.com/
  echo 'Bartender:'
  open http://www.macbartender.com/
  echo 'Chrome Canary:'
  open http://www.google.com/intl/en/chrome/browser/canary.html
  echo 'Dropbox:'
  open https://www.dropbox.com
  echo 'Flux:'
  open https://justgetflux.com/
  echo 'Firefox Aurora:'
  open https://www.mozilla.org/en-US/firefox/channel/
  echo 'Limechat:'
  open http://limechat.net/mac/
  echo 'Mindful Mynah:'
  open http://www.mindfulmynah.com/
  echo 'Xcode:'
  open https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12
  echo 'Xscope:'
  open http://xscopeapp.com/
}

echo 'Should I give you links for system applications (e.g. Limechat, 1Pass, VLC)?'
echo 'n / y'
read give_links
[[ "$give_links" == 'y' ]] && open_apps

popd
