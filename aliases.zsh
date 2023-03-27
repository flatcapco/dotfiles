# Shortcuts
alias reloadshell="source $HOME/.zshrc"
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias knownhosts="subl $HOME/.ssh/known_hosts"
alias aliases="subl $DOTFILES/aliases.zsh"
alias zshconfig="subl $HOME/.zshrc"
alias ohmyzsh="subl $HOME/.oh-my-zsh"

alias s="subl"
alias photoshop="open -a /Applications/Adobe\ Photoshop\ 2021/Adobe\ Photoshop\ 2021.app"
alias illustrator="open -a /Applications/Adobe\ Illustrator\ 2021/Adobe\ Illustrator.app"

alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'

alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"

alias nrp="npm run production"
alias nrw="npm run watch"


# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"
#alias lara="sites && cd laravel/"
alias ls='ls -G'


# Laravel
alias pa="php artisan"
alias seed="php artisan db:seed"
alias mfs="php artisan migrate:fresh --seed"
alias tinker='php artisan tinker'
alias pac='php artisan cache:clear;php artisan config:clear;php artisan route:clear;php artisan view:clear;php artisan clear-compiled;composer dump-autoload;'


# PHP

alias cda="composer dump-autoload" 
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias composer="php -d memory_limit=-1 /opt/homebrew/bin/composer"



# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"


# Wordpress structure
alias plugins='cd $PWD/wp-content/plugins/'
alias themes='cd $PWD/wp-content/themes/'



# Git

alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"


