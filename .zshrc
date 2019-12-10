# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/vnagel/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Set fzf installation directory path
# export FZF_BASE=/path/to/fzf/install/dir

# Uncomment the following line to disable fuzzy completion
# export DISABLE_FZF_AUTO_COMPLETION="true"

# Uncomment the following line to disable key bindings (CTRL-T, CTRL-R, ALT-C)
# export DISABLE_FZF_KEY_BINDINGS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
zsh-autosuggestions
command-not-found
extract
vi-mode
colored-man-pages
per-directory-history
git-extras
gitignore
copybuffer
ubuntu
fasd
fzf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.



# Custom

# Alias
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias git-branch-all-subdir="find . -name .git -execdir git rev-parse --show-toplevel \; -execdir git branch -a \;"
alias git-status-all-subdir="find . -name .git -execdir git rev-parse --show-toplevel \; -execdir git status -s \;" 
alias dos2unix-all-subdir="find . -type f -print0 | xargs -0 dos2unix"
alias c="clipcopy"
alias cd490="cd /home/vnagel/Documents/code/School/eecs490"
alias cd491="cd /home/vnagel/Documents/code/School/eecs491"
alias cdpa="cd /home/vnagel/Documents/code/Other/photo-assassin-android-app"
alias cdpaf="cd /home/vnagel/Documents/code/Other/photo-assassin-cloud-functions"
alias run-search-engine="cd /home/vnagel/Documents/code/School/eecs398-search-engine && make HttpServer && ./Bin/HttpServer 8000"
alias open="xdg-open"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias mount-gdrive='mount | grep "${HOME}/google-drive" >/dev/null || /usr/bin/google-drive-ocamlfuse "${HOME}/google-drive"'
alias studio="/home/vnagel/opt/android-studio/bin/studio.sh"
alias installed="comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)"
alias fd="fdfind"
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

eval "$(fasd --init auto)"

source /home/vnagel/.config/broot/launcher/bash/br

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
