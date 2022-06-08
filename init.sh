#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
[ ! -d "$HOME"/.config ] && mkdir -p "$HOME"/.config

# zsh
rm -rf ~/.zsh
ln -s "${BASEDIR}"/zshrc ~/.zshrc
ln -s "${BASEDIR}"/zsh ~/.zsh

# git
ln -s "${BASEDIR}"/gitconfig ~/.gitconfig

# Graphics
ln -s "${BASEDIR}"/pam_environment ~/.pam_environment

# Aria2
[ ! -d "$HOME"/.config/aria2 ] && mkdir -p "$HOME"/.config/aria2
ln -s "${BASEDIR}"/aria2.conf ~/.config/aria2/aria2.conf

# Custom bins
ln -s "${BASEDIR}"/bin ~/.local/bin

# fontconfig
[ ! -d "$HOME"/.config/fontconfig ] && mkdir -p "$HOME"/.config/fontconfig
ln -s "${BASEDIR}"/fonts.conf ~/.config/fontconfig/fonts.conf

# gnupg
ln -s "${BASEDIR}"/gnupg/sshcontrol ~/.gnupg/sshcontrol
chmod 700 "${BASEDIR}"/gnupg
chmod 600 "${BASEDIR}"/gnupg/sshcontrol

# ssh
gpg -o "${BASEDIR}"/encrypted/ssh/config -d "${BASEDIR}"/ssh/config.gpg 
ln -s "${BASEDIR}"/encrypted/ssh/config ~/.ssh/config
chmod 700 "${BASEDIR}"/encrypted/ssh
chmod 600 "${BASEDIR}"/encrypted/ssh/config

# npm
[ ! -d "$HOME"/.config/npm ] && mkdir -p "$HOME"/.config/npm
ln -s "${BASEDIR}"/npmrc ~/.config/npm/npmrc

# rime
[ ! -d "$HOME"/.local/share/fcitx5/rime ] && mkdir -p "$HOME"/.local/share/fcitx5/rime 
ln -s "${BASEDIR}"/rime/default.custom.yaml ~/.local/share/fcitx5/rime/default.custom.yaml
ln -s "${BASEDIR}"/rime/custom.dict.yaml ~/.local/share/fcitx5/rime/custom.dict.yaml
ln -s "${BASEDIR}"/rime/double_pinyin_flypy ~/.local/share/fcitx5/rime/double_pinyin_flypy


# xkeysnail
[ ! -d "$HOME"/.config/xkeysnail ] && mkdir -p "$HOME"/.config/xkeysnail
ln -s "${BASEDIR}"/xkeysnail/config.py ~/.config/xkeysnail/config.py
[ ! -d "$HOME"/.config/systemd/user ] && mkdir -p "$HOME"/.config/systemd/user
ln -s "${BASEDIR}"/xkeysnail/xkeysnail.service ~/.config/systemd/user/xkeysnail.service
systemctl --user --now enable xkeysnail.service

