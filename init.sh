#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
[ ! -d $HOME/.config ] && mkdir -p $HOME/.config

# zsh
ln -s ${BASEDIR}/zshrc ~/.zshrc
# p10k
ln -s ${BASEDIR}/p10k.zsh ~/.p10k.zsh

# git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig

# Graphics
ln -s ${BASEDIR}/pam_environment ~/.pam_environment

# Aria2
[ ! -d $HOME/.config/aria2 ] && mkdir -p $HOME/.config/aria2
ln -s ${BASEDIR}/aria2.conf ~/.config/aria2/aria2.conf

# Custom bins
ln -s ${BASEDIR}/bin ~/.local/bin

# fontconfig
[ ! -d $HOME/.config/fontconfig ] && mkdir -p $HOME/.config/fontconfig
ln -s ${BASEDIR}/fonts.conf ~/.config/fontconfig/fonts.conf

# oh-my-zsh
ln -s ${BASEDIR}/oh-my-zsh/mine.zsh ~/.oh-my-zsh/custom/mine.zsh
ln -s ${BASEDIR}/oh-my-zsh/custom ~/.oh-my-zsh/custom/mine
