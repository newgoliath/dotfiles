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

export PATH=$PATH:/usr/java/jre1.8.0_131/bin/
export PATH=$PATH:/Users/jmaltin/.local/lib/aws/bin/

set -o vi
alias ll='ls -l'

#echo bash completion
# mac brew based bash_completions
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
#set -x

alias ll='ls -la'
alias lh='ls -lah'
alias lz='ls -luthra'
alias dpl='cd ~/newgoliath/ocp_advanced_deployment/'

#exec 2>&3 3>&-

[ -d /usr/local/opt/python/libexec/bin ] && export PATH=$PATH:/$HOME/bin:/usr/local/opt/python/libexec/bin

[ -x /usr/local/bin/fuck ] && eval $(thefuck --alias)

# add pageing to ripgrep
rg() {
    if [ -t 1 ]; then
        command rg -p "$@" | less -RFX
    else
        command rg "$@"
    fi
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/home/jmaltin-redhat.com/perl5";
export PERL_MB_OPT="--install_base /home/jmaltin-redhat.com/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/jmaltin-redhat.com/perl5";
export PERL5LIB="/home/jmaltin-redhat.com/perl5/lib/perl5:$PERL5LIB";
export PATH="/home/jmaltin-redhat.com/perl5/bin:$PATH";

source scl_source enable rh-python36
