# Dotfiles
Largely pulled from [Paul Miller's dotfiles repo](https://github.com/paulmillr/dotfiles).

Installation is done with simple command set (see “building system from scratch” for setup of new system):

```
curl --silent https://raw.githubusercontent.com/llkats/dotfiles/master/install.sh | sh
```

## Disclaimer
![I have no idea what I'm doing](https://dl.dropbox.com/u/37968874/img//no-idea.jpg)

## Building system from scratch (reminder)

* Install Source Code Pro font.
* Install XCode & its Command Line Tools.
* Change default shell to fish: `chsh -s /usr/local/bin/fish`.
* Insert proper hosts from `etc/hosts` to system’s `/etc/hosts`.
* Create `~/Development/`
* Clone:
    * this project (dotfiles) and run `sh bootstrap-new-system.sh`

## Todo
Figure out the error with `source osx.sh`, line 39 in `bootstrap-new-system.sh`
Figure out how to move Alfred prefs and apps over
I don't think the Sublime Text preferences porting stuff works 

## License

The MIT license.

Copyright (c) 2013 Paul Miller (http://paulmillr.com/)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
