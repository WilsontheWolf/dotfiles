# Oh my zsh stuff
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="wilson"
source $ZSH/oh-my-zsh.sh
# Make git signing work
export GPG_TTY=$(tty)
# Custom env varibles
export EDITOR=nano
export THEOS_DEVICE_IP=phone
export NODE_ENV=development
# Yarn Upgrade Interactive
alias yui="yarn upgrade-interactive --latest"

# Per machine settings 
if [ -x "$HOME/.profile_custom" ]
then
  "$HOME/.profile_custom"
fi

