source ~/.uber_profile # if I'm on work compooter
source ~/.git-completion
export GOPATH="$HOME/gocode"
export PATH="$PATH:$GOPATH/bin"

alias git=hub
alias ls='ls -G'
alias gitgraph='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gsheet='pbcopy && open -a /Applications/Google\ Chrome.app https://sheets.google.com/create'
