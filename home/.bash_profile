if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
alias ll='ls -la'
alias lh='ls -lah'
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/jmaltin/go/bin:$PATH"
export GOPATH="/Users/jmaltin/go"

#eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# opam configuration
test -r /Users/jmaltin/.opam/opam-init/init.sh && . /Users/jmaltin/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
# .bash_profile

# User specific environment and startup programs
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
