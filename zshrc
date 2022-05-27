export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

# SSH
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

alias docker-compose=/usr/lib/docker/cli-plugins/docker-compose

# opam configuration
[[ ! -r /home/pcrab/.opam/opam-init/init.zsh ]] || source /home/pcrab/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

autoload -U promptinit; promptinit
prompt pure
