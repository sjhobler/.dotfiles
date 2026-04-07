#!/usr/bin/env zsh

# Starship init
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

eval "$(dircolors ~/.dircolors)"

# Block cursor
precmd() {
  echo -ne '\e[2 q'
}

# Simple changes
alias cl="clear"
alias ex="exit"

# Python aliases
alias create_env="python3 -m venv myenv"
alias activate_env="source myenv/bin/activate"

# Map vim to nvim
alias vim="nvim"

alias pf="fzf --preview 'batcat --color=always {}'"

fzf_preview() {
    find "$(pwd)" -type f | fzf \
        --preview '[[ {} =~ \.pdf$ ]] && pdftotext {} - | batcat -l txt --color=always || batcat --color=always {}' \
        --preview-window=right:60%:wrap \
        --bind 'enter:execute(custom-open.sh {})'
}
alias pv="fzf_preview"

alias ds_env="source ~/ds_env/bin/activate"
alias ml_env="source ~/venv-ml/bin/activate"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Custom copypath
copypath() {
    local path_to_copy="${PWD}"
    
    # Linux (X11)
    if command -v xclip &>/dev/null; then
        echo -n "$path_to_copy" | xclip -selection clipboard
        echo "Path copied to clipboard: $path_to_copy"
    # Linux (Wayland)
    elif command -v wl-copy &>/dev/null; then
        echo -n "$path_to_copy" | wl-copy
        echo "Path copied to clipboard: $path_to_copy"
    # macOS
    elif command -v pbcopy &>/dev/null; then
        echo -n "$path_to_copy" | pbcopy
        echo "Path copied to clipboard: $path_to_copy"
    # WSL (Windows Subsystem for Linux)
    elif command -v clip.exe &>/dev/null; then
        echo -n "$path_to_copy" | clip.exe
        echo "Path copied to clipboard: $path_to_copy"
    else
        echo "Error: No clipboard utility found. Install xclip, wl-copy, or pbcopy."
        return 1
    fi
}

# autocomplete
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=180'

# syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ----------------------------------------------------------------------------
# Configure tmux
# ----------------------------------------------------------------------------

# Launch a new tmux session with the custom layout
tmux-new-dev() {
  local session="${1:-dev}"

  if tmux has-session -t "$session" 2>/dev/null; then
    echo "Session '$session' already exists. Attaching..."
    tmux attach-session -t "$session"
    return
  fi

  tmux new-session -d -s "$session"

  local win
  local pane
  win=$(tmux list-windows -t "$session" -F "#{window_index}" | head -1)
  pane=$(tmux list-panes -t "$session:$win" -F "#{pane_index}" | head -1)

  tmux split-window -h -l 40% -t "$session:$win.$pane"
  tmux split-window -v -l 35% -t "$session:$win.$((pane + 1))"
  tmux send-keys -t "$session:$win.$((pane + 2))" "htop" Enter
  tmux select-pane -t "$session:$win.$pane"
  tmux attach-session -t "$session"
}

# Reconfigure the CURRENT tmux window into the custom layout
tmux-layout-dev() {
  if [ -z "$TMUX" ]; then
    echo "Not inside a tmux session."
    return 1
  fi

  local win
  win=$(tmux display-message -p "#{session_name}:#{window_index}")

  # Kill all panes except the first by repeatedly removing extras
  while [ "$(tmux list-panes -t "$win" | wc -l)" -gt 1 ]; do
    tmux kill-pane -t "$win.2"
  done

  local pane
  pane=$(tmux list-panes -t "$win" -F "#{pane_index}" | head -1)

  tmux split-window -h -l 40% -t "$win.$pane"
  tmux split-window -v -l 35% -t "$win.$((pane + 1))"
  tmux send-keys -t "$win.$((pane + 2))" "htop" Enter
  tmux select-pane -t "$win.$pane"
}

# !! Contents within this block are managed by juliaup !!

path=('/home/stephan/.juliaup/bin' $path)
export PATH="$PATH:/usr/local/bin"

# <<< juliaup initialize <<<
export PATH="$HOME/.juliaup/bin:$PATH"

# Run Fastfetch
if [[ -o interactive ]]; then
	fastfetch
fi

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$PATH:/opt/nvim-linux64/bin"


# ----------------------------------------------------------------------------
# Set Editor to nvim 
# ----------------------------------------------------------------------------
export EDITOR="nvim"

# ----------------------------------------------------------------------------
# Lazy-load NVM 
# ----------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"

# Lazy-load nvm
nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
}

# Create placeholder functions
node() { nvm; node "$@"; }
npm() { nvm; npm "$@"; }
npx() { nvm; npx "$@"; }

# add bin to path
export PATH="$HOME/bin:$PATH"

# -- SET JULIA_DEPOT_PATH -- #
export JULIA_DEPOT_PATH="$HOME/.julia/juliaup/julia-1.11.6+0.x64.linux.gnu/share/julia"
export JULIA_DEPOT_PATH="$HOME/.julia/juliaup/julia-1.11.6+0.x64.linux.gnu/local/share/julia:$JULIA_DEPOT_PATH"
export JULIA_DEPOT_PATH="$HOME/.julia:$JULIA_DEPOT_PATH"
export PATH="$HOME/.local/bin:$PATH"
