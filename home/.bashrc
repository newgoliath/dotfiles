# .bashrc

#set +x
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Powerline?
if command -v powerline -h >/dev/null 2>&1; then
	powerline-daemon -q
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
	if  uname -a | grep -q Darwin ; then
	  . /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
	else
	  . /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
	fi
fi



# HOMESHICK
#  git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
#  printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
homeshick --quiet refresh

export PATH=$PATH:/usr/java/jre1.8.0_131/bin/

set -o vi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#if [ -e $HOME/.rvm/bin ]; then
#	export PATH="$PATH:$HOME/.rvm/bin"
#fi

# mac brew based bash_completions
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
#set -x

