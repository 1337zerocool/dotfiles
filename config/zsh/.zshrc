# Import the default ZSH config for the system
source /etc/zsh/zshrc.default.inc.zsh

# History size and location aren't that important on spin but having it
# managed somewhere would be nice.
export HISTSIZE="10000"
export SAVEHIST="10000"
export HISTFILE="$HOME/.local/share/zsh/zsh_history"
# The autocompletion dump should probably be updated to use a cassette or
# some kind of saved file. Compiling this the first time you launch a shell
# is an annoying slowdown that doesn't need to exist.
export ZCOMPDUMP="$HOME/.local/share/zsh/zcompdump"
# Neovim as the standard editor.
export EDITOR="nvim"

# Simplify history settings: this is all remote and frequently destroyed. Keeping
# the history list clean by purging duplicates, ignoring lines that being with
# a space, and using alternative locking which should improve performance on NFS
# which I assume is what's underlying the home dir on spin instances
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
# Stop ^D from existing ZSH, multiple presses still work though
setopt IGNORE_EOF
# Enable prompt expansion
setopt PROMPT_SUBST
# AutoCD is annoying. Type a directory name and it changes into it.
unsetopt AUTOCD
# Stores time/date in the history file. This is just noise on spin because it
# will always be "recent".
unsetopt EXTENDED_HISTORY

# Some nicer options for LS: colors, little symbols to show file types,
# showing sizes as "G or KB" using powers of 10 like macos, no quoted names.
# No hyperlinks because these are on a remote server
alias ls="ls --group-directories-first --color=auto --classify --literal --human-readable --si"
alias ll="ls -l"
alias la="ls -A"

# Use neovim as vim and vimdiff
alias vim="nvim"
alias vimdiff="nvim -d"

# Setup some additional paths for locating ZSH plugins/functions
$fpath=(
	$fpath
)
# A path to find local binaries in additional to the usual places. This is so that you can
# write your own scripts/programs and have them work here.
$path=(
	path
)
# Add paths to Auto CD. These let you change into code directories without specifying the
# full path. `cd bar` instead of `cd ~/src/github.com/foo/bar`
cdpath=(
	$HOME/src/*/*
	$cdpath
)

# Setup Auto Completion, updating the dump file every 24 hours.
autoload -U compinit
() {
	if [[ $# -gt 0 ]]; then
		compinit -i -d $ZCOMPDUMP
		touch $ZCOMPDUMP
	else
		compinit -C -d $ZCOMPDUMP
	fi
} $ZCOMPDUMP(N.mh+24)

# setup having colors by name by autoloading the required function
autoload -Uz colors && colors

# Setup vim-style command-line editing, and let you use "v" to open the line in vim from normal mode
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey -v

