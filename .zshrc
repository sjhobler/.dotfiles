# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	web-search
	zsh-autosuggestions
	copypath
)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Simple changes
alias cl="clear"
alias ex="exit"

# # Todos
alias todo="nvim ~/tasks/todo.md"

# Configuration files
alias cfv="vim ~/.config/nvim/init.lua"
alias cfa="nvim ~/.config/alacritty/alacritty.toml"

# For quick file navigation to project (but requires fixed paths)
proj() {
    source ~/bin/project_cd.sh "$1"
}
#alias proj='bash -c "source ~/bin/project_cd.sh \$1" _'

# Matlab alias in terminal
alias mlab="matlab -nodesktop -nosplash"

# Github copilot CLI
alias ghcs="gh copilot suggest"
alias ghce="gh copilot explain"


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


	#--bind 'ctrl-m:become(cd $(dirname {}))'

alias zed="~/.local/bin/zed"
alias oc="code . --reuse-window"
alias zview="zathura" 
alias zvp="zathura --mode presentation"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=180'

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/stephan/.juliaup/bin' $path)
export PATH="$PATH:/usr/local/bin"

# <<< juliaup initialize <<<

# Run Fastfetch
#if [[ -o interactive ]]; then
#	fastfetch
#fi
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$PATH:/opt/nvim-linux64/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# add path to radian
export PATH="$HOME/anaconda3/bin:$PATH"

# add path to stata
export PATH="/usr/local/stata18:$PATH"

# add compile_sagelatex to path
export PATH="$HOME/bin/compile_sagelatex:$PATH"

# add kitty to path
export PATH="$HOME/.local/kitty.app/bin:$PATH"

# add bin to path
export PATH="$HOME/bin:$PATH"

