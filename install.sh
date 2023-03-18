#!/bin/sh

sudo apt update && sudo apt upgrade -y

sudo apt install i3 rofi zsh

wget https://raw.githubusercontent.com/newmanls/rofi-themes-collection/master/themes/spotlight-dark.rasi -O ./download/spotlight-dark.rasi

git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/dotfiles/download/.zsh/spaceship"