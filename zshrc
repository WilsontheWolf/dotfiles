# Oh my zsh stuff
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="wilson"
source $ZSH/oh-my-zsh.sh
# The Fuck
#eval "$(thefuck --alias)"
# Make git signing work
export GPG_TTY=$(tty)
# Custom env varibles
export EDITOR=nano
export THEOS=~/theos
export THEOS_DEVICE_IP=phone
export NODE_ENV=development
# Custom Path
export PATH=$THEOS/toolchain/ios-arm64e-clang-toolchain:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
# Rust/cargo stuff
source "$HOME/.cargo/env"
# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# Yarn Upgrade Interactive
alias yui="yarn upgrade-interactive --latest"
# Swift
export PATH="$HOME/projects/swift/toolchain/usr/bin:$PATH"
