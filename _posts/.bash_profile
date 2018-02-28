# For use in brew cask install xxx
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
#export HOMEBREW_CASK_OPTS="--appdir=~/Applications --caskroom=~/Caskroom"

alias sbp='source ~/.bash_profile'
alias rs='exec -l $SHELL'
alias ll='ls -lri'
alias dir='ls -alr'

alias gwm='cd ~/gits/wilsonmar/wilsonmar.github.io;git status'
alias gs='git status'
alias gf='cd ~/gits/wilsonmar/futures;git status'

alias gb='git branch -avv'
alias gl='clear;git status;git log --pretty=format:"%h %s %ad" --graph --since=1.days --date=relative;git log --show-signature -n 1'
alias gbs='git status;git add . -A;git commit -m"Update";git push'
function gas() { git status ;  git add . -A ; git commit -m "$1" ; git push; }
alias bs='bundle exec jekyll serve --config _config.yml,_config_dev.yml'

alias gcs='cd ~/.google-cloud-sdk'
alias myip="ifconfig en0 | grep inet | grep -v inet6 | cut -d ' ' -f2"
alias aih='iothub-explorer'

export GPG_TTY=$(tty)