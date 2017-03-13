if [ -a ~/.uber_profile ]; then
    source ~/.uber_profile # if I'm on work compooter
fi

source ~/.git-completion
export GOPATH="$HOME/gocode"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/usr/local/cuda-8.0/bin"
export LD_LIBRARY_PATH="/usr/local/cuda-8.0/lib64"

which hub && alias git=hub
alias ls='ls -G'
alias gitgraph='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gsheet='pbcopy && open -a /Applications/Google\ Chrome.app https://sheets.google.com/create'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias pbcopy='xclip -sel clip';
    alias pbpaste='xclip -sel clip -o';
fi
