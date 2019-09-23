#!/bin/zsh

git clone --bare https://github.com/vnagel/dotfiles $HOME/.dotfiles
function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles";
  else
    echo "Backing up pre-existing dotfiles";
    backup_dir=.dotfiles-backup-$(date | sed "s/ /_/g")
    mkdir $backup_dir
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $backup_dir/{}
fi;
dotfiles checkout
dotfiles config status.showUntrackedFiles no
source $HOME/.profile
source $HOME/.zshrc
