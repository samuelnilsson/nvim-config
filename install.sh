#!/bin/bash

# Install Plug
BASEDIR=$(dirname "$0")
curl -fLo $BASEDIR/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
