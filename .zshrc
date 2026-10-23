# ~/.dotfiles/.zshrc  — symlinked to ~/.zshrc

# Homebrew must be initialised BEFORE oh-my-zsh, so that
# /opt/homebrew/share/zsh/site-functions is in $fpath when compinit runs.
# Without this ordering, brew-installed completions (git, gh, stripe, rclone…)
# are in $fpath but never registered.
if [[ -x /opt/homebrew/bin/brew ]] && [[ -z ${HOMEBREW_PREFIX-} ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export DOTFILES="$HOME/.dotfiles"
export ZSH="$HOME/.oh-my-zsh"

# ---- oh-my-zsh ----
ZSH_THEME="minimal"
ZSH_CUSTOM="$DOTFILES"
HIST_STAMPS="dd/mm/yyyy"
plugins=(artisan git composer)

# minimal theme (subnixr/minimal)
export MNML_INSERT_CHAR="$"
export MNML_PROMPT=(mnml_git mnml_keymap)
export MNML_RPROMPT=('mnml_cwd 20')

source "$ZSH/oh-my-zsh.sh"

# ---- locale ----
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ---- Laravel Herd ----
export PHP_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/:$PHP_INI_SCAN_DIR"
for _v in 74 80 81 82 83 84 85 86; do
  export "HERD_PHP_${_v}_INI_SCAN_DIR=$HOME/Library/Application Support/Herd/config/php/${_v}/"
done
unset _v
path=("$HOME/Library/Application Support/Herd/bin" $path)

export NVM_DIR="$HOME/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] \
  && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# ---- extra PATH ----
# mysql-client@8.4 first: it matches the MySQL 8.x servers DBngin runs.
# brew's default mysql-client is 9.x, whose mysqldump output and auth
# plugin handling are incompatible with 8.0/8.4 servers.
path=("$HOME/bin" "$HOME/.local/bin" \
      /opt/homebrew/opt/mysql-client@8.4/bin \
      /opt/homebrew/opt/mysql-client/bin $path)
typeset -U path PATH
