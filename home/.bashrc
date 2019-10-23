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

function _update_ps1() {
    PS1="$(/usr/local/bin/powerline-go -error $? -newline -modules nix-shell,venv,user,host,ssh,cwd,perms,git,hg,jobs,exit,root,vgo,kube)"
}

#if [ "$TERM" != "linux" ] && [ -f "/usr/local/bin/powerline-go" ]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi


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


export PATH=$PATH:/$HOME/bin:/usr/local/opt/python/libexec/bin
set -o vi
alias bastion=/Users/jmaltin/newgoliath/OPEN_Admin/tools/mac_cli/bastion
GITHUB_ACCOUNT=newgoliath
#eval $(thefuck --alias --enable-experimental-instant-mode)
eval $(thefuck --alias)

# add pageing to ripgrep
rg() {
    if [ -t 1 ]; then
        command rg -p "$@" | less -RFX
    else
        command rg "$@"
    fi
}

