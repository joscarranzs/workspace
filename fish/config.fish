# Set the default editor
set -gx EDITOR nvim

# Common aliases
alias cdh="cd ~"
alias cl="clear"
alias ls="lsd"
alias la="lsd -a"
alias ll="lsd -l"
alias lla="lsd -l -a"
alias vfz="vim (fzf)"
alias lg='lazygit'
alias create="mkdir"
alias delete="rm -rf"
alias back="cd .."
command -qv nvim && alias vim nvim

# Evaluate Homebrew env only if it exists
if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# Función para abrir Neovim directamente en la interfaz DBUI (Database User Interface)
function nvimdb
    nvim -c DBUI  # Abre Neovim y ejecuta el comando DBUI para iniciar la interfaz de base de datos
end
