PATH=~/bin
# Use Homebrew Python instead of system
PATH=$PATH:/usr/local/opt/python/libexec/bin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/bin
PATH=$PATH:/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/sbin
export PATH

export CLICOLOR=1
export BASH_SILENCE_DEPRECATION_WARNING=1

# Load the shell dotfiles, and then some:
# * ~/.private can be used for other settings you don’t want to commit.
for file in ~/.{aliases,bash_prompt,functions,private}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Homebrew config
eval "$(/opt/homebrew/bin/brew shellenv)"

export HOMEBREW_NO_UPGRADE_AUTO_UPDATES_CASKS=1

# bash autocompletion (git, etc)
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

