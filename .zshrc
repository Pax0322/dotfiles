# Enable colors
autoload -U colors && colors

# Prompt: username@host in green, current dir in blue, $ in yellow
PROMPT='%F{green}%n@%m%f %F{blue}%~%f %F{yellow}$%f '

# Aliases with color
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -la'

# History settings
HISTSIZE=1000
SAVEHIST=2000
HISTFILE=~/.zsh_history

# Enable completion
autoload -Uz compinit
compinit

# Syntax highlighting (if installed)
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Autosuggestions (if installed)
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # Customize autosuggestion color (cyan ghost text)
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=magenta'
fi

