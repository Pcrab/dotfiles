### proxy
export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

### pure prompt
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

### plugins
zinit wait lucid for \
  light-mode OMZP::extract \
  light-mode OMZP::common-aliases \
  light-mode OMZP::python \
  OMZL::grep.zsh \
  OMZL::history.zsh \
  OMZL::key-bindings.zsh

zinit wait lucid for \
  zsh-users/zsh-autosuggestions \
  zdharma-continuum/fast-syntax-highlighting \
  zsh-users/zsh-completions \
  bindmap"^R -> ^H" atinit"
  zstyle :history-search-multi-word page-size 10
  zstyle :history-search-multi-word highlight-color fg=red,bold
  zstyle :plugin:history-search-multi-word reset-prompt-protect 1
  " \
    zdharma-continuum/history-search-multi-word \

################################
#        Custom scripts        #
################################
for file in $HOME/.zsh/*.zsh; do
  source "$file"
done
