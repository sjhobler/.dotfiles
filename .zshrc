# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
	git
	# web-search
	zsh-autosuggestions
	copypath
        # zsh-syntax-highlighting
)
plugins+=(zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

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

# # Todos
alias todo="nvim ~/tasks/todo.md"

# Python aliases
alias create_env="python3 -m venv myenv"
alias activate_env="source myenv/bin/activate"

# Matlab alias in terminal
alias mlab="matlab -nodesktop -nosplash"

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

# Custom search through files
sf() {
    search_term="$1"
    if [ -z "$search_term" ]; then
        echo "Please provide a search term."
        return 1
    fi

    find . -type f -iname "*.pdf" -exec sh -c 'pdftotext "$1" - | grep -iq "$2$" && echo "Found in: $1"' _ {} "$search_term" \;
}

alias zed="~/.local/bin/zed"
alias zvp="zathura --mode presentation"
alias oo="cd ~/Documents/Obsidian/work"
alias on="vim ~/Documents/Obsidian/work/daily-notes/$(date +'%Y-%m-%d').md"

# Connect to office PC and SSH config

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=180'

path=('/home/stephan/.juliaup/bin' $path)
export PATH="$PATH:/usr/local/bin"

# <<< juliaup initialize <<<
export PATH="$HOME/.juliaup/bin:$PATH"
export PATH="$HOME/.julia/juliaup/julia-1.10.7+0.x64.linux.gnu/bin:$PATH"
export PATH="$HOME/.julia/juliaup/julia-1.11.2+0.x64.linux.gnu/bin:$PATH"
export PATH="$HOME/.julia/juliaup/julia-1.11.6+0.x64.linux.gnu/bin:$PATH"

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$PATH:/opt/nvim-linux64/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# add bin to path
export PATH="$HOME/bin:$PATH"

# add zig t opath
export PATH="$HOME/zig-linux-x86_64-0.13.0:$PATH"
export PATH="$HOME/zig-linux-x86_64-0.14.0:$PATH"

# Load research environment variables
if [ -f ~/.config/research-env.sh ]; then
    source ~/.config/research-env.sh
fi
