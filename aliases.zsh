
# Shortcuts
alias reloadshell="source $HOME/.zshrc"
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias knownhosts="subl $HOME/.ssh/known_hosts"
alias aliases="subl $HOME/.dotfiles/aliases.zsh"
alias zshconfig="subl $HOME/.zshrc"
alias ohmyzsh="subl $HOME/.oh-my-zsh"


alias c="clear"

alias nrp="npm run production"
alias nrw="npm run watch"


# Directories
alias dotfiles= "cd $HOME/.dotfiles"

alias sites="cd $HOME/Sites"

alias ls='ls -G'


# Laravel
alias pa="php artisan"

alias mfs="php artisan migrate:fresh --seed"

alias tinker='php artisan tinker'

alias pac='php artisan cache:clear;php artisan config:clear;php artisan route:clear;php artisan view:clear;php artisan clear-compiled;composer dump-autoload;'


alias rpint="vendor/bin/rector process; pint;"

alias rpp="vendor/bin/rector process; pint; ./node_modules/.bin/prettier --write resources/**/*.blade.php"

# PHP

alias cda="composer dump-autoload" 

alias cfresh="rm -rf vendor/ composer.lock && composer i"

alias cu="composer show --no-dev --direct --name-only \
 | xargs composer require";

alias cud="grep -F -v -f \
    <(composer show --direct --no-dev --name-only | sort) \
    <(composer show --direct --name-only | sort) \
  | xargs composer require --dev"

# use ncu to do the same for npm




# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"



# Wordpress structure
alias plugins='cd $PWD/wp-content/plugins/'
alias themes='cd $PWD/wp-content/themes/'





