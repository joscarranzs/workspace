# Set the default editor
set -gx EDITOR nvim

# Common aliases
alias cdh="cd ~"
alias cl="clear"
alias ls="lsd"
alias la="lsd -a"
alias ll="lsd -l"
alias lla="lsd -l -a"
alias lg="lazygit"
alias create="mkdir"
alias delete="rm -rf"
alias back="cd .."
alias tm="tmux"
alias kill="tmux kill-server"
command -qv nvim && alias vim nvim

# Función para abrir Vim directamente en la interfaz FZF
function vfz
    fzf | read -l selected  # Captura la salida de `fzf` directamente en la variable `selected`
    if test -n "$selected"  # Verifica si se seleccionó algo
        vim $selected       # Abre el archivo seleccionado en Vim
    end
end

# Función para abrir Neovim directamente en la interfaz DBUI(Database User Interface)
function nvimdb
    nvim -c DBUI  # Abre Neovim y ejecuta el comando DBUI para iniciar la interfaz de base de datos
end

# Configuración de Homebrew(directamente desde brew shellenv)
set --global --export HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
set --global --export HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
set --global --export HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
fish_add_path --global --move --path "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin"

if test -n "$MANPATH[1]"
    set --global --export MANPATH '' "$MANPATH"
end

if not contains "/home/linuxbrew/.linuxbrew/share/info" "$INFOPATH"
    set --global --export INFOPATH "/home/linuxbrew/.linuxbrew/share/info" "$INFOPATH"
end
