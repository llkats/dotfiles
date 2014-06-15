dir="$HOME/Developer/llkats"
mkdir -p $dir
cd $dir
git clone git://github.com/paulmillr/dotfiles.git
cd dotfiles
sudo bash symlink-dotfiles.sh
