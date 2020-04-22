export ZSH="/home/vnagel/.oh-my-zsh"
ZSH_THEME="spaceship"
ENABLE_CORRECTION="true"

plugins=(
git
zsh-autosuggestions
command-not-found
extract
vi-mode
colored-man-pages
per-directory-history
git-extras
copybuffer
ubuntu
fzf)

source $ZSH/oh-my-zsh.sh

# Alias
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias git-branch-all-subdir="find . -name .git -execdir git rev-parse --show-toplevel \; -execdir git branch -a \;"
alias git-status-all-subdir="find . -name .git -execdir git rev-parse --show-toplevel \; -execdir git status -s \;" 
alias dos2unix-all-subdir="find . -type f -print0 | xargs -0 dos2unix"
alias c="clipcopy"
alias cw="clip.exe"
alias run-search-engine="cd /home/vnagel/Documents/code/School/eecs398-search-engine && make HttpServer && ./Bin/HttpServer 8000"
alias open="xdg-open"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias mount-gdrive='mount | grep "${HOME}/google-drive-mnt" >/dev/null || /usr/bin/google-drive-ocamlfuse "${HOME}/google-drive-mnt"'
alias studio="/home/vnagel/opt/android-studio/bin/studio.sh"
alias fd="fdfind"
alias notes="code ~/google-drive/notes/"
alias sync-notes='$(cd ~/google-drive/ && grive -s notes)'
m(){rhythmbox-client "--$1"}

# Other
export VISUAL=vim 
export EDITOR="$VISUAL"

FD_OPTIONS="--follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview='(bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fdfind --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fdfind $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fdfind --type d $FD_OPTIONS"
export BAT_PAGER="less -R"

unsetopt nomatch

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# GO
export PATH=$PATH:/usr/local/go/bin
if type go >/dev/null; then
  export GOPATH=$(go env GOPATH)
fi
export PATH=$PATH:$GOPATH/bin

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

source /usr/share/autojump/autojump.sh
source /home/vnagel/.config/broot/launcher/bash/br

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
