if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 
alias ll='ls -la'
alias lh='ls -lah'
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/jmaltin/go/bin:$PATH"
export GOPATH="/Users/jmaltin/go"

#eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
