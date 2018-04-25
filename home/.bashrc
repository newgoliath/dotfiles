# .bashrc

#export PS1='\T [\u@\h \W]\#' <- bash prompt with timestamp

#set +x
#PS4='+ $(date "+%s.%N")\011 '
#exec 3>&2 2>/tmp/bashstart.$$.log
#set -x

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Powerline exists?
#if command -v powerline -h >/dev/null 2>&1; then
#  echo start powerline
#  POWERLINE_BASH_CONTINUATION=1
#	POWERLINE_BASH_SELECT=1
#  powerline-daemon -q
#	if  uname -a | grep -q Darwin ; then
#    echo darwin powerline
#	  . /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
#	else
#	  . /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
#	fi
#fi


if command -v /usr/local/bin/powerline-go -h >/dev/null 2>&1; then
  function _update_ps1() {
      PS1="$(/usr/local/bin/powerline-go -error $? -modules 'time,host,cwd,git,exit,root' -shell 'bash' -priority 'root,cwd,user,host,time,git-branch,git-status'  )"
  }

  if [ "$TERM" != "linux" ]; then
      PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
  fi
fi

#echo homeshick
# HOMESHICK
#  git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
#  printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
homeshick --quiet refresh

export PATH=$PATH:/usr/java/jre1.8.0_131/bin/
export PATH=$PATH:/Users/jmaltin/.local/lib/aws/bin/

set -o vi
alias ll='ls -l'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#if [ -e $HOME/.rvm/bin ]; then
#	export PATH="$PATH:$HOME/.rvm/bin"
#fi

#echo bash completion
# mac brew based bash_completions
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
#set -x

alias ll='ls -la'
alias lh='ls -lah'
alias lz='ls -luthra'
alias dpl='cd ~/newgoliath/ocp_advanced_deployment/'

#set +x
#exec 2>&3 3>&-


