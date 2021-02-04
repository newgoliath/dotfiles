# .bashrc

#export PS1='\T [\u@\h \W]\#' <- bash prompt with timestamp

#set -x
#PS4='+ $(date "+%s.%N")\011 '
#exec 3>&2 2>/tmp/bashstart.$$.log
#set -x

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# powerline
ENABLE_POWERLINE="True"
if [ -n "$ENABLE_POWERLINE" ]; then
  if [ "$TERM" != "linux" ] && [ -f "/usr/local/bin/powerline-go" ]; then
      PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
    function _update_ps1() {
        PS1="$(/usr/local/bin/powerline-go -error $? -newline -modules nix-shell,venv,user,host,ssh,cwd,perms,git,hg,jobs,exit,root,vgo,kube)"
    }
  fi
fi

# HOMESHICK
#  git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
#  printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
ENABLE_HOMESHICK="True"
if [ -n "$ENABLE_HOMESHICK" ]; then
  source "$HOME/.homesick/repos/homeshick/homeshick.sh"
  source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
fi

[ -f /usr/java/jre1.8.0_131/bin/ ] && export PATH=$PATH:/usr/java/jre1.8.0_131/bin/

[ -f $HOME/.local/lib/aws/bin/ ] && export PATH=$PATH:$HOME/.local/lib/aws/bin/


#echo bash completion
# mac brew based bash_completions
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
#set -x

# Judd's favorite aliases
set -o vi
alias ll='ls -la'
alias lh='ls -lah'
alias lz='ls -luthra'
alias dpl='cd ~/newgoliath/ocp4_advanced_deployment/'
alias app='cd ~/newgoliath/ocp_advanced_development/'

# global redirection
#exec 2>&3 3>&-

# python
[ -d /usr/local/opt/python/libexec/bin ] && export PATH=$PATH:/$HOME/bin:/usr/local/opt/python/libexec/bin
## rhel python
[ -x scl_source ] && source scl_source enable rh-python36

# thefuck
[ -x /usr/local/bin/fuck ] && eval $(thefuck --alias)

# add pageing to ripgrep
rg() {
    if [ -t 1 ]; then
        command rg -p "$@" | less -RFX
    else
        command rg "$@"
    fi
}

# fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Perl
export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:$HOME/perl5";
export PERL_MB_OPT="--install_base $HOME/perl5";
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5";
export PERL5LIB="$HOME/perl5/lib/perl5:$PERL5LIB";
export PATH="$HOME/perl5/bin:$PATH";

# Mac Raku
[ -f /Applications/Rakudo ] && export PATH=$PATH:/Applications/Rakudo/bin:/Applications/Rakudo/share/perl6/site/bin

# Ansible
export ANSIBLE_NOCOWS=1

#set +x
