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
# $fpath=( $fpath )
# A path to find local binaries in additional to the usual places. This is so that you can
# write your own scripts/programs and have them work here.
# $path=( $path )
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

# Make referencing up directories easier.   type `cd ..` and then the next `.` will expand to `../..`
# you can keep typing `.` to continue the expansion.
function expand_dots() {
	[[ $LBUFFER = *.. ]] && LBUFFER+=/.. || LBUFFER+=.
}
zle -N expand_dots
bindkey . expand_dots

# This is a custom prompt. It computes the shortest unique representation of the current path and
# then puts a "> " at the end of it. Green if the last command was okay otherwise red.
autoload -Uz add-zsh-hook
function compute_short_pwd() {
	local shortened_path full_path part current_path_part first_part
	local -a split
	split=(${(s:/:)${(Q)${(D)1:-$PWD}}})
	if [[ $split == "" ]]; then
		SHORT_PWD=/
		return 0
	fi
	if [[ $split[1] = \~* ]]; then
		first_part=$split[1]
		full_path=$~split[1]
		shift split
	fi
		if (( $#split > 0 )); then
		part=/
	fi
	for current_path_part ($split[1,-2]) {
	while {
		part+=$current_path_part[1]
		current_path_part=$cur[2,-1]
		local -a glob
		glob=( $full_path/$part*(-/N) )
			(( $#glob > 1 )) || [[ $part == (.|..) ]] && (( $#current_path_part > 0 ))
		} { }
		full_path+=$part$current_path_part
		shortened_path+=$part
		part=/
	}
	SHORT_PWD=$first_part$shortened_path$part$split[-1]
	return 0
}
compute_short_pwd
add-zsh-hook -Uz chpwd compute_short_pwd
setopt prompt_subst
export PROMPT='%F{%(?.green.red)}${SHORT_PWD}❯%f '

# Add pretty syntax highlighting for our command lines
source "$HOME/.local/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

# Setup auto-completion, using info from the history and shift+tab to accept and run a completion
source "$HOME/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
# shift+tab = execute it the current suggeston
bindkey '^[[Z' autosuggest-execute

# Some configuration for the completion engine
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:descriptions' format %{$fg[yellow]%}%d%f    # Draw group descriptions in yellow
zstyle ':completion:*:messages' format %{$fg[cyan]%d%f            # Draw messages in cyan
zstyle ':completion:*:warnings' format %{$fg[red]%}No matches%f   # Draw no matches warning in red
zstyle ':completion:*' accept-exact '*(N)'                        # Ignore partial globs to make completion faster
zstyle ':completion:*' accept-exact-dirs true                     # demand exact dir paths
zstyle ':completion:*' use-cache on                               # Use completion caching to improve performance
zstyle ':completion:*' verbose true                               # Prefer the most verbose completion
zstyle ':completion:*:options' description yes                    # Describe options.
zstyle ':completion:*:default' menu select                        # Want to have menu complete for ambiguous matches
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}     # Use dircolors when completing directories
zstyle ':completion:*:matches' group yes                          # Group matches (e.g. files vs directories)
zstyle ':completion:*' group-name ''                              # for any group
zstyle ':completion:::::' completer _complete _ignored _approximate
zstyle ':completion:*'    completer _complete _ignored _approximate
zstyle ':completion:*:complete:(cd|pushd):*' tag-order 'local-directories named-directories'  # sort order
zstyle ':completion:*:cd:*' ignore-parents parent pwd                                         # don't show . or ..
zstyle ':completion:*' list-dirs-first true                                                   # Separate directories from files.
zstyle ':completion:*:(rm|mv|cp):*' ignore-line yes    # Don't use words on the line as possible completions

# Now we'll use Nord colors for dircolors
test -r "$HOME/.dircolors" && eval $(dircolors "$HOME/.dircolors")