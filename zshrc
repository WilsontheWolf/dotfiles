
# Custom env varibles
export EDITOR=$(command -v micro || command -v nano)
export THEOS_DEVICE_IP=phone
export NODE_ENV=development

# Make git signing work
export GPG_TTY=$(tty)

# Per machine settings
setopt NULL_GLOB
for f in $HOME/.zshrc.d/*.sh; do
  source "$f"
done
unsetopt NULL_GLOB
