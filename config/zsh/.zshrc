# History
# =======

# This sets up history with 10,000 items in it. Duplicate entries will be
# purged first. Attempt to avoid duplicate history entries: both creating them,
# and searching through the history. Get one history entry. Extended history
# makes for more complicated time stamps which is unnecessary. It is stored in
# a more readily accessible location. 

export HISTFILE="$HOME/.local/share/zsh/zsh_history"
export HISTSIZE="10000"
export SAVEHIST="10000"
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
unsetopt EXTENDED_HISTORY

# Stop ^D from existing ZSH, multiple presses still work though
setopt IGNORE_EOF

# Enable prompt expansion
setopt PROMPT_SUBST

# AutoCD is annoying. Type a directory name and it changes into it.
unsetopt AUTOCD

# Aliases for common listing
alias ls="gls --group-directories-first --color=auto --classify --literal --human-readable --si"
alias ll="ls -l"
alias la="ls -A"

# Neovim is the standard editor.
export EDITOR="nvim"

# Use Neovim as Vi, Vim, and Vimdiff. If you're going to install Neovim, you
# might as well use it everywhere you can
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

# Setup some additional paths for locating ZSH plugins/functions These may be
# used for things like auto-completion functions
fpath=(
  $fpath
)

# A path to find local binaries in additional to the usual places. This is so
# that you can write your own scripts/programs and have them work here. The
# Homebrew version of a number of GNU utilities get installed in /opt. Those
# paths are added explicitly.
path=(
  $path
  $home/bin
  /opt/homebrew/opt/gawk/libexec/gnubin
  /opt/homebrew/opt/gnu-sed/libexec/gnubin
  /opt/homebrew/opt/grep/libexec/gnubin
  /opt/homebrew/opt/gnu-getopt/bin
)


# Simplify using CD for common locations. `cd bar` instead of `cd
# ~/src/github.com/foo/bar`
cdpath=(
  $HOME/src/*/*
  $cdpath
)

# Generating autocompletion is slow. Dump the computed cache to an easily
# accessible location
export ZCOMPDUMP="$HOME/.local/share/zsh/zcompdump"

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

# Make referencing up directories easier. type `cd ..` and then the next `.`
# will expand to `../..` you can keep typing `.` to continue the expansion.
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
source "/opt/homebrew/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

# Setup auto-completion, using info from the history and shift+tab to accept and run a completion
source "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Shift+tab = execute it the current suggestion
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

# Setup home brew
test -r "/opt/homebrew/bin/brew" && eval "$(/opt/homebrew/bin/brew shellenv)"

# Now we'll use Nord colors for dircolors
test -r "$HOME/.config/dircolors/nord.dircolors" && eval $(gdircolors "$HOME/.config/dircolors/nord.dircolors")

# And Chruby
test -r "$HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh" && source "$HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh"
test -r "$HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh" && source "$HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh"
chruby $(chruby | tail -n1 | cut -d'-' -f2)

# Add Rust
test -r "$HOME/.cargo/env" && source "$HOME/.cargo/env"

# Add NVM
test -r "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" && source "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
