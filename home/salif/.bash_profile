#
# ~/.bash_profile
#

export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR=micro
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$HOME/.local/bin:$HOME/.node_modules/bin
export npm_config_prefix=$HOME/.node_modules

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	read -p 'Hi! ' mcinp
	if [[ $mcinp == "hello" ]]; then
		echo "ok"
	else
		exec startx -- -keeptty
	fi
fi
