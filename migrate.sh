#!/usr/bin/env bash

git clone --bare https://github.com/Pcrab/dotfiles.git $HOME/.cfg
cfg="git --git-dir=$HOME/.cfg --work-tree=$HOME"
$cfg config --local status.showUntrackedFiles no
$cfg checkout

$cfg remote set-url origin git@github.com:Pcrab/dotfiles.git

for filePath in $($cfg ls-files | grep ".asc$")
do
    decryptedFilePath=${filePath%.asc*}
    gpg -d $filePath > $decryptedFilePath
done
