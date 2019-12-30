export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/google-chrome-unstable

# No system beep sound
# setterm -blength -0
# set bell-style none

# Variable exports
[[ -f $HOME/.exports ]] && . $HOME/.exports
