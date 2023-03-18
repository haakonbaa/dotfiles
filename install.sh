#!/bin/sh

sudo apt update && sudo apt upgrade -y

sudo apt install i3 rofi zsh

wget https://raw.githubusercontent.com/newmanls/rofi-themes-collection/master/themes/spotlight-dark.rasi -O ./rofi/spotlight-dark.rasi
