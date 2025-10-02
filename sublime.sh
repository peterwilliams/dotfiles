#!/bin/bash

DOTFILES_DIR="$HOME/development/code/dotfiles"

ln -sfv $DOTFILES_DIR/sublimetext/Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text/Packages/User/Default\ \(OSX\).sublime-keymap
ln -sfv $DOTFILES_DIR/sublimetext/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text/Packages/User/Preferences.sublime-settings
ln -sfv $DOTFILES_DIR/sublimetext/ColorHighlighter.sublime-settings ~/Library/Application\ Support/Sublime\ Text/Packages/User/ColorHighlighter.sublime-settings
ln -sfv $DOTFILES_DIR/sublimetext/OmniMarkupPreviewer.sublime-settings ~/Library/Application\ Support/Sublime\ Text/Packages/User/OmniMarkupPreviewer.sublime-settings
