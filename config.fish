if status is-interactive
    # Make git signing work
    set -gx GPG_TTY $(tty)
end

# Custom env varibles
set -gx EDITOR $(command -v micro || command -v nano)
set -gx THEOS_DEVICE_IP phone
set -gx NODE_ENV development

# Path stuff
fish_add_path -P /usr/games
fish_add_path -P ~/.local/bin
fish_add_path -P ~/bin
if test -d ~/.cargo/bin
    fish_add_path -P ~/.cargo/bin
end
if test -d ~/.nvm
    set -gx NVM_DIR "$HOME/.nvm"
    bass source ~/.nvm/nvm.sh
    fish_add_path -P (yarn global bin)
end

if test -d ~/theos
    set -gx THEOS "$HOME/theos"
end

if test -d /opt/procursus
	fish_add_path -P /opt/procursus/bin /opt/procursus/sbin /opt/procursus/games
	set -x CPATH "$CPATH:/opt/procursus/include"
	set -x LIBRARY_PATH "$LIBRARY_PATH:/opt/procursus/lib"
end

# Abbriviations
abbr --add yui yarn upgrade-interactive --latest

# Fish variables
set -g fish_handle_reflow 1
set -g fish_greeting
