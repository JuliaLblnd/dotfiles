# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# For vim 42header
export USER='juleblon'
export MAIL='juleblon@learner.42.tech'

ex() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: ex <numéro> <nom_fonction>" >&2
        return 1
    fi

        local target_dir="."

        # Si le dossier courant s'appelle exXX, on remonte d'un cran
        if [[ "$(basename "$PWD")" =~ ^ex[0-9]+$ ]]; then
                target_dir=".."
    fi

        #local folder_name="ex$(printf "%02d" "$1")"
        local folder_name="ex${1}"
    local dir="${target_dir}/${folder_name}"
    local file="${dir}/$2.c"

    mkdir -p "$dir" && touch "$file" && vim "$file"
}
