#!/usr/bin/env bash

# Copy dotfiles to your home directory.
# Files are copied interactively and renamed to prefix the filename with a dot.

cp -fi aliases ~/.aliases
cp -fi bash_profile ~/.bash_profile
cp -fi bashrc ~/.bashrc
cp -fi exports ~/.exports
cp -fi gitconfig ~/.gitconfig
cp -fi gitignore ~/.gitignore

print "\nPublish complete\n"