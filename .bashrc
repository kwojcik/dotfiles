parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\W\[\e[1;35m\]$(parse_git_branch)\[\e[0m\]\$ '

# git shell prompt
#if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
#  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
#  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
#fi

if [ -f ~/.git-completion ]; then
    source ~/.git-completion
    __git_complete gco _git_checkout
fi
export GOPATH="$HOME/gocode"
export PATH="$PATH:$GOPATH/bin"
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PS1='\W $'

which hub > /dev/null && alias git=hub
alias ls='ls -G'
alias gitgraph='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gitrecent="git for-each-ref --sort='-committerdate' --format='%(committerdate)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"
alias gsheet='pbcopy && open -a /Applications/Google\ Chrome.app https://sheets.google.com/create'

alias grim='git rebase -i master'
alias grm='git rebase master'
alias grc='git rebase --continue'
alias gro='git rebase --onto'
alias gau='git add -u'
alias gc='git commit -a -m '
alias gco='git checkout'
alias gcob='git checkout -b'
alias gb='git branch'
alias gs='git status'
alias vim=nvim
alias be='bundle exec'
alias ssb='starscope --quiet -e cscope'


# lol...
alias :e=vim

# csb <file suffix> generates a cscope index for all files of that type
alias csb='function _f(){ find "$1" -name "*.$2" > cscope.files; cscope -b; }; _f'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias pbcopy='xclip -sel clip';
    alias pbpaste='xclip -sel clip -o';
fi

function ci() {
  if [ "$#" -eq 0 ]; then
    current_branch=`git branch | grep \* | cut -d ' ' -f2`
    open "https://ci.appfolio.net/project.html?projectId=ApmBundle&tab=projectOverview&branch_ApmBundle=$current_branch"
  else
    open "https://ci.appfolio.net/project.html?projectId=ApmBundle&tab=projectOverview&branch_ApmBundle=$1"
  fi
}
