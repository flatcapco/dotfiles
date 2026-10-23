#!/bin/bash
set -euo pipefail

# Bootstrap a new Mac from this repo.
# Deliberately does NOT use Mackup: symlinking macOS .plist files into a
# synced folder breaks cfprefsd (it rewrites plists atomically, replacing
# the symlink and replaying stale cached settings). Apps that support their
# own sync — e.g. iTerm2's "load preferences from a custom folder" — should
# use that instead.

DOTFILES="$HOME/.dotfiles"

echo "Setting up your Mac..."

if ! xcode-select -p &>/dev/null; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install
fi

if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no KEEP_ZSHRC=yes /bin/sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Symlink .zshrc using an ABSOLUTE path. The previous version used
# `ln -s ./.mackup.cfg $HOME/.mackup.cfg`, whose relative target resolved
# to itself and produced a self-referential link (ELOOP).
ln -sfn "$DOTFILES/.zshrc" "$HOME/.zshrc"

# oh-my-zsh custom plugins live in $DOTFILES (ZSH_CUSTOM), not in ~/.oh-my-zsh
if [ ! -d "$DOTFILES/plugins/artisan" ]; then
  git clone --depth 1 https://github.com/jessarcher/zsh-artisan.git \
    "$DOTFILES/plugins/artisan"
fi
chmod -R go-w "$DOTFILES/plugins"

brew update
brew bundle --file "$DOTFILES/Brewfile"

mkdir -p "$HOME/Sites"

echo
echo "Done. Remaining manual steps:"
echo "  * iTerm2 > Settings > General > Settings:"
echo "      enable 'Load settings from a custom folder or URL'"
echo "      point it at ~/Dropbox/iterm2  (do NOT symlink the plist)"
echo "  * Review and run ./.macos if you want the macOS defaults."
